import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodpanda_seller/providers/offers_provider.dart';
import 'package:image_picker/image_picker.dart';

import '../../register_shop/bloc/register_shop_bloc.dart';
import '../../widgets/enum/enum.dart';

part 'add_offers_event.dart';
part 'add_offers_state.dart';

class AddOffersBloc extends Bloc<AddOffersEvent, AddOffersState> {
  static AddOffersBloc get(context) => BlocProvider.of<AddOffersBloc>(context);

  AddOffersBloc() : super(AddOffersState()) {
    on<AddOffersEvent>((event, emit) {});
    // on<EditShopName>(_onEditShopName);

    // on<EditShopCategories>(_onEditShopCategories);
    on<EditShopType>(_onEditShopType);
    on<EditShopLocation>(_onEditShopLocation);
    on<EditShopState>(_onEditShopState);
    // on<EditShopAddress>(_onEditShopAddress);
    on<EditShopEmail>(_onEditShopEmail);
    on<EditShopPhoneNumber>(_onEditShopPhoneNumber);
    // on<EditbranchesList>(_onEditbranchesList);

    on<EditShopImage>(_onEditShopImage);

    on<EditShowOffersDisplay>(_onEditShowOffersDisplay);
    on<EditOffersDuration>(_onEditOffersDuration);

    on<EditDiscountPercentageFrom>(_onEditDiscountPercentageFrom);
    on<EditDiscountPercentageTo>(_onEditDiscountPercentageTo);
    on<EditOriginalPrice>(_onEditOriginalPrice);
    on<EditCurrency>(_onEditCurrency);

    on<EditDiscountPercentage>(_onEditDiscountPercentage);

    on<EditPriceAfterDiscount>(_onEditPriceAfterDiscount);
    on<EditAgreementPolicy>(_onEditAgreementPolicy);
    on<EditStartDayMonthYear>(_onEditStartDayMonthYear);
    on<EditEndDayMonthYear>(_onEditEndDayMonthYear);

    on<pickImageXFile>(_onpickImageXFile);

    // on<RegisterShopToFireBase>(_onRegisterShopToFireBase);
    on<AddOffers>(_onAddOffers);

    on<FetchOffersImages>(_onFetchOffersImages);
  }

  _onEditCurrency(EditCurrency event, Emitter<AddOffersState> emit) {
    emit(state.copyWith(
      currency: event.currency,
    ));
  }

