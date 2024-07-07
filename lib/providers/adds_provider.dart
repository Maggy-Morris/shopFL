import 'dart:io';

import 'package:flutter/material.dart';
import 'package:anwer_shop/common/firebare_storage_repository.dart';
import 'package:image_picker/image_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'models/shop_model.dart';

class RegisterAddsProvider extends ChangeNotifier {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  // List<Branches>? _branchesList;
  // List<Branches>? get branchesList => _branchesList;

  bool _shopRelated = false;
  bool get shopRelated => _shopRelated;

  bool _anotherShop = false;
  bool get anotherShop => _anotherShop;

  int? _addDuration;
  int? get addDuration => _addDuration;

  String? _startAddsDate;
  String? get startAddsDate => _startAddsDate;

  String? _endAddsDate;
  String? get endAddsDate => _endAddsDate;

  String? _addImage;
  String? get addImage => _addImage;

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
  // Address? _shopAddress;
  // Address? get shopAddress => _shopAddress;

  // String? _originalPrice;
  // String? get originalPrice => _originalPrice;

  // String? _priceAfterDiscount;
  // String? get priceAfterDiscount => _priceAfterDiscount;

  // String? _discountPercentage;
  // String? get discountPercentage => _discountPercentage;
  // String? _discountPercentageFrom;
  // String? get discountPercentageFrom => _discountPercentageFrom;
  // String? _discountPercentageTo;
  // String? get discountPercentageTo => _discountPercentageTo;

  // String? _currency;
  // String? get currency => _currency;

  List<String> _addImages = [];
  List<String> get addImages => _addImages;
  Future addAdds({
    required bool anotherShop,
    required bool shopRelated,
    required int addsDuration,
    required String startAddsDate,
    required String endAddsDate,
    // required String originalPrice,
    // required String currency,
    // required String discountPercentage,
    // required String discountPercentageFrom,
    // required String discountPercentageTo,
    // required String priceAfterDiscount,
    // required Address address,
    // required List<Branches> branchesList,
    XFile? image,
    String? imageUrl,
  }) async {
    String addImage;
    if (image != null) {
      addImage = await storeFileToFirebase(
        'seller/${firebaseAuth.currentUser!.uid}/addImage',
        File(image.path),
      );
    } else {
      addImage = imageUrl!;
    }
    final shopData =
        await getUserDataFromFirestore(firebaseAuth.currentUser?.uid);

    final ref = firestore
        // .collection('sellers')
        // .doc(firebaseAuth.currentUser!.uid)
        .collection('Adds')
        .doc();

    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    String shopNameSP = sharedPreferences.getString('shopName') ?? "";

    await ref.set(
      {
        "shopId": firebaseAuth.currentUser!.uid,
        // 'latitude': address.latitude,
        // 'longitude': address.longitude,
        "shopName": shopNameSP,
        "id": ref.id,
        "shopRelated": shopRelated,
        "anotherShop": anotherShop,

        "addsDuration": addsDuration,
        "startAddsDate": startAddsDate,
        "endAddsDate": endAddsDate,
        "addImage": addImage,
        'latitude': shopData.latitude,
        'longitude': shopData.longitude,
        'email': shopData.email,
        'shopImageUrl': shopData.shopImage,
        'sellerUid': firebaseAuth.currentUser?.uid,

        // "originalPrice": originalPrice,
        // "priceAfterDiscount": priceAfterDiscount,
        // "discountPercentage": discountPercentage,
        // "currency": currency,
        // "discountPercentageFrom": discountPercentageFrom,
        // "discountPercentageTo": discountPercentageTo,

        // "rating": 0,

        // 'area': address.area,
        // 'floor': address.floor,
        // 'houseNumber': address.houseNumber,
        // 'latitude': address.latitude,
        // 'longitude': address.longitude,
        // 'province': address.province,
        // 'street': address.street,
        // 'branchesList': branchesList.map((branch) => branch.toMap()).toList(),
      },
      SetOptions(merge: true),
    );

    // _branchesList = branchesList;
    // _isRegistered = true;
    _shopRelated = shopRelated;
    _anotherShop = anotherShop;
    _addDuration = addDuration;
    _addImage = addImage;
    _startAddsDate = startAddsDate;
    _endAddsDate = endAddsDate;

    // _shopAddress = address;
    // _originalPrice = originalPrice;
    // _priceAfterDiscount = priceAfterDiscount;
    // _discountPercentage = discountPercentage;
    // _discountPercentageTo = discountPercentageTo;

    // _discountPercentageFrom = discountPercentageFrom;

    // _currency = currency;

    notifyListeners();
  }

  Future<List<String>> fetchAddImages() async {
    final uid = firebaseAuth.currentUser?.uid;

    final ref = firestore.collection('Adds').where('sellerUid', isEqualTo: uid);
    // final ref = firestore
    //     .collection('sellers')
    //     .doc(firebaseAuth.currentUser!.uid)
    //     .collection('Adds');

    final snapshot = await ref.get();
    final List<String> imageUrls = [];

    for (var doc in snapshot.docs) {
      if (doc.data().containsKey('addImage')) {
        imageUrls.add(doc.data()['addImage'] as String);
      }
    }

    _addImages = imageUrls;
    notifyListeners();
    return _addImages;
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
