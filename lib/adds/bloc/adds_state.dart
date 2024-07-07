part of 'adds_bloc.dart';

class AddsState extends Equatable {
  // final String shopDescription;
  // final String shopName;
  // final String showOffersDisplay;
  final int addsDuration;
  final double discountPercentageFrom;
  final double discountPercentageTo;
  final double originalPrice;
  final double priceAfterDiscount;
  final String currency;
  final double discountPercentage;

  final bool agreementPolicy;
  final bool shopRelated;
  final bool anotherShop;

  final int startDay;
  final int startMonth;
  final int startYear;
  final int endDay;
  final int endMonth;
  final int endYear;

  final XFile? imageXFile;
  static const XFile? emptyImage = null;
  final List<String> addImages;
  // final String shopCategories;
  final String shopType;
  final String shopLocation;
  final String shopCity;
  final String shopState;
  // final Address? shopAddress;
  final String shopEmail;

  final String shopWebsite;

  final String shopImage;

  final String shopPhoneNumber;

  final Submission submission;

  AddsState({
    this.agreementPolicy = false,
    this.shopRelated = false,
    this.anotherShop = false,
    this.originalPrice = 0,
    this.currency = '',
    this.priceAfterDiscount =  0,
    this.discountPercentageFrom =  0,
    this.discountPercentageTo =  0,
    this.startDay = 0,
    this.startMonth = 0,
    this.startYear = 0,
    this.endDay = 0,
    this.endMonth = 0,
    this.endYear = 0,
    this.discountPercentage =  0,
    this.addImages = const [],
    this.imageXFile = emptyImage,
    this.addsDuration =  0,
    // this.showOffersDisplay = "عرض لمنتج واحد في صفحة واحدة",
    this.shopImage = "",
    // this.shopName = "",
    // this.shopDescription = "",
    // this.shopCategories = "",
    this.shopType = "",
    this.shopLocation = "",
    this.shopCity = "",
    this.shopState = "",
    // this.shopAddress,
    this.shopEmail = "",
    this.shopWebsite = "",
    this.shopPhoneNumber = "",
    this.submission = Submission.initial,
  });

  AddsState copyWith({
    bool? agreementPolicy,
    bool? shopRelated,
    bool? anotherShop,
    double? originalPrice,
    String? currency,
    double? priceAfterDiscount,
    double? discountPercentageFrom,
    double? discountPercentageTo,
    double? discountPercentage,
    int? startDay,
    int? startMonth,
    int? startYear,
    int? endDay,
    int? endMonth,
    int? endYear,
    List<String>? addImages,
    XFile? imageXFile,
    int? addsDuration,
    // String? showOffersDisplay,
    String? shopImage,
    // String? shopName,
    // String? shopDescription,
    // String? shopCategories,
    String? shopType,
    String? shopLocation,
    String? shopCity,
    String? shopState,
    // Address? shopAddress,
    String? shopEmail,
    String? shopWebsite,
    String? shopPhoneNumber,
    Submission? submission,
  }) {
    return AddsState(
      currency: currency ?? this.currency,
      agreementPolicy: agreementPolicy ?? this.agreementPolicy,
      shopRelated: shopRelated ?? this.shopRelated,
      anotherShop: anotherShop ?? this.anotherShop,

      priceAfterDiscount: priceAfterDiscount ?? this.priceAfterDiscount,
      originalPrice: originalPrice ?? this.originalPrice,
      discountPercentageFrom:
          discountPercentageFrom ?? this.discountPercentageFrom,
      discountPercentageTo: discountPercentageTo ?? this.discountPercentageTo,
      discountPercentage: discountPercentage ?? this.discountPercentage,
      startDay: startDay ?? this.startDay,
      startMonth: startMonth ?? this.startMonth,
      startYear: startYear ?? this.startYear,
      endDay: endDay ?? this.endDay,
      endMonth: endMonth ?? this.endMonth,
      endYear: endYear ?? this.endYear,
      addImages: addImages ?? this.addImages,
      imageXFile: imageXFile ?? this.imageXFile,
      addsDuration: addsDuration ?? this.addsDuration,
      // showOffersDisplay: showOffersDisplay ?? this.showOffersDisplay,
      shopImage: shopImage ?? this.shopImage,
      // shopName: shopName ?? this.shopName,
      // shopDescription: shopDescription ?? this.shopDescription,
      // shopCategories: shopCategories ?? this.shopCategories,
      shopType: shopType ?? this.shopType,
      shopLocation: shopLocation ?? this.shopLocation,
      shopCity: shopCity ?? this.shopCity,
      shopState: shopState ?? this.shopState,
      // shopAddress: shopAddress ?? this.shopAddress,
      shopEmail: shopEmail ?? this.shopEmail,
      shopWebsite: shopWebsite ?? this.shopWebsite,
      shopPhoneNumber: shopPhoneNumber ?? this.shopPhoneNumber,
      submission: submission ?? this.submission,
    );
  }

  @override
  List<Object?> get props => [
        agreementPolicy,
        shopRelated,
        anotherShop,
        originalPrice,
        currency,
        discountPercentage,
        priceAfterDiscount,
        discountPercentageFrom,
        discountPercentageTo,
        startDay,
        startMonth,
        startYear,
        endDay,
        endMonth,
        endYear,

        addImages,
        imageXFile,
        addsDuration,
        // showOffersDisplay,
        shopImage,
        // shopName,
        // shopDescription,
        // shopCategories,
        shopType,
        shopLocation,
        shopCity,
        shopState,
        // shopAddress,
        shopEmail,
        shopWebsite,
        shopPhoneNumber,
        submission,
      ];
}
