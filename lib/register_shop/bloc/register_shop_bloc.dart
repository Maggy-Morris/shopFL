import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:anwer_shop/providers/register_shop_provider.dart';
import 'package:anwer_shop/widgets/branches_widget.dart';
import 'package:image_picker/image_picker.dart';
import '../../models/address.dart';
import '../../widgets/enum/enum.dart';
part 'register_shop_event.dart';
part 'register_shop_state.dart';

class RegisterShopBloc extends Bloc<RegisterShopEvent, RegisterShopState> {
  final RegisterShopProvider registerShopProvider;
  static RegisterShopBloc get(context) =>
      BlocProvider.of<RegisterShopBloc>(context);

  RegisterShopBloc({required this.registerShopProvider})
      : super(RegisterShopState()) {
    on<RegisterShopEvent>((event, emit) {});
    on<EditShopName>(_onEditShopName);

    on<EditShopDescription>(_onEditShopDescription);
    on<EditShopCategories>(_onEditShopCategories);
    on<EditShopType>(_onEditShopType);
    on<EditShopLocation>(_onEditShopLocation);
    on<EditShopState>(_onEditShopState);
    on<EditShopCity>(_onEditShopCity);

    on<EditShopAddress>(_onEditShopAddress);
    on<EditShopEmail>(_onEditShopEmail);
    on<EditShopPhoneNumber>(_onEditShopPhoneNumber);
    on<EditbranchesList>(_onEditbranchesList);
    // on<AddFilesEvent>(_onAddFilesEvent);

    on<EditShopImage>(_onEditShopImage);

    on<PickImageXFile>(_onPickImageXFile);

    on<RegisterShopToFireBase>(_onRegisterShopToFireBase);
    on<EditShopDataToFireBase>(_onEditShopDataToFireBase);
  }

