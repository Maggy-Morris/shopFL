import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../providers/online_store_provider.dart';
import '../../widgets/enum/enum.dart';

part 'online_store_event.dart';
part 'online_store_state.dart';

class OnlineStoreBloc extends Bloc<OnlineStoreEvent, OnlineStoreState> {
  static OnlineStoreBloc get(context) =>
      BlocProvider.of<OnlineStoreBloc>(context);

  OnlineStoreBloc() : super(OnlineStoreState()) {
    on<OnlineStoreEvent>((event, emit) {});
    on<EditshopLink>(_onEditshopLink);

    // on<EditShopDescription>(_onEditShopDescription);
    on<EditShopCategories>(_onEditShopCategories);
    // on<EditShopType>(_onEditShopType);
    // on<EditShopLocation>(_onEditShopLocation);
    // on<EditShopState>(_onEditShopState);
    // on<EditShopAddress>(_onEditShopAddress);
    // on<EditShopEmail>(_onEditShopEmail);
    // on<EditShopPhoneNumber>(_onEditShopPhoneNumber);
    // on<EditbranchesList>(_onEditbranchesList);

    // on<EditShopImage>(_onEditShopImage);

    // on<EditShowOffersDisplay>(_onEditShowOffersDisplay);
    on<EditOffersDuration>(_onEditOffersDuration);

    on<EditDiscountPercentageFrom>(_onEditDiscountPercentageFrom);
    on<EditDiscountPercentageTo>(_onEditDiscountPercentageTo);
    // on<EditOriginalPrice>(_onEditOriginalPrice);

    // on<EditPriceAfterDiscount>(_onEditPriceAfterDiscount);
    on<EditAgreementPolicy>(_onEditAgreementPolicy);
    on<EditStartDayMonthYear>(_onEditStartDayMonthYear);
    on<EditEndDayMonthYear>(_onEditEndDayMonthYear);

    on<AddOnlineStore>(_onAddOnlineStore);

    // on<RegisterShopToFireBase>(_onRegisterShopToFireBase);
    // on<EditShopDataToFireBase>(_onEditShopDataToFireBase);
  }

  _onEditShopDescription(
      EditShopDescription event, Emitter<OnlineStoreState> emit) {
    emit(state.copyWith(
      shopDescription: event.shopDescription,
    ));
  }

  // _onEditbranchesList(EditbranchesList event, Emitter<RegisterShopState> emit) {
  //   emit(state.copyWith(
  //       branches_list: event.branches_list, submission: Submission.editing));
  // }
  // _onEditbranchesList(EditbranchesList event, Emitter<RegisterShopState> emit) {
  //   // Filter out branches with null country or state
  //   final validNewBranches = event.branches_list.where((branch) {
  //     return branch.country != null || branch.state != null;
  //   }).toList();

  //   // Create a set of existing countries for quick lookup
  //   final existingCountries =
  //       state.branches_list.map((branch) => branch.country ).toSet();

  //   // Filter out new branches that have a country already in the existing list
  //   final nonDuplicateNewBranches = validNewBranches.where((branch) {
  //     return !existingCountries.contains(branch.country);
  //   }).toList();

  //   // Merge the existing branches with the valid, non-duplicate new branches
  //   final updatedBranchesList = List<Branches>.from(state.branches_list)
  //     ..addAll(validNewBranches);

  //   emit(state.copyWith(
  //     branches_list: updatedBranchesList,
  //     submission: Submission.editing,
  //   ));
  // }

  // _onEditbranchesList(EditbranchesList event, Emitter<RegisterShopState> emit) {
  //   // Filter out branches with null country or state
  //   final validNewBranches = event.branches_list.where((branch) {
  //     return branch.country != null && branch.state != null;
  //   }).toList();

  //   // Create a set of existing countries and states for quick lookup
  //   final existingBranches = state.branches_list
  //       .map((branch) => '${branch.country}-${branch.state}')
  //       .toSet();

  //   // Filter out new branches that are already in the existing list
  //   final nonDuplicateNewBranches = validNewBranches.where((branch) {
  //     return !existingBranches.contains('${branch.country}-${branch.state}');
  //   }).toList();

  //   // Merge the existing branches with the valid, non-duplicate new branches
  //   final updatedBranchesList = List<Branches>.from(state.branches_list)
  //     ..addAll(nonDuplicateNewBranches);

  //   emit(state.copyWith(
  //     branches_list: updatedBranchesList,
  //     submission: Submission.editing,
  //   ));
  // }

  // _onpickImageXFile(pickImageXFile event, Emitter<AddOffersEvent> emit) {
  //   emit(state.copyWith(
  //       imageXFile: event.imageXFile, submission: Submission.editing));
  // }

