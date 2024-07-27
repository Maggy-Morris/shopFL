part of 'add_offers_bloc.dart';

class AddOffersEvent extends Equatable {
  const AddOffersEvent();

  @override
  List<Object?> get props => [];
}

class EditShowOffersDisplay extends AddOffersEvent {
  final String showOffersDisplay;

  const EditShowOffersDisplay({required this.showOffersDisplay});

  @override
  List<Object> get props => [showOffersDisplay];
}

class EditOffersDuration extends AddOffersEvent {
  final int offersDuration;

  const EditOffersDuration({required this.offersDuration});

  @override
  List<Object> get props => [offersDuration];
}

///////////
class EditDiscountPercentageFrom extends AddOffersEvent {
  final double discountPercentageFrom;

  const EditDiscountPercentageFrom({required this.discountPercentageFrom});

  @override
  List<Object> get props => [discountPercentageFrom];
}

class EditDiscountPercentageTo extends AddOffersEvent {
  final double discountPercentageTo;

  const EditDiscountPercentageTo({required this.discountPercentageTo});

  @override
  List<Object> get props => [discountPercentageTo];
}

class EditOriginalPrice extends AddOffersEvent {
  final double originalPrice;

  const EditOriginalPrice({required this.originalPrice});

  @override
  List<Object> get props => [originalPrice];
}

class EditPriceAfterDiscount extends AddOffersEvent {
  final double priceAfterDiscount;

  const EditPriceAfterDiscount({required this.priceAfterDiscount});

  @override
  List<Object> get props => [priceAfterDiscount];
}





class EditCurrency extends AddOffersEvent {
  final String currency;

  const EditCurrency({required this.currency});

  @override
  List<Object> get props => [currency];
}




class EditDiscountPercentage extends AddOffersEvent {
  final double discountPercentage;

  const EditDiscountPercentage({required this.discountPercentage});

  @override
  List<Object> get props => [discountPercentage];
}


class EditAgreementPolicy extends AddOffersEvent {
  final bool agreementPolicy;

  const EditAgreementPolicy({required this.agreementPolicy});

  @override
  List<Object> get props => [agreementPolicy];
}

class EditStartDayMonthYear extends AddOffersEvent {
  final int startDay;
  final int startMonth;
  final int startYear;

  const EditStartDayMonthYear(
      {required this.startDay,
      required this.startMonth,
      required this.startYear});

  @override
  List<Object> get props => [startDay, startMonth, startYear];
}

class EditEndDayMonthYear extends AddOffersEvent {
  final int endDay;
  final int endMonth;
  final int endYear;

  const EditEndDayMonthYear(
      {required this.endDay, required this.endMonth, required this.endYear});

  @override
  List<Object> get props => [endDay, endMonth, endYear];
}

class EditShopName extends AddOffersEvent {
  final String shopName;

  const EditShopName({required this.shopName});

  @override
  List<Object> get props => [shopName];
}

// class EditbranchesList extends AddOffersEvent {
//   final List<Branches> branches_list;

//   const EditbranchesList({required this.branches_list});

//   @override
//   List<Object> get props => [branches_list];
// }

class EditShopDescription extends AddOffersEvent {
  final String shopDescription;

  const EditShopDescription({required this.shopDescription});

  @override
  List<Object> get props => [shopDescription];
}

class EditShopCategories extends AddOffersEvent {
  final String shopCategories;

  const EditShopCategories({required this.shopCategories});

  @override
  List<Object> get props => [shopCategories];
}

class EditShopType extends AddOffersEvent {
  final String shopType;

  const EditShopType({required this.shopType});

  @override
  List<Object> get props => [shopType];
}

class EditShopLocation extends AddOffersEvent {
  final String shopLocation;

  const EditShopLocation({required this.shopLocation});

  @override
  List<Object> get props => [shopLocation];
}

class EditShopCity extends AddOffersEvent {
  final String shopCity;

  const EditShopCity({required this.shopCity});

  @override
  List<Object> get props => [shopCity];
}

class EditShopState extends AddOffersEvent {
  final String shopState;

  const EditShopState({required this.shopState});

  @override
  List<Object> get props => [shopState];
}

// class EditShopAddress extends AddOffersEvent {
//   final Address? shopAddress;

//   const EditShopAddress({required this.shopAddress});

//   @override
//   List<Object?> get props => [shopAddress];
// }

class EditShopEmail extends AddOffersEvent {
  final String shopEmail;

  const EditShopEmail({required this.shopEmail});

  @override
  List<Object> get props => [shopEmail];
}

class EditShopPhoneNumber extends AddOffersEvent {
  final String shopPhoneNumber;

  const EditShopPhoneNumber({required this.shopPhoneNumber});

  @override
  List<Object> get props => [shopPhoneNumber];
}

class RegisterShopToFireBase extends AddOffersEvent {
  const RegisterShopToFireBase();

  @override
  List<Object> get props => [];
}

class AddOffers extends AddOffersEvent {
  const AddOffers();

  @override
  List<Object> get props => [];
}


class FetchOffersImages extends AddOffersEvent {
  const FetchOffersImages();

  @override
  List<Object> get props => [];
}




class pickImageXFile extends AddOffersEvent {
  final XFile? imageXFile;
  const pickImageXFile({required this.imageXFile});

  @override
  List<Object?> get props => [imageXFile];
}

class EditShopImage extends AddOffersEvent {
  final String shopImage;
  const EditShopImage({required this.shopImage});

  @override
  List<Object?> get props => [shopImage];
}