  _onEditDiscountPercentage(
      EditDiscountPercentage event, Emitter<AddOffersState> emit) {
    emit(state.copyWith(
      discountPercentage: event.discountPercentage,
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

  _onpickImageXFile(pickImageXFile event, Emitter<AddOffersState> emit) {
    emit(state.copyWith(
        imageXFile: event.imageXFile, submission: Submission.editing));
  }

  _onEditShowOffersDisplay(
      EditShowOffersDisplay event, Emitter<AddOffersState> emit) {
    emit(state.copyWith(
        showOffersDisplay: event.showOffersDisplay,
        submission: Submission.editing));
  }

  _onEditOffersDuration(
      EditOffersDuration event, Emitter<AddOffersState> emit) {
    emit(state.copyWith(
        offersDuration: event.offersDuration, submission: Submission.editing));
  }

  _onEditDiscountPercentageFrom(
      EditDiscountPercentageFrom event, Emitter<AddOffersState> emit) {
    emit(state.copyWith(
        discountPercentageFrom: event.discountPercentageFrom,
        submission: Submission.editing));
  }

  _onEditDiscountPercentageTo(
      EditDiscountPercentageTo event, Emitter<AddOffersState> emit) {
    emit(state.copyWith(
        discountPercentageTo: event.discountPercentageTo,
        submission: Submission.editing));
  }

  _onEditOriginalPrice(EditOriginalPrice event, Emitter<AddOffersState> emit) {
    emit(state.copyWith(
        originalPrice: event.originalPrice, submission: Submission.editing));
  }

  _onEditPriceAfterDiscount(
      EditPriceAfterDiscount event, Emitter<AddOffersState> emit) {
    emit(state.copyWith(
        priceAfterDiscount: event.priceAfterDiscount,
        submission: Submission.editing));
  }

  _onEditAgreementPolicy(
      EditAgreementPolicy event, Emitter<AddOffersState> emit) {
    emit(state.copyWith(
        agreementPolicy: event.agreementPolicy,
        submission: Submission.editing));
  }

  _onEditStartDayMonthYear(
      EditStartDayMonthYear event, Emitter<AddOffersState> emit) {
    emit(state.copyWith(
        startDay: event.startDay,
        startMonth: event.startMonth,
        startYear: event.startYear,
        submission: Submission.editing));
  }

  _onEditEndDayMonthYear(
      EditEndDayMonthYear event, Emitter<AddOffersState> emit) {
    emit(state.copyWith(
        endDay: event.endDay,
        endMonth: event.endMonth,
        endYear: event.endYear,
        submission: Submission.editing));
  }

  _onEditShopImage(EditShopImage event, Emitter<AddOffersState> emit) {
    emit(state.copyWith(
        shopImage: event.shopImage, submission: Submission.editing));
  }

  // _onEditShopName(EditShopName event, Emitter<AddOffersState> emit) {
  //   emit(state.copyWith(
  //       shopName: event.shopName, submission: Submission.editing));
  // }

  // _onEditShopCategories(
  //     EditShopCategories event, Emitter<AddOffersState> emit) {
  //   emit(state.copyWith(
  //       shopCategories: event.shopCategories, submission: Submission.editing));
  // }

  _onEditShopType(EditShopType event, Emitter<AddOffersState> emit) {
    emit(state.copyWith(
        shopType: event.shopType, submission: Submission.editing));
  }

  _onEditShopLocation(EditShopLocation event, Emitter<AddOffersState> emit) {
    emit(state.copyWith(
        shopLocation: event.shopLocation, submission: Submission.editing));
  }

  _onEditShopCity(EditShopCity event, Emitter<AddOffersState> emit) {
    emit(state.copyWith(
        shopCity: event.shopCity, submission: Submission.editing));
  }

  _onEditShopState(EditShopState event, Emitter<AddOffersState> emit) {
    emit(state.copyWith(
        shopState: event.shopState, submission: Submission.editing));
  }

  // _onEditShopAddress(EditShopAddress event, Emitter<AddOffersState> emit) {
  //   emit(state.copyWith(
  //       shopAddress: event.shopAddress, submission: Submission.editing));
  // }

  _onEditShopEmail(EditShopEmail event, Emitter<AddOffersState> emit) {
    emit(state.copyWith(
        shopEmail: event.shopEmail, submission: Submission.editing));
  }

  _onEditShopPhoneNumber(
      EditShopPhoneNumber event, Emitter<AddOffersState> emit) {
    emit(state.copyWith(
        shopPhoneNumber: event.shopPhoneNumber,
        submission: Submission.editing));
  }

  // Future checkInfo() async {
  //   final rp = RegisterShopProvider();
  //   await rp.checkIfAddressExist();
  // setState(() {

  //   // categoriesController.text = rp.shopCategories ?? '';
  //   // categoriesText = rp.shopCategories;

  //   nameController.text = rp.shopName ?? '';
  //   nameText = rp.shopName ?? '';

  //   descriptionController.text = rp.shopDescription ?? '';
  //   descriptionText = rp.shopDescription ?? '';

  //   address = rp.shopAddress;
  //   imageUrl = rp.shopImage ?? '';
  // });
  // }

  // _onRegisterShopToFireBase(
  //     RegisterShopToFireBase event, Emitter<AddOffersState> emit) async {
  //   emit(state.copyWith(submission: Submission.loading));

  //   try {
  //     // final RegisterShopProvider registerShopProvider;

  //     // final rp = context.read<RegisterShopProvider>();
  //     final result = await RegisterShopProvider().checkIfAddressExist();

  //     if (result.shopName != "") {
  //       emit(state.copyWith(
  //         submission: Submission.success,
  //         branches_list: result.branchesList,
  //         shopName: result.shopName,
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

  _onFetchOffersImages(
      FetchOffersImages event, Emitter<AddOffersState> emit) async {
    await RegisterOfferProvider().fetchOfferImages().then((value) {
      emit(state.copyWith(offerImages: value));
    });
  }

  _onAddOffers(AddOffers event, Emitter<AddOffersState> emit) async {
    emit(state.copyWith(submission: Submission.loading));

    final result = await RegisterOfferProvider().addOffer(
      image: state.imageXFile,
      showOffersDisplay: state.showOffersDisplay,
      offersDuration: state.offersDuration,
      startOffersDate:
          "${state.startDay}/${state.startMonth}/${state.startYear}",
      endOffersDate: "${state.endDay}/${state.endMonth}/${state.endYear}",
      originalPrice: state.originalPrice,
      currency: state.currency,
      discountPercentage: state.discountPercentage,
      discountPercentageFrom: state.discountPercentageFrom,
      discountPercentageTo: state.discountPercentageTo,
      priceAfterDiscount: state.priceAfterDiscount,
    );

    // if (result.isRegistered) {
    emit(state.copyWith(
        submission: Submission.success,
        // data: result, // Adjust this if you need specific fields from `result`
        showOffersDisplay: result.showOffersDisplay,
        priceAfterDiscount: result.priceAfterDiscount,
        currency: result.currency,
        originalPrice: result.originalPrice,
        // endOffersDate: result.endOffersDate,

        // startOffersDate:result.startOffersDate,

        offersDuration: result.offersDuration,
        discountPercentage: result.discountPercentage,
        discountPercentageFrom: result.discountPercentageFrom,
        discountPercentageTo: result.discountPercentageTo));
    // } else {
    //   emit(state.copyWith(submission: Submission.noDataFound));
    // }
  }
}