  _onEditShowOffersDisplay(
      EditShowOffersDisplay event, Emitter<OnlineStoreState> emit) {
    emit(state.copyWith(
        showOffersDisplay: event.showOffersDisplay,
        submission: Submission.editing));
  }

  _onEditOffersDuration(
      EditOffersDuration event, Emitter<OnlineStoreState> emit) {
    emit(state.copyWith(
        offersDuration: event.offersDuration, submission: Submission.editing));
  }

  _onEditDiscountPercentageFrom(
      EditDiscountPercentageFrom event, Emitter<OnlineStoreState> emit) {
    emit(state.copyWith(
        discountPercentageFrom: event.discountPercentageFrom,
        submission: Submission.editing));
  }

  _onEditDiscountPercentageTo(
      EditDiscountPercentageTo event, Emitter<OnlineStoreState> emit) {
    emit(state.copyWith(
        discountPercentageTo: event.discountPercentageTo,
        submission: Submission.editing));
  }

  // _onEditOriginalPrice(EditOriginalPrice event, Emitter<OnlineStoreState> emit) {
  //   emit(state.copyWith(
  //       originalPrice: event.originalPrice, submission: Submission.editing));
  // }

  // _onEditPriceAfterDiscount(
  //     EditPriceAfterDiscount event, Emitter<OnlineStoreState> emit) {
  //   emit(state.copyWith(
  //       priceAfterDiscount: event.priceAfterDiscount,
  //       submission: Submission.editing));
  // }

  _onEditAgreementPolicy(
      EditAgreementPolicy event, Emitter<OnlineStoreState> emit) {
    emit(state.copyWith(
        agreementPolicy: event.agreementPolicy,
        submission: Submission.editing));
  }

  _onEditStartDayMonthYear(
      EditStartDayMonthYear event, Emitter<OnlineStoreState> emit) {
    emit(state.copyWith(
        startDay: event.startDay,
        startMonth: event.startMonth,
        startYear: event.startYear,
        submission: Submission.editing));
  }

  _onEditEndDayMonthYear(
      EditEndDayMonthYear event, Emitter<OnlineStoreState> emit) {
    emit(state.copyWith(
        endDay: event.endDay,
        endMonth: event.endMonth,
        endYear: event.endYear,
        submission: Submission.editing));
  }

  // _onEditShopImage(EditShopImage event, Emitter<OnlineStoreState> emit) {
  //   emit(state.copyWith(
  //       shopImage: event.shopImage, submission: Submission.editing));
  // }

  _onEditshopLink(EditshopLink event, Emitter<OnlineStoreState> emit) {
    emit(state.copyWith(
        shopLink: event.shopLink, submission: Submission.editing));
  }

  _onEditShopCategories(
      EditShopCategories event, Emitter<OnlineStoreState> emit) {
    emit(state.copyWith(
        shopCategories: event.shopCategories, submission: Submission.editing));
  }

  // _onEditShopType(EditShopType event, Emitter<OnlineStoreState> emit) {
  //   emit(state.copyWith(
  //       shopType: event.shopType, submission: Submission.editing));
  // }

  // _onEditShopLocation(EditShopLocation event, Emitter<OnlineStoreState> emit) {
  //   emit(state.copyWith(
  //       shopLocation: event.shopLocation, submission: Submission.editing));
  // }

  // _onEditShopCity(EditShopCity event, Emitter<OnlineStoreState> emit) {
  //   emit(state.copyWith(
  //       shopCity: event.shopCity, submission: Submission.editing));
  // }

  // _onEditShopState(EditShopState event, Emitter<OnlineStoreState> emit) {
  //   emit(state.copyWith(
  //       shopState: event.shopState, submission: Submission.editing));
  // }

  // _onEditShopAddress(EditShopAddress event, Emitter<OnlineStoreState> emit) {
  //   emit(state.copyWith(
  //       shopAddress: event.shopAddress, submission: Submission.editing));
  // }

  // _onEditShopEmail(EditShopEmail event, Emitter<OnlineStoreState> emit) {
  //   emit(state.copyWith(
  //       shopEmail: event.shopEmail, submission: Submission.editing));
  // }

  // _onEditShopPhoneNumber(
  //     EditShopPhoneNumber event, Emitter<OnlineStoreState> emit) {
  //   emit(state.copyWith(
  //       shopPhoneNumber: event.shopPhoneNumber,
  //       submission: Submission.editing));
  // }

  // Future checkInfo() async {
  //   final rp = RegisterShopProvider();
  //   await rp.checkIfAddressExist();
  // setState(() {

