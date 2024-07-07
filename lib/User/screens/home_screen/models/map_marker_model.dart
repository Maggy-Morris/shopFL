import 'package:latlong2/latlong.dart';

class MapMarkerModel {
  final String id;
   final String name;
  final String description;
  // final LatLng position;

  // final num discount;

  final String currency;
  final double discountPercentageFrom;
  final double discountPercentageTo;
  final double discountPercentage;

  final String endOfferDate;
  final double latitude;
  final double longitude;

  final String offerImage;
  final int offersDuration;
  final double originalPrice;
  final double priceAfterDiscount;
  final String sellerUid;
  final String shopImageUrl;
  final String shopName;
  final String showOffersDisplay;
  final String startOffersDate;

 

  MapMarkerModel(
{    this.currency = '',
    this.discountPercentageFrom =0,
    this.discountPercentageTo =0,
    this.discountPercentage =0,
    this.endOfferDate ='',
    this.latitude =0,
    this.longitude =0,
    this.offerImage ='',
    this.offersDuration =0,
    this.originalPrice =0,
    this.priceAfterDiscount=0,
    this.sellerUid = '',
    this.shopImageUrl = '',
    this.shopName = '',
    this.showOffersDisplay = '',
    this.startOffersDate = '', 
    // required this.discount,
    required this.id,
    required this.name,
    required this.description,
    // required this.position,
  });

  MapMarkerModel copyWith({
    num? discount,
    String? id,
    String? name,
    String? description,
    LatLng? position,
    String? currency,
    double? discountPercentageFrom,
    double? discountPercentageTo,
    double? discountPercentage,
    String? endOfferDate,
    double? latitude,
    double? longitude,
    String? offerImage,
    int? offersDuration,
    double? originalPrice,
    double? priceAfterDiscount,
    String? sellerUid,
    String? shopImageUrl,
    String? shopName,
    String? showOffersDisplay,
    String? startOffersDate,
  }) {
    return MapMarkerModel(
      // discount: discount ?? this.discount,
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      // position: position ?? this.position,

        currency: currency ?? this.currency,
      discountPercentageFrom: discountPercentageFrom ?? this.discountPercentageFrom,
      discountPercentageTo: discountPercentageTo ?? this.discountPercentageTo,
      discountPercentage: discountPercentage ?? this.discountPercentage,
      endOfferDate: endOfferDate ?? this.endOfferDate,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      offerImage: offerImage ?? this.offerImage,
      offersDuration: offersDuration ?? this.offersDuration,
      originalPrice: originalPrice ?? this.originalPrice,
      priceAfterDiscount: priceAfterDiscount ?? this.priceAfterDiscount,
      sellerUid: sellerUid ?? this.sellerUid,
      shopImageUrl: shopImageUrl ?? this.shopImageUrl,
      shopName: shopName ?? this.shopName,
      showOffersDisplay: showOffersDisplay ?? this.showOffersDisplay,
      startOffersDate: startOffersDate ?? this.startOffersDate,

    );
  }

  Map<String, dynamic> toMap() {
    return {
      // 'discount': discount,
      'id': id,
      'name': name,
      'description': description,
      // 'position': {
      //   'latitude': position.latitude,
      //   'longitude': position.longitude,

      // },
      'currency': currency,
      'discountPercentageFrom': discountPercentageFrom,
      'discountPercentageTo': discountPercentageTo,
      'discountPercentage': discountPercentage,
      'endOfferDate': endOfferDate,
      'latitude': latitude,
      'longitude': longitude,
      'offerImage': offerImage,
      'offersDuration': offersDuration,
      'originalPrice': originalPrice,
      'priceAfterDiscount': priceAfterDiscount,
     'sellerUid': sellerUid,
     'shopImageUrl': shopImageUrl,
     'shopName': shopName,
     'showOffersDisplay': showOffersDisplay,
     'startOffersDate': startOffersDate,


    };
  }

  factory MapMarkerModel.fromMap(Map<String, dynamic> map) {
    return MapMarkerModel(
      // discount: map['discount'],
      id: map['id'],
      name: map['name'],
      description: map['description'],
      // position: LatLng(
      //   map['position']['latitude'],
      //   map['position']['longitude'],
      // ),
      currency: map['currency'],
      discountPercentageFrom: map['discountPercentageFrom'],
      discountPercentageTo: map['discountPercentageTo'],
      discountPercentage: map['discountPercentage'],
      endOfferDate: map['endOfferDate'],

      latitude: map['latitude'],
      longitude: map['longitude'],
      offerImage: map['offerImage'],
      offersDuration: map['offersDuration'],
      originalPrice: map['originalPrice'],
      priceAfterDiscount: map['priceAfterDiscount'],
      sellerUid: map['sellerUid'],
      shopImageUrl: map['shopImageUrl'],
      shopName: map['shopName'],
      showOffersDisplay: map['showOffersDisplay'],
      startOffersDate: map['startOffersDate'],

    );
  }
}
