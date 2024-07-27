part of 'online_store_bloc.dart';

class OnlineStoreEvent extends Equatable {
  const OnlineStoreEvent();

  @override
  List<Object?> get props => [];
}

class EditShowOffersDisplay extends OnlineStoreEvent {
  final String showOffersDisplay;

  const EditShowOffersDisplay({required this.showOffersDisplay});

  @override
  List<Object> get props => [showOffersDisplay];
}

class EditOffersDuration extends OnlineStoreEvent {
  final int offersDuration;

  const EditOffersDuration({required this.offersDuration});

  @override
  List<Object> get props => [offersDuration];
}

///////////
class EditDiscountPercentageFrom extends OnlineStoreEvent {
  final double discountPercentageFrom;

  const EditDiscountPercentageFrom({required this.discountPercentageFrom});

  @override
  List<Object> get props => [discountPercentageFrom];
}

class EditDiscountPercentageTo extends OnlineStoreEvent {
  final double discountPercentageTo;

  const EditDiscountPercentageTo({required this.discountPercentageTo});

  @override
  List<Object> get props => [discountPercentageTo];
}





class EditOriginalPrice extends OnlineStoreEvent {
  final double originalPrice;

  const EditOriginalPrice({required this.originalPrice});

  @override
  List<Object> get props => [originalPrice];
}

class EditPriceAfterDiscount extends OnlineStoreEvent {
  final double priceAfterDiscount;

  const EditPriceAfterDiscount({required this.priceAfterDiscount});

  @override
  List<Object> get props => [priceAfterDiscount];
}

class EditAgreementPolicy extends OnlineStoreEvent {
  final bool agreementPolicy;

  const EditAgreementPolicy({required this.agreementPolicy});

  @override
  List<Object> get props => [agreementPolicy];
}

class EditStartDayMonthYear extends OnlineStoreEvent {
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

class EditEndDayMonthYear extends OnlineStoreEvent {
  final int endDay;
  final int endMonth;
  final int endYear;

  const EditEndDayMonthYear(
      {required this.endDay, required this.endMonth, required this.endYear});

  @override
  List<Object> get props => [endDay, endMonth, endYear];
}

class EditshopLink extends OnlineStoreEvent {
  final String shopLink;

  const EditshopLink({required this.shopLink});

  @override
  List<Object> get props => [shopLink];
}

// class EditbranchesList extends AddOffersEvent {
//   final List<Branches> branches_list;

//   const EditbranchesList({required this.branches_list});

//   @override
//   List<Object> get props => [branches_list];
// }

class EditShopDescription extends OnlineStoreEvent {
  final String shopDescription;

  const EditShopDescription({required this.shopDescription});

  @override
  List<Object> get props => [shopDescription];
}

class EditShopCategories extends OnlineStoreEvent {
  final List<String> shopCategories;

  const EditShopCategories({required this.shopCategories});

  @override
  List<Object> get props => [shopCategories];
}

class EditShopType extends OnlineStoreEvent {
  final String shopType;

  const EditShopType({required this.shopType});

  @override
  List<Object> get props => [shopType];
}

class EditShopLocation extends OnlineStoreEvent {
  final String shopLocation;

  const EditShopLocation({required this.shopLocation});

  @override
  List<Object> get props => [shopLocation];
}

class EditShopCity extends OnlineStoreEvent {
  final String shopCity;

  const EditShopCity({required this.shopCity});

  @override
  List<Object> get props => [shopCity];
}

class EditShopState extends OnlineStoreEvent {
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

class EditShopEmail extends OnlineStoreEvent {
  final String shopEmail;

  const EditShopEmail({required this.shopEmail});

  @override
  List<Object> get props => [shopEmail];
}

class EditShopPhoneNumber extends OnlineStoreEvent {
  final String shopPhoneNumber;

  const EditShopPhoneNumber({required this.shopPhoneNumber});

  @override
  List<Object> get props => [shopPhoneNumber];
}

class RegisterShopToFireBase extends OnlineStoreEvent {
  const RegisterShopToFireBase();

  @override
  List<Object> get props => [];
}

class AddOnlineStore extends OnlineStoreEvent {
  const AddOnlineStore();

  @override
  List<Object> get props => [];
}

// class pickImageXFile extends AddOffersEvent {
//   final XFile? imageXFile;
//   pickImageXFile({required this.imageXFile});

//   @override
//   List<Object?> get props => [imageXFile];
// }

class EditShopImage extends OnlineStoreEvent {
  final String shopImage;
  EditShopImage({required this.shopImage});

  @override
  List<Object?> get props => [shopImage];
}