  //   // categoriesController.text = rp.shopCategories ?? '';
  //   // categoriesText = rp.shopCategories;

  //   nameController.text = rp.shopLink ?? '';
  //   nameText = rp.shopLink ?? '';

  //   descriptionController.text = rp.shopDescription ?? '';
  //   descriptionText = rp.shopDescription ?? '';

  //   address = rp.shopAddress;
  //   imageUrl = rp.shopImage ?? '';
  // });
  // }

  // _onRegisterShopToFireBase(
  //     RegisterShopToFireBase event, Emitter<OnlineStoreState> emit) async {
  //   emit(state.copyWith(submission: Submission.loading));

  //   try {
  //     // final RegisterShopProvider registerShopProvider;

  //     // final rp = context.read<RegisterShopProvider>();
  //     final result = await RegisterShopProvider().checkIfAddressExist();

  //     if (result.shopLink != "") {
  //       emit(state.copyWith(
  //         submission: Submission.success,
  //         branches_list: result.branchesList,
  //         shopLink: result.shopLink,
  //         shopDescription: result.shopDescription,
  //         shopAddress: result.shopAddress,
  //         shopLocation: result.addressWritten,
  //         shopImage: result.shopImage,
  //         shopCategories: result.shopCategories,
  //         shopType: result.shopType,
  //         shopWebsite: result.shopWebsite,
  //         shopEmail: result.shopEmail,
  //         shopPhoneNumber: result.shopPhoneNumber,
  //       ));
  //     } else {
  //       emit(state.copyWith(submission: Submission.noDataFound));
  //     }
  //   } catch (e) {
  //     emit(state.copyWith(submission: Submission.error));
  //     print("Error fetching shop info: $e");
  //   }
  // }

  // _onEditShopDataToFireBase(
  //     EditShopDataToFireBase event, Emitter<OnlineStoreState> emit) async {
  //   emit(state.copyWith(submission: Submission.loading));

  //   final result = await RegisterShopProvider().registerShop(
  //     branchesList: state.branches_list,
  //     shopLink: state.shopLink,
  //     shopDescription: state.shopDescription,
  //     address: state.shopAddress ??
  //         Address(
  //             houseNumber: "",
  //             street: "",
  //             area: "",
  //             latitude: 0,
  //             longitude: 0,
  //             province: "",
  //             floor: ''),
  //     imageUrl: state.shopImage,
  //     shopCategories: state.shopCategories,
  //     shopType: state.shopType,
  //     shopAddress: state.shopLocation,
  //     shopPhoneNumber: state.shopPhoneNumber,
  //     shopEmail: state.shopEmail,
  //     shopWebsite: state.shopWebsite,
  //   );

  //   // if (result.isRegistered) {
  //   emit(state.copyWith(
  //     submission: Submission.success,
  //     // data: result, // Adjust this if you need specific fields from `result`
  //     shopLink: result.shopLink,
  //     shopDescription: result.shopDescription,
  //     shopAddress: result.shopAddress,
  //     shopLocation: result.addressWritten,
  //     branches_list: result.branchesList,

  //     shopImage: result.shopImage,
  //     shopCategories: result.shopCategories,
  //     shopType: result.shopType,
  //   ));
  //   // } else {
  //   //   emit(state.copyWith(submission: Submission.noDataFound));
  //   // }
  // }

  _onAddOnlineStore(
      AddOnlineStore event, Emitter<OnlineStoreState> emit) async {
    emit(state.copyWith(submission: Submission.loading));

    final result = await RegisterOnlineStoreProvider().addOnlineStore(
      offersDuration: state.offersDuration,
      startOffersDate:
          "${state.startDay}/${state.startMonth}/${state.startYear}",
      endOffersDate: "${state.endDay}/${state.endMonth}/${state.endYear}",
      shopLink: state.shopLink,
      shopCategories: state.shopCategories,
      discountPercentageFrom: state.discountPercentageFrom,
      discountPercentageTo: state.discountPercentageTo,
    );

    // if (result.isRegistered) {
    emit(state.copyWith(
      submission: Submission.success,
      // data: result, // Adjust this if you need specific fields from `result`
      // showOffersDisplay: result.showOffersDisplay,
      // priceAfterDiscount: result.priceAfterDiscount,
      // originalPrice: result.originalPrice,
      // // endOffersDate: result.endOffersDate,

      // // startOffersDate:result.startOffersDate,

      // offersDuration: result.offersDuration,
      // discountPercentage: result.discountPercentage,
      // discountPercentageFrom: result.discountPercentageFrom,
      // discountPercentageTo: result.discountPercentageTo
    ));
    // } else {
    //   emit(state.copyWith(submission: Submission.noDataFound));
    // }
  }
}
