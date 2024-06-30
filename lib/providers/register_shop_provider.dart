import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:anwer_shop/models/address.dart';
import 'package:image_picker/image_picker.dart';

import '../common/firebare_storage_repository.dart';
import '../widgets/branches_widget.dart';

class ShopInfo {
  final List<Branches>? branchesList;

  final String? shopName;
  final String? shopDescription;
  final String? shopCategories;
  final String? shopType;
  final String? addressWritten;
  final String? shopWebsite;
  final String? shopEmail;
  final String? shopPhoneNumber;
  final String? shopImage;
  final Address? shopAddress;
  final bool isRegistered;

  ShopInfo({
    this.branchesList,
    this.shopName,
    this.shopDescription,
    this.shopCategories,
    this.shopType,
    this.addressWritten,
    this.shopWebsite,
    this.shopEmail,
    this.shopPhoneNumber,
    this.shopImage,
    this.shopAddress,
    required this.isRegistered,
  });
}

class RegisterShopProvider extends ChangeNotifier {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  List<Branches>? _branchesList;
  List<Branches>? get branchesList => _branchesList;

  bool _isRegistered = false;
  bool get isRegistered => _isRegistered;

  String? _shopName;
  String? get shopName => _shopName;

  String? _shopDescription;
  String? get shopDescription => _shopDescription;

  String? _shopCategories;
  String? get shopCategories => _shopCategories;

  String? _shopType;
  String? get shopType => _shopType;

  String? _shopImage;
  String? get shopImage => _shopImage;

  Address? _shopAddress;
  Address? get shopAddress => _shopAddress;

  String? _addressWritten;
  String? get addressWritten => _addressWritten;

  String? _shopWebsite;
  String? get shopWebsite => _shopWebsite;

  String? _shopEmail;
  String? get shopEmail => _shopEmail;

  String? _shopPhoneNumber;
  String? get shopPhoneNumber => _shopPhoneNumber;

  RegisterShopProvider() {
    checkIfAddressExist();
  }

  Future<ShopInfo> checkIfAddressExist() async {
    List<Branches> branchesList = [];

    await firestore
        .collection('sellers')
        .doc(firebaseAuth.currentUser!.uid)
        .get()
        .then((DocumentSnapshot doc) {
      if (doc.data().toString().contains('branchesList')) {
        branchesList = List<Branches>.from(
          doc.get('branchesList').map((branch) => Branches.fromMap(branch)),
        );
      }

      _shopName =
          doc.data().toString().contains('shopName') ? doc.get('shopName') : '';

      _shopDescription = doc.data().toString().contains('shopDescription')
          ? doc.get('shopDescription')
          : '';
      _shopCategories = doc.data().toString().contains('shopCategories')
          ? doc.get('shopCategories')
          : '';
      _shopType =
          doc.data().toString().contains('shopType') ? doc.get('shopType') : '';
      _addressWritten = doc.data().toString().contains('addressWritten')
          ? doc.get('addressWritten')
          : '';
      _shopWebsite = doc.data().toString().contains('shopWebsite')
          ? doc.get('shopWebsite')
          : '';
      _shopEmail = doc.data().toString().contains('shopEmail')
          ? doc.get('shopEmail')
          : '';
      _shopPhoneNumber = doc.data().toString().contains('shopPhoneNumber')
          ? doc.get('shopPhoneNumber')
          : '';
      _shopImage = doc.data().toString().contains('shopImage')
          ? doc.get('shopImage')
          : '';

      String latitude = doc.data().toString().contains('latitude')
          ? doc.get('latitude').toString()
          : '';
      String longitude = doc.data().toString().contains('longitude')
          ? doc.get('longitude').toString()
          : '';

      if (latitude.isNotEmpty && longitude.isNotEmpty) {
        _shopAddress = Address(
          houseNumber: doc.data().toString().contains('houseNumber')
              ? doc.get('houseNumber')
              : '',
          street:
              doc.data().toString().contains('street') ? doc.get('street') : '',
          area: doc.data().toString().contains('area') ? doc.get('area') : '',
          latitude: double.parse(latitude),
          longitude: double.parse(longitude),
          province: doc.data().toString().contains('province')
              ? doc.get('province')
              : '',
          floor:
              doc.data().toString().contains('floor') ? doc.get('floor') : '',
        );
      }

      if (_shopDescription!.isEmpty ||
          _shopImage!.isEmpty ||
          latitude.isEmpty ||
          longitude.isEmpty) {
        _isRegistered = false;
      } else {
        _isRegistered = true;
      }
      notifyListeners();
    });

    _branchesList = branchesList;
    return ShopInfo(
      branchesList: branchesList,
      shopName: shopName,
      shopDescription: shopDescription,
      shopCategories: shopCategories,
      shopType: shopType,
      addressWritten: addressWritten,
      shopWebsite: shopWebsite,
      shopEmail: shopEmail,
      shopPhoneNumber: shopPhoneNumber,
      shopImage: shopImage,
      shopAddress: shopAddress,
      isRegistered: isRegistered,
    );
  }

  Future registerShop({
    required String shopType,
    required String shopCategories,
    required String shopAddress,
    required String shopPhoneNumber,
    required String shopEmail,
    required String shopWebsite,
    required String shopName,
    required String shopDescription,
    required Address address,
    required List<Branches> branchesList,
    XFile? image,
    String? imageUrl,
  }) async {
    String shopImage;
    if (image != null) {
      shopImage = await storeFileToFirebase(
        'seller/${firebaseAuth.currentUser!.uid}/profile',
        File(image.path),
      );
    } else {
      shopImage = imageUrl!;
    }

    await firestore
        .collection('sellers')
        .doc(firebaseAuth.currentUser!.uid)
        .set(
      {
        "shopName": shopName,
        "shopDescription": shopDescription,
        "shopCategories": shopCategories,
        "shopType": shopType,
        "addressWritten": shopAddress,
        "shopWebsite": shopWebsite,
        "shopEmail": shopEmail,
        "shopPhoneNumber": shopPhoneNumber,
        "shopImage": shopImage,
        "rating": 0,
        "totalRating": 0,
        'area': address.area,
        'floor': address.floor,
        'houseNumber': address.houseNumber,
        'latitude': address.latitude,
        'longitude': address.longitude,
        'province': address.province,
        'street': address.street,
        'branchesList': branchesList.map((branch) => branch.toMap()).toList(),
      },
      SetOptions(merge: true),
    );

    _branchesList = branchesList;
    _isRegistered = true;
    _shopName = shopName;
    _shopDescription = shopDescription;
    _shopImage = shopImage;
    _shopAddress = address;
    _addressWritten = shopAddress;
    _shopWebsite = shopWebsite;
    _shopEmail = shopEmail;
    _shopPhoneNumber = shopPhoneNumber;

    notifyListeners();
  }
}
