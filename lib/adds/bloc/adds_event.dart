part of 'adds_bloc.dart';

class AddsEvent extends Equatable {
  const AddsEvent();

  @override
  List<Object?> get props => [];
}

// class EditShowOffersDisplay extends AddsEvent {
//   final String showOffersDisplay;

//   const EditShowOffersDisplay({required this.showOffersDisplay});

//   @override
//   List<Object> get props => [showOffersDisplay];
// }

class EditAddsDuration extends AddsEvent {
  final int addsDuration;

  const EditAddsDuration({required this.addsDuration});

  @override
  List<Object> get props => [addsDuration];
}

///////////
class EditDiscountPercentageFrom extends AddsEvent {
  final double discountPercentageFrom;

  const EditDiscountPercentageFrom({required this.discountPercentageFrom});

  @override
  List<Object> get props => [discountPercentageFrom];
}

class EditDiscountPercentageTo extends AddsEvent {
  final double discountPercentageTo;

  const EditDiscountPercentageTo({required this.discountPercentageTo});

  @override
  List<Object> get props => [discountPercentageTo];
}

class EditOriginalPrice extends AddsEvent {
  final double originalPrice;

  const EditOriginalPrice({required this.originalPrice});

  @override
  List<Object> get props => [originalPrice];
}

class EditPriceAfterDiscount extends AddsEvent {
  final double priceAfterDiscount;

  const EditPriceAfterDiscount({required this.priceAfterDiscount});

  @override
  List<Object> get props => [priceAfterDiscount];
}

class EditCurrency extends AddsEvent {
  final String currency;

  const EditCurrency({required this.currency});

  @override
  List<Object> get props => [currency];
}

class EditDiscountPercentage extends AddsEvent {
  final double discountPercentage;

  const EditDiscountPercentage({required this.discountPercentage});

  @override
  List<Object> get props => [discountPercentage];
}

class EditAgreementPolicy extends AddsEvent {
  final bool agreementPolicy;

  const EditAgreementPolicy({required this.agreementPolicy});

  @override
  List<Object> get props => [agreementPolicy];
}

class EditShopRelated extends AddsEvent {
  final bool shopRelated;

  const EditShopRelated({required this.shopRelated});

  @override
  List<Object> get props => [shopRelated];
}

class EditAnotherShop extends AddsEvent {
  final bool anotherShop;

  const EditAnotherShop({required this.anotherShop});

  @override
  List<Object> get props => [anotherShop];
}

class EditStartDayMonthYear extends AddsEvent {
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

class EditEndDayMonthYear extends AddsEvent {
  final int endDay;
  final int endMonth;
  final int endYear;

  const EditEndDayMonthYear(
      {required this.endDay, required this.endMonth, required this.endYear});

  @override
  List<Object> get props => [endDay, endMonth, endYear];
}

class EditShopName extends AddsEvent {
  final String shopName;

  const EditShopName({required this.shopName});

  @override
  List<Object> get props => [shopName];
}

// class EditbranchesList extends AddsEvent {
//   final List<Branches> branches_list;

//   const EditbranchesList({required this.branches_list});

//   @override
//   List<Object> get props => [branches_list];
// }

class EditShopDescription extends AddsEvent {
  final String shopDescription;

  const EditShopDescription({required this.shopDescription});

  @override
  List<Object> get props => [shopDescription];
}

class EditShopCategories extends AddsEvent {
  final String shopCategories;

  const EditShopCategories({required this.shopCategories});

  @override
  List<Object> get props => [shopCategories];
}

class EditShopType extends AddsEvent {
  final String shopType;

  const EditShopType({required this.shopType});

  @override
  List<Object> get props => [shopType];
}

class EditShopLocation extends AddsEvent {
  final String shopLocation;

  const EditShopLocation({required this.shopLocation});

  @override
  List<Object> get props => [shopLocation];
}

class EditShopCity extends AddsEvent {
  final String shopCity;

  const EditShopCity({required this.shopCity});

  @override
  List<Object> get props => [shopCity];
}

class EditShopState extends AddsEvent {
  final String shopState;

  const EditShopState({required this.shopState});

  @override
  List<Object> get props => [shopState];
}

// class EditShopAddress extends AddsEvent {
//   final Address? shopAddress;

//   const EditShopAddress({required this.shopAddress});

//   @override
//   List<Object?> get props => [shopAddress];
// }

class EditShopEmail extends AddsEvent {
  final String shopEmail;

  const EditShopEmail({required this.shopEmail});

  @override
  List<Object> get props => [shopEmail];
}

class EditShopPhoneNumber extends AddsEvent {
  final String shopPhoneNumber;

  const EditShopPhoneNumber({required this.shopPhoneNumber});

  @override
  List<Object> get props => [shopPhoneNumber];
}

class RegisterShopToFireBase extends AddsEvent {
  const RegisterShopToFireBase();

  @override
  List<Object> get props => [];
}

class AddAdds extends AddsEvent {
  const AddAdds();

  @override
  List<Object> get props => [];
}

class FetchAddsImages extends AddsEvent {
  const FetchAddsImages();

  @override
  List<Object> get props => [];
}

class pickImageXFile extends AddsEvent {
  final XFile? imageXFile;
  pickImageXFile({required this.imageXFile});

  @override
  List<Object?> get props => [imageXFile];
}

class EditShopImage extends AddsEvent {
  final String shopImage;
  EditShopImage({required this.shopImage});

  @override
  List<Object?> get props => [shopImage];
}
