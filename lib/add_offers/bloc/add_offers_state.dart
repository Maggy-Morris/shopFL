part of 'add_offers_bloc.dart';

class AddOffersState extends Equatable {
  // final String shopDescription;
  // final String shopName;
  final String showOffersDisplay;
  final String offersDuration;
  final String discountPercentageFrom;
  final String discountPercentageTo;
  final String originalPrice;
  final String priceAfterDiscount;
  final String currency;
  final String discountPercentage;

  final bool agreementPolicy;

  final int startDay;
  final int startMonth;
  final int startYear;
  final int endDay;
  final int endMonth;
  final int endYear;

  final XFile? imageXFile;
  static const XFile? emptyImage = null;
  final List<String> offerImages;
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

  AddOffersState({
    this.agreementPolicy = false,
    this.originalPrice = '',
    this.currency = '',
    this.priceAfterDiscount = '',
    this.discountPercentageFrom = '',
    this.discountPercentageTo = '',
    this.startDay = 0,
    this.startMonth = 0,
    this.startYear = 0,
    this.endDay = 0,
    this.endMonth = 0,
    this.endYear = 0,
    this.discountPercentage = '',
    this.offerImages = const [],
    this.imageXFile = emptyImage,
    this.offersDuration = '',
    this.showOffersDisplay = "عرض لمنتج واحد في صفحة واحدة",
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

  AddOffersState copyWith({
    bool? agreementPolicy,
    String? originalPrice,
    String? currency,
    String? priceAfterDiscount,
    String? discountPercentageFrom,
    String? discountPercentageTo,
    String? discountPercentage,
    int? startDay,
    int? startMonth,
    int? startYear,
    int? endDay,
    int? endMonth,
    int? endYear,
    List<String>? offerImages,
    XFile? imageXFile,
    String? offersDuration,
    String? showOffersDisplay,
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
    return AddOffersState(
      currency: currency ?? this.currency,
      agreementPolicy: agreementPolicy ?? this.agreementPolicy,
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
      offerImages: offerImages ?? this.offerImages,
      imageXFile: imageXFile ?? this.imageXFile,
      offersDuration: offersDuration ?? this.offersDuration,
      showOffersDisplay: showOffersDisplay ?? this.showOffersDisplay,
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

        offerImages,
        imageXFile,
        offersDuration,
        showOffersDisplay,
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
