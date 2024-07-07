import 'dart:io';

import 'package:anwer_shop/providers/models/shop_model.dart';
import 'package:flutter/material.dart';
import 'package:anwer_shop/common/firebare_storage_repository.dart';
import 'package:image_picker/image_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegisterOfferProvider extends ChangeNotifier {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  // List<Branches>? _branchesList;
  // List<Branches>? get branchesList => _branchesList;

  // bool _isRegistered = false;
  // bool get isRegistered => _isRegistered;

  String? _showOffersDisplay;
  String? get showOffersDisplay => _showOffersDisplay;

  int? _offersDuration;
  int? get offersDuration => _offersDuration;

  String? _startOffersDate;
  String? get startOffersDate => _startOffersDate;

  String? _endOffersDate;
  String? get endOffersDate => _endOffersDate;

  String? _offerImage;
  String? get offerImage => _offerImage;

  // Address? _shopAddress;
  // Address? get shopAddress => _shopAddress;

  double? _originalPrice;
  double? get originalPrice => _originalPrice;

  double? _priceAfterDiscount;
  double? get priceAfterDiscount => _priceAfterDiscount;

  double? _discountPercentage;
  double? get discountPercentage => _discountPercentage;
  double? _discountPercentageFrom;
  double? get discountPercentageFrom => _discountPercentageFrom;
  double? _discountPercentageTo;
  double? get discountPercentageTo => _discountPercentageTo;

  String? _currency;
  String? get currency => _currency;

  double? _latitude;
  double? get latitude => _latitude;
  double? _longitude;
  double? get longitude => _longitude;

  String? _email;
  String? get email => _email;
  String? _imageUrl;
  String? get imageUrl => _imageUrl;

  String? _uid;
  String? get uid => _uid;

  String? _shopName;
  String? get shopName => _shopName;

  String? _role;
  String? get role => _role;

  List<String> _offerImages = [];
  List<String> get offerImages => _offerImages;

  Future addOffer({
    required String showOffersDisplay,
    required int offersDuration,
    required String startOffersDate,
    required String endOffersDate,
    required double originalPrice,
    required String currency,
    required double discountPercentage,
    required double discountPercentageFrom,
    required double discountPercentageTo,
    required double priceAfterDiscount,
    // required Address address,
    // required List<Branches> branchesList,
    XFile? image,
    String? imageUrl,
  }) async {
    String offerImage;
    if (image != null) {
      offerImage = await storeFileToFirebase(
        'seller/${firebaseAuth.currentUser!.uid}/offerImage',
        File(image.path),
      );
    } else {
      offerImage = imageUrl!;
    }

    final ref = firestore
        // .collection('sellers')
        // .doc(firebaseAuth.currentUser!.uid)
        .collection('offers')
        .doc();

    final shopData =
        await getUserDataFromFirestore(firebaseAuth.currentUser?.uid);
    // final SharedPreferences sharedPreferences =
    //     await SharedPreferences.getInstance();
    // String shopNameSP = sharedPreferences.getString('shopName') ?? "";
    await ref.set(
      {
        "id": ref.id,
        "shopName": _shopName,

        "showOffersDisplay": showOffersDisplay,
        "offersDuration": offersDuration,
        "startOffersDate": startOffersDate,
        "endOffersDate": endOffersDate,
        "originalPrice": originalPrice,
        "priceAfterDiscount": priceAfterDiscount,
        "discountPercentage": discountPercentage,
        "currency": currency,
        "offerImage": offerImage,
        "discountPercentageFrom": discountPercentageFrom,
        "discountPercentageTo": discountPercentageTo,

        // "rating": 0,

        // 'area': address.area,
        // 'floor': address.floor,
        // 'houseNumber': address.houseNumber,
        'latitude': shopData.latitude,
        'longitude': shopData.longitude,
        'email': shopData.email,
        'shopImageUrl': shopData.shopImage,
        'sellerUid': firebaseAuth.currentUser?.uid,

        // 'province': address.province,
        // 'street': address.street,
        // 'branchesList': branchesList.map((branch) => branch.toMap()).toList(),
      },
      SetOptions(merge: true),
    );

    // _branchesList = branchesList;
    // _isRegistered = true;
    _showOffersDisplay = showOffersDisplay;
    _offersDuration = offersDuration;
    _offerImage = offerImage;
    // _shopAddress = address;
    _originalPrice = originalPrice;
    _priceAfterDiscount = priceAfterDiscount;
    _discountPercentage = discountPercentage;
    _discountPercentageTo = discountPercentageTo;

    _discountPercentageFrom = discountPercentageFrom;

    _currency = currency;

    notifyListeners();
  }

  Future<List<String>> fetchOfferImages() async {
    final uid = firebaseAuth.currentUser?.uid;

    // final ref = firestore
    // .collection('sellers')
    // .doc(firebaseAuth.currentUser!.uid)
    // .collection('offers');
    final ref =
        firestore.collection('offers').where('sellerUid', isEqualTo: uid);

    final snapshot = await ref.get();
    final List<String> imageUrls = [];

    for (var doc in snapshot.docs) {
      if (doc.data().containsKey('offerImage')) {
        imageUrls.add(doc.data()['offerImage'] as String);
      }
    }

    _offerImages = imageUrls;
    notifyListeners();
    return _offerImages;
  }

  Future<ShopModel> getUserDataFromFirestore(uid) async {
    await FirebaseFirestore.instance
        .collection('sellers')
        .doc(uid)
        .get()
        .then((DocumentSnapshot snapshot) => {
              _uid = snapshot['uid'],
              _role = snapshot['role'],
              _shopName = snapshot['shopName'],
              _email = snapshot['email'],
              _longitude = snapshot['longitude'],
              _latitude = snapshot['latitude'],
              _imageUrl = snapshot['shopImage'],
            });

    notifyListeners();
    return ShopModel(
      id: _uid,
      email: _email,
      name: _shopName,
      latitude: _latitude,
      longitude: _longitude,
      shopImage: _imageUrl,
      // role: _role,
    );
  }
}