  _onEditShopDescription(
      EditShopDescription event, Emitter<RegisterShopState> emit) {
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

  _onEditbranchesList(EditbranchesList event, Emitter<RegisterShopState> emit) {
    // Filter out branches with null country or state
    final validNewBranches = event.branchesList.where((branch) {
      return branch.country != null && branch.state != null;
    }).toList();

    // Create a set of existing countries and states for quick lookup
    final existingBranches = state.branchesList
        .map((branch) => '${branch.country}-${branch.state}')
        .toSet();

    // Filter out new branches that are already in the existing list
    final nonDuplicateNewBranches = validNewBranches.where((branch) {
      return !existingBranches.contains('${branch.country}-${branch.state}');
    }).toList();

    // Merge the existing branches with the valid, non-duplicate new branches
    final updatedBranchesList = List<Branches>.from(state.branchesList)
      ..addAll(nonDuplicateNewBranches);

    emit(state.copyWith(
      branchesList: updatedBranchesList,
      submission: Submission.editing,
    ));
  }

  _onPickImageXFile(PickImageXFile event, Emitter<RegisterShopState> emit) {
    debugPrint("Event received: ${event.imageXFile?.path}");

    if (event.imageXFile == null) {
      emit(state.copyWith(
          imageXFile: event.imageXFile, submission: Submission.editing));
    } else {
      emit(state.copyWith(
          imageXFile: event.imageXFile, submission: Submission.editing));
    }
    debugPrint("State updated: ${state.imageXFile?.path}");
  }

  _onEditShopImage(EditShopImage event, Emitter<RegisterShopState> emit) {
    emit(state.copyWith(
        shopImage: event.shopImage, submission: Submission.editing));
  }

  _onEditShopName(EditShopName event, Emitter<RegisterShopState> emit) {
    emit(state.copyWith(
        shopName: event.shopName, submission: Submission.editing));
  }

  _onEditShopCategories(
      EditShopCategories event, Emitter<RegisterShopState> emit) {
    emit(state.copyWith(
        shopCategories: event.shopCategories, submission: Submission.editing));
  }

  _onEditShopType(EditShopType event, Emitter<RegisterShopState> emit) {
    emit(state.copyWith(
        shopType: event.shopType, submission: Submission.editing));
  }

  _onEditShopLocation(EditShopLocation event, Emitter<RegisterShopState> emit) {
    emit(state.copyWith(
        shopLocation: event.shopLocation, submission: Submission.editing));
  }

  _onEditShopCity(EditShopCity event, Emitter<RegisterShopState> emit) {
    emit(state.copyWith(
        shopCity: event.shopCity, submission: Submission.editing));
  }

  _onEditShopState(EditShopState event, Emitter<RegisterShopState> emit) {
    emit(state.copyWith(
        shopState: event.shopState, submission: Submission.editing));
  }

  _onEditShopAddress(EditShopAddress event, Emitter<RegisterShopState> emit) {
    emit(state.copyWith(
        shopAddress: event.shopAddress, submission: Submission.editing));
  }

  _onEditShopEmail(EditShopEmail event, Emitter<RegisterShopState> emit) {
    emit(state.copyWith(
        shopEmail: event.shopEmail, submission: Submission.editing));
  }

  _onEditShopPhoneNumber(
      EditShopPhoneNumber event, Emitter<RegisterShopState> emit) {
    emit(state.copyWith(
        shopPhoneNumber: event.shopPhoneNumber,
        submission: Submission.editing));
  }

  Future checkInfo() async {
    final rp = RegisterShopProvider();
    await rp.checkIfAddressExist();
  }

  _onRegisterShopToFireBase(
      RegisterShopToFireBase event, Emitter<RegisterShopState> emit) async {
    emit(state.copyWith(submission: Submission.loading));

    try {
      // final RegisterShopProvider registerShopProvider;

      // final rp = context.read<RegisterShopProvider>();
      final result = await RegisterShopProvider().checkIfAddressExist();

      if (result.shopName != "") {
        emit(state.copyWith(
          submission: Submission.success,
          branchesList: result.branchesList,
          shopName: result.shopName,
          shopDescription: result.shopDescription,
          shopAddress: result.shopAddress,
          shopLocation: result.addressWritten,
          shopImage: result.shopImage,
          shopCategories: result.shopCategories,
          shopType: result.shopType,
          shopWebsite: result.shopWebsite,
          shopEmail: result.shopEmail,
          shopPhoneNumber: result.shopPhoneNumber,
          shareCount: result.shareCount,
          shopCity: result.shopCityMainBranch,
          shopState: result.shopStateMainBranch,
          followersCount: result.followersCount,
          viewersCount: result.viewersCount,
        ));
      } else {
        emit(state.copyWith(submission: Submission.noDataFound));
      }
    } catch (e) {
      emit(state.copyWith(submission: Submission.error));
      debugPrint("Error fetching shop info: $e");
    }
  }

  void captureAndAddImage() async {
    try {
      XFile? image = await ImagePicker().pickImage(
        source: ImageSource.camera,
      );

      if (image != null) {
        int size = await File(image.path).length();
        PlatformFile pickedFile = PlatformFile(
          name: image.name,
          path: image.path,
          size: size,
          bytes: await File(image.path).readAsBytes(),
        );

        add(AddFileEvent(file: pickedFile));
        emit(state.copyWith(imageXFile: pickedFile.xFile));

        add(EditShopImage(
            shopImage: image.path)); // Update with your actual event
      }
    } catch (error) {
      debugPrint("Error picking image from camera: $error");
    }
  }

  void pickAndAddFile() async {
    try {
      final ImagePicker picker = ImagePicker();
      XFile? result = await picker.pickImage(source: ImageSource.gallery);

      if (result != null) {
        int size = await File(result.path).length();
        PlatformFile pickedFile = PlatformFile(
          name: result.name,
          path: result.path,
          size: size,
          bytes: await File(result.path).readAsBytes(),
        );

        add(AddFileEvent(file: pickedFile));
        emit(state.copyWith(imageXFile: pickedFile.xFile));
        add(EditShopImage(
            shopImage: result.path)); // Update with your actual event
      }
    } catch (error) {
      debugPrint("Error picking image: $error");
    }
  }

  void removeFile() {
    add(const RemoveFileEvent());
    emit(state.copyWith(imageXFile: null));
  }

///////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////

  _onEditShopDataToFireBase(
      EditShopDataToFireBase event, Emitter<RegisterShopState> emit) async {
    emit(state.copyWith(submission: Submission.loading));

    final result = await RegisterShopProvider().registerShop(
      branchesList: state.branchesList,
      shopName: state.shopName,
      shopDescription: state.shopDescription,
      address: state.shopAddress ??
          Address(
              houseNumber: "",
              street: "",
              area: "",
              latitude: 0,
              longitude: 0,
              province: "",
              floor: ''),
      imageUrl: state.shopImage,
      image: state.imageXFile,
      shopCategories: state.shopCategories,
      shopType: state.shopType,
      shopAddress: state.shopLocation,
      shopPhoneNumber: state.shopPhoneNumber,
      shopEmail: state.shopEmail,
      shopWebsite: state.shopWebsite,
      shopCityMainBranch: state.shopCity,
      shopStateMainBranch: state.shopState,
    );

    // if (result.isRegistered) {
    emit(state.copyWith(
      submission: Submission.success,
      // data: result, // Adjust this if you need specific fields from `result`
      shopName: result.shopName,
      shopDescription: result.shopDescription,
      shopAddress: result.shopAddress,
      shopLocation: result.addressWritten,
      branchesList: result.branchesList,

      shopImage: result.shopImage,
      shopCategories: result.shopCategories,
      shopType: result.shopType,
    ));
  }
}
