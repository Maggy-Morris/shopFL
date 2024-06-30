part of 'register_shop_bloc.dart';

class RegisterShopState extends Equatable {
  final String shopDescription;
  final String shopName;
  XFile? imageXFile;
  final List<Branches> branchesList;
  final String shopCategories;
  final String shopType;
  final String shopLocation;
  final String shopCity;
  final String shopState;
  final Address? shopAddress;
  final String shopEmail;
  final String shopWebsite;
  final String shopImage;
  final String shopPhoneNumber;
  final Submission submission;
  final List<PlatformFile> files;

  RegisterShopState({
    this.files = const [],
    this.branchesList = const [],
    this.imageXFile,
    this.shopImage = "",
    this.shopName = "",
    this.shopDescription = "",
    this.shopCategories = "",
    this.shopType = "",
    this.shopLocation = "",
    this.shopCity = "",
    this.shopState = "",
    this.shopAddress,
    this.shopEmail = "",
    this.shopWebsite = "",
    this.shopPhoneNumber = "",
    this.submission = Submission.initial,
  });

  RegisterShopState copyWith({
    List<PlatformFile>? files, // Add this parameter

    List<Branches>? branchesList,
    XFile? imageXFile,
    String? shopImage,
    String? shopName,
    String? shopDescription,
    String? shopCategories,
    String? shopType,
    String? shopLocation,
    String? shopCity,
    String? shopState,
    Address? shopAddress,
    String? shopEmail,
    String? shopWebsite,
    String? shopPhoneNumber,
    Submission? submission,
  }) {
    return RegisterShopState(
      files: files ?? this.files,
      branchesList: branchesList ?? this.branchesList,
      imageXFile: imageXFile ?? this.imageXFile,
      shopImage: shopImage ?? this.shopImage,
      shopName: shopName ?? this.shopName,
      shopDescription: shopDescription ?? this.shopDescription,
      shopCategories: shopCategories ?? this.shopCategories,
      shopType: shopType ?? this.shopType,
      shopLocation: shopLocation ?? this.shopLocation,
      shopCity: shopCity ?? this.shopCity,
      shopState: shopState ?? this.shopState,
      shopAddress: shopAddress ?? this.shopAddress,
      shopEmail: shopEmail ?? this.shopEmail,
      shopWebsite: shopWebsite ?? this.shopWebsite,
      shopPhoneNumber: shopPhoneNumber ?? this.shopPhoneNumber,
      submission: submission ?? this.submission,
    );
  }

  @override
  List<Object?> get props => [
        files,
        branchesList,
        imageXFile,
        shopImage,
        shopName,
        shopDescription,
        shopCategories,
        shopType,
        shopLocation,
        shopCity,
        shopState,
        shopAddress,
        shopEmail,
        shopWebsite,
        shopPhoneNumber,
        submission,
      ];
}
