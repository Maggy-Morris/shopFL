part of 'register_shop_bloc.dart';

class RegisterShopEvent extends Equatable {
  const RegisterShopEvent();

  @override
  List<Object?> get props => [];
}

class AddFileEvent extends RegisterShopEvent {
  final PlatformFile file;

  const AddFileEvent({required this.file});

  @override
  List<Object?> get props => [file];
}

class RemoveFileEvent extends RegisterShopEvent {
  const RemoveFileEvent();

  @override
  List<Object?> get props => [];
}

class EditShopName extends RegisterShopEvent {
  final String shopName;

  const EditShopName({required this.shopName});

  @override
  List<Object> get props => [shopName];
}

class EditbranchesList extends RegisterShopEvent {
  final List<Branches> branchesList;

  const EditbranchesList({required this.branchesList});

  @override
  List<Object> get props => [branchesList];
}

class EditShopDescription extends RegisterShopEvent {
  final String shopDescription;

  const EditShopDescription({required this.shopDescription});

  @override
  List<Object> get props => [shopDescription];
}

class EditShopCategories extends RegisterShopEvent {
  final String shopCategories;

  const EditShopCategories({required this.shopCategories});

  @override
  List<Object> get props => [shopCategories];
}

class EditShopType extends RegisterShopEvent {
  final String shopType;

  const EditShopType({required this.shopType});

  @override
  List<Object> get props => [shopType];
}

class EditShopLocation extends RegisterShopEvent {
  final String shopLocation;

  const EditShopLocation({required this.shopLocation});

  @override
  List<Object> get props => [shopLocation];
}

class EditShopCity extends RegisterShopEvent {
  final String shopCity;

  const EditShopCity({required this.shopCity});

  @override
  List<Object> get props => [shopCity];
}

class EditShopState extends RegisterShopEvent {
  final String shopState;

  const EditShopState({required this.shopState});

  @override
  List<Object> get props => [shopState];
}

class EditShopAddress extends RegisterShopEvent {
  final Address? shopAddress;

  const EditShopAddress({required this.shopAddress});

  @override
  List<Object?> get props => [shopAddress];
}

class EditShopEmail extends RegisterShopEvent {
  final String shopEmail;

  const EditShopEmail({required this.shopEmail});

  @override
  List<Object> get props => [shopEmail];
}

class EditShopPhoneNumber extends RegisterShopEvent {
  final String shopPhoneNumber;

  const EditShopPhoneNumber({required this.shopPhoneNumber});

  @override
  List<Object> get props => [shopPhoneNumber];
}

class RegisterShopToFireBase extends RegisterShopEvent {
  const RegisterShopToFireBase();

  @override
  List<Object> get props => [];
}

class EditShopDataToFireBase extends RegisterShopEvent {
  const EditShopDataToFireBase();

  @override
  List<Object> get props => [];
}

class PickImageXFile extends RegisterShopEvent {
  final XFile? imageXFile;
  const PickImageXFile({required this.imageXFile});

  @override
  List<Object?> get props => [imageXFile];
}

class EditShopImage extends RegisterShopEvent {
  final String shopImage;
  const EditShopImage({required this.shopImage});

  @override
  List<Object?> get props => [shopImage];
}
