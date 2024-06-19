import 'dart:io';

import 'package:flutter/material.dart';
import 'package:foodpanda_seller/common/firebare_storage_repository.dart';
import 'package:image_picker/image_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegisterOnlineStoreProvider extends ChangeNotifier {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  // List<Branches>? _branchesList;
  // List<Branches>? get branchesList => _branchesList;

  // bool _isRegistered = false;
  // bool get isRegistered => _isRegistered;

  String? _shopLink;
  String? get shopLink => _shopLink;

  String? _offersDuration;
  String? get offersDuration => _offersDuration;

  String? _startOffersDate;
  String? get startOffersDate => _startOffersDate;

  // String? _endOffersDate;
  // String? get endOffersDate => _endOffersDate;

  // String? _offerImage;
  // String? get offerImage => _offerImage;

  // Address? _shopAddress;
  // Address? get shopAddress => _shopAddress;

  // String? _originalPrice;
  // String? get originalPrice => _originalPrice;

  // String? _priceAfterDiscount;
  // String? get priceAfterDiscount => _priceAfterDiscount;

  // String? _discountPercentage;
  // String? get discountPercentage => _discountPercentage;
  String? _discountPercentageFrom;
  String? get discountPercentageFrom => _discountPercentageFrom;
  String? _discountPercentageTo;
  String? get discountPercentageTo => _discountPercentageTo;

  String? _shopCategories;
  String? get shopCategories => _shopCategories;

  // List<String> _offerImages = [];
  // List<String> get offerImages => _offerImages;
  Future addOnlineStore({
    required String shopLink,
    required String offersDuration,
    required String startOffersDate,
    // required String endOffersDate,
    // required String originalPrice,
    required String shopCategories,
    // required String discountPercentage,
    required String discountPercentageFrom,
    required String discountPercentageTo,
    // required String priceAfterDiscount,
    // required Address address,
    // required List<Branches> branchesList,
    // XFile? image,
    // String? imageUrl,
  }) async {
    // String offerImage;
    // if (image != null) {
    //   offerImage = await storeFileToFirebase(
    //     'seller/${firebaseAuth.currentUser!.uid}/offerImage',
    //     File(image.path),
    //   );
    // } else {
    //   offerImage = imageUrl!;
    // }
    final ref = firestore
        .collection('sellers')
        .doc(firebaseAuth.currentUser!.uid)
        .collection('onlineStore')
        .doc();
    await ref.set(
      {
        "id": ref.id,
        "shopLink": shopLink,
        "offersDuration": offersDuration,
        "startOffersDate": startOffersDate,
        // "endOffersDate": endOffersDate,
        // "originalPrice": originalPrice,
        // "priceAfterDiscount": priceAfterDiscount,
        // "discountPercentage": discountPercentage,
        "shopCategories": shopCategories,
        // "offerImage": offerImage,
        "discountPercentageFrom": discountPercentageFrom,
        "discountPercentageTo": discountPercentageTo,

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
    _shopLink = shopLink;
    _offersDuration = offersDuration;
    // _offerImage = offerImage;
    // _shopAddress = address;
    // _originalPrice = originalPrice;
    // _priceAfterDiscount = priceAfterDiscount;
    // _discountPercentage = discountPercentage;
    _discountPercentageTo = discountPercentageTo;

    _discountPercentageFrom = discountPercentageFrom;

    _shopCategories = shopCategories;

    notifyListeners();
  }

  // Future<List<String>> fetchOfferImages() async {
  //   final ref = firestore
  //       .collection('sellers')
  //       .doc(firebaseAuth.currentUser!.uid)
  //       .collection('offers');

  //   final snapshot = await ref.get();
  //   final List<String> imageUrls = [];

  //   for (var doc in snapshot.docs) {
  //     if (doc.data().containsKey('offerImage')) {
  //       imageUrls.add(doc.data()['offerImage'] as String);
  //     }
  //   }

  //   _offerImages = imageUrls;
  //   notifyListeners();
  //   return _offerImages;
  // }
}
