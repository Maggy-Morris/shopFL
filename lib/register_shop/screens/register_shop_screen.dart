import 'dart:io';
import 'package:csc_picker/csc_picker.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:anwer_shop/authentication/widgets/custom_textbutton.dart';
import 'package:anwer_shop/constants/colors.dart';
import 'package:anwer_shop/generated/assets.dart';
import 'package:anwer_shop/models/address.dart';
import 'package:anwer_shop/providers/register_shop_provider.dart';
import 'package:anwer_shop/register_shop/bloc/register_shop_bloc.dart';
import 'package:anwer_shop/register_shop/screens/search_address_manual_screen.dart';
import 'package:anwer_shop/widgets/drop_down_widgets.dart';

import 'package:latlong2/latlong.dart';

import '../../widgets/Icons_wit_text.dart';
import '../../widgets/assetImage_withtext.dart';
import '../../widgets/branches_widget.dart';
import '../../widgets/icon_buttons.dart';

class RegisterShopScreen extends StatelessWidget {
  static const String routeName = '/register-shop-screen';
  RegisterShopScreen({super.key});

  dynamic mapPreviewController;

  MapController? mapController;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          RegisterShopBloc(registerShopProvider: RegisterShopProvider())
            ..add(const RegisterShopToFireBase()),
      child: BlocBuilder<RegisterShopBloc, RegisterShopState>(
        builder: (context, state) {
          TextEditingController controllerShopDescription =
              TextEditingController(text: state.shopDescription);

          TextEditingController controllerShopCategories =
              TextEditingController(text: state.shopCategories);

          TextEditingController controllerShopLocation =
              TextEditingController(text: state.shopLocation);

          TextEditingController controllerShopWebsite =
              TextEditingController(text: state.shopWebsite);

          TextEditingController controllerShopEmail =
              TextEditingController(text: state.shopEmail);
          TextEditingController controllerShopPhoneNumber =
              TextEditingController(text: state.shopPhoneNumber);

          return Scaffold(
            backgroundColor: MyColors.onBackground,
            appBar: AppBar(
              foregroundColor: Colors.white,
              title: Text(
                'بياناتي'.tr(),
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                ),
              ),
              centerTitle: true,
              actions: [
                IconButton(
                  onPressed:
                      //  state.shopName.isNotEmpty &&
                      // state.shopDescription.isNotEmpty &&
                      //         state.shopAddress != null
                      // &&
                      // ((state.imageXFile == null &&
                      //         state.shopImage.isNotEmpty) ||
                      //     (state.imageXFile != null &&
                      //         state.shopImage.isEmpty))
                      // ?
                      () {
                    RegisterShopBloc.get(context).add(EditShopDescription(
                        shopDescription: controllerShopDescription.text));

                    RegisterShopBloc.get(context).add(EditShopCategories(
                        shopCategories: controllerShopCategories.text));

                    RegisterShopBloc.get(context).add(EditShopLocation(
                        shopLocation: controllerShopWebsite.text));
                    RegisterShopBloc.get(context).add(
                        EditShopEmail(shopEmail: controllerShopEmail.text));
                    RegisterShopBloc.get(context).add(EditShopPhoneNumber(
                        shopPhoneNumber: controllerShopPhoneNumber.text));

                    RegisterShopBloc.get(context)
                        .add(const EditShopDataToFireBase());
                    Navigator.pop(context);
                  },
                  // : null,
                  icon: Icon(
                    Icons.arrow_forward_ios_sharp,
                    color: state.shopDescription.isNotEmpty &&
                            state.shopAddress != null &&
                            ((state.imageXFile == null &&
                                    state.shopImage.isNotEmpty) ||
                                (state.imageXFile != null &&
                                    state.shopImage.isEmpty))
                        ? Colors.white
                        : Colors.black,
                  ),
                ),
              ],
            ),
            body: Padding(
              padding: const EdgeInsets.all(15),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const SizedBox(height: 20),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: Text(
                            state.shopName,
                            style: const TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                            ),
                          ),
                        ),
                        CircleAvatar(
                          backgroundColor: Colors
                              .transparent, // Optional, sets the background to transparent

                          radius: 30,
                          child: Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: state.shopImage.isNotEmpty
                                    ? NetworkImage(state.shopImage)
                                    : const AssetImage(
                                            "assets/images/person_icon.png")
                                        as ImageProvider,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 15),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        IconWithText(
                            color: MyColors.primary,
                            text: "اضافة".tr(),
                            onPressed: () {},
                            icon: Icons.add_box_rounded),
                        ImageWithText(
                          color: MyColors.red,
                          text: "حذف".tr(),
                          onPressed: () {},
                          imagePath: Assets
                              .trashCan, // Replace 'assets/delete_icon.png' with your image asset path
                        ),
                        IconWithText(
                            color: MyColors.textColor,
                            text: "معاينة".tr(),
                            onPressed: () {},
                            icon: Icons.search),
                      ],
                    ),

                    // TextFormField(
                    //   initialValue: state.shopName,

                    //   textAlign: TextAlign.end,

                    //   onChanged: (value) {
                    //     RegisterShopBloc.get(context)
                    //         .add(EditShopName(shopName: value));
                    //   },
                    //   // maxLength: 500,
                    //   style: const TextStyle(
                    //     fontSize: 14,
                    //     fontWeight: FontWeight.normal,
                    //   ),
                    //   maxLines: 2,
                    //   decoration: InputDecoration(
                    //     border: InputBorder.none,
                    //     hintText: 'من نحن'.tr(),
                    //     counterStyle: TextStyle(
                    //       color: MyColors.white,
                    //     ),
                    //   ),
                    // ),

                    // const SizedBox(height: 20),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: MyColors.white,
                        border: Border.all(
                          color: MyColors.white,
                        ),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: TextFormField(
                        controller: controllerShopDescription,
                        // initialValue: state.shopDescription,

                        textAlign: TextAlign.end,

                        // onChanged: (value) {
                        //   RegisterShopBloc.get(context)
                        //       .add(EditShopDescription(shopDescription: controllerShopDescription));
                        // },
                        // maxLength: 500,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                        ),
                        maxLines: 2,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'من نحن'.tr(),
                          counterStyle: TextStyle(
                            color: MyColors.white,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "الفئات".tr(),
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w400),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: MyColors.white,
                        border: Border.all(
                          color: MyColors.white,
                        ),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: TextFormField(
                          controller: controllerShopCategories,
                          // initialValue: state.shopCategories,
                          textAlign: TextAlign.end,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "الفئة".tr(),
                            counterStyle: TextStyle(
                              color: Colors.grey[500],
                            ),
                          ),
                          // onChanged: (value) {
                          //   RegisterShopBloc.get(context).add(
                          //       EditShopCategories(
                          //           shopCategories:
                          //               controllerShopCategories.text));
                          // },
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        IconWithText(
                            color: MyColors.primary,
                            text: "تعديل".tr(),
                            onPressed: () {},
                            icon: Icons.mode_edit_outlined),
                        IconWithText(
                            color: MyColors.primary,
                            text: "اضافة فئة".tr(),
                            onPressed: () {},
                            icon: Icons.add_box_rounded),
                        ImageWithText(
                          color: MyColors.red,
                          text: "حذف فئة".tr(),
                          onPressed: () {},
                          imagePath: Assets
                              .trashCan, // Replace 'assets/delete_icon.png' with your image asset path
                        ),
                      ],
                    ),

                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "نوع المتجر".tr(),
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w400),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: MyColors.white,
                        border: Border.all(
                          color: MyColors.white,
                        ),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: singleSelectGenericDropdown(
                          selectedItem:
                              state.shopType.isEmpty ? null : state.shopType,
                          iconWidget: Icon(Icons.keyboard_arrow_down_sharp),
                          titleName:
                              // state.shopType.isEmpty
                              // ?
                              "نوع المتجر".tr(),
                          // : state.shopType,
                          itemsList: ['مركز', 'معرض', 'اخرى'],
                          isEnabled: true,
                          isRequired: false,
                          onChanged: (value) {
                            RegisterShopBloc.get(context)
                                .add(EditShopType(shopType: value!));
                          }),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      'الموقع'.tr(),
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 10),

                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          SearchAddressManualScreen.routeName,
                          arguments: {
                            'mapController':
                                mapController, // Pass the map controller
                            'initialLatLng': state.shopAddress != null
                                ? LatLng(state.shopAddress?.latitude ?? 0,
                                    state.shopAddress?.longitude ?? 0)
                                : null,
                            'changeAddress': (Address newAddress) {
                              RegisterShopBloc.get(context).add(
                                  EditShopAddress(shopAddress: newAddress));
                            },
                          },
                        );
                      },
                      child: DottedBorder(
                        color: Colors.grey[500]!,
                        strokeWidth: 1,
                        dashPattern: const [10, 6],
                        child: Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(10),
                          child: state.shopAddress == null
                              ? SizedBox(
                                  height: 130,
                                  child: Center(
                                    child: Column(
                                      children: [
                                        Image.asset(
                                          'assets/images/foodpanda_location.png',
                                          width: 100,
                                        ),
                                        const Text(
                                          'Choose location',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                )
                              : Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Center(
                                      child: SizedBox(
                                        width: 100,
                                        height: 100,
                                        child: FlutterMap(
                                          mapController: mapController,
                                          options: MapOptions(
                                            center:
                                                //  LatLng(30.044420,
                                                //     31.235712), // Cairo's coordinates
                                                LatLng(
                                                    state.shopAddress
                                                            ?.latitude ??
                                                        0,
                                                    state.shopAddress
                                                            ?.longitude ??
                                                        0),
                                            zoom: 7.2,
                                          ),
                                          children: [
                                            TileLayer(
                                              urlTemplate:
                                                  'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
                                              subdomains: const [
                                                'a',
                                                'b',
                                                'c',
                                                'd'
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    Text(
                                      '${state.shopAddress!.houseNumber.isEmpty ? '' : state.shopAddress!.houseNumber + ' '}${state.shopAddress!.street}',
                                    ),
                                    Text(state.shopAddress!.province),
                                  ],
                                ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'شعار المحل',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: SizedBox(
                        height: 120,
                        width: 120,
                        child: Card(
                          color: Colors.white,
                          child: state.imageXFile == null
                              ? IconButton(
                                  icon: const Icon(
                                    Icons.add_photo_alternate_rounded,
                                    color: MyColors.primary,
                                  ),
                                  onPressed: () {
                                    showDialog(
                                      context: context,
                                      builder: (_) {
                                        return BlocProvider.value(
                                          value: RegisterShopBloc.get(context),
                                          child: BlocBuilder<RegisterShopBloc,
                                              RegisterShopState>(
                                            buildWhen: (previous, current) =>
                                                previous.imageXFile !=
                                                current.imageXFile,
                                            builder: (context, state) {
                                              return AlertDialog(
                                                content: SizedBox(
                                                  height: 200,
                                                  width: double.infinity,
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      state.imageXFile == null
                                                          ? const Icon(
                                                              Icons
                                                                  .camera_alt_outlined,
                                                              size: 70,
                                                            )
                                                          : Stack(
                                                              children: [
                                                                SizedBox(
                                                                  height: 100,
                                                                  width: 150,
                                                                  child: Image
                                                                      .file(
                                                                    File(state
                                                                        .imageXFile!
                                                                        .path),
                                                                    fit: BoxFit
                                                                        .cover,
                                                                    errorBuilder:
                                                                        (context,
                                                                            error,
                                                                            stackTrace) {
                                                                      return const SizedBox
                                                                          .shrink();
                                                                    },
                                                                  ),
                                                                ),
                                                                Positioned(
                                                                  top: 0,
                                                                  right: 0,
                                                                  child:
                                                                      IconButton(
                                                                    icon:
                                                                        const Icon(
                                                                      Icons
                                                                          .delete,
                                                                      color: Colors
                                                                          .red,
                                                                    ),
                                                                    onPressed:
                                                                        () {
                                                                      RegisterShopBloc.get(
                                                                              context)
                                                                          .add(pickImageXFile(
                                                                              imageXFile: null));
                                                                    },
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          SizedBox(
                                                            width: 110,
                                                            child:
                                                                CustomTextButton(
                                                              text:
                                                                  'Take a photo',
                                                              onPressed:
                                                                  () async {
                                                                RegisterShopBloc
                                                                        .get(
                                                                            context)
                                                                    .captureAndAddImage();
                                                                // await _picker
                                                                //     .pickImage(
                                                                //   source:
                                                                //       ImageSource
                                                                //           .camera,
                                                                //   maxHeight:
                                                                //       720,
                                                                //   maxWidth:
                                                                //       1280,
                                                                // )
                                                                //     .then(
                                                                //         (value) {
                                                                //   RegisterShopBloc
                                                                //           .get(
                                                                //               context)
                                                                //       .add(
                                                                //     pickImageXFile(
                                                                //         imageXFile:
                                                                //             value),
                                                                //   );
                                                                //   RegisterShopBloc
                                                                //           .get(
                                                                //               context)
                                                                //       .add(
                                                                //     EditShopImage(
                                                                //         shopImage:
                                                                //             value?.path ??
                                                                //                 ""),
                                                                //   );
                                                                // });
                                                              },
                                                              isDisabled: false,
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            width: 110,
                                                            child:
                                                                CustomTextButton(
                                                              text:
                                                                  'Upload a photo',
                                                              onPressed:
                                                                  () async {
                                                                RegisterShopBloc
                                                                        .get(
                                                                            context)
                                                                    .pickAndAddFile();

                                                                // await _picker
                                                                //     .pickImage(
                                                                //   source:
                                                                //       ImageSource
                                                                //           .gallery,
                                                                //   maxHeight:
                                                                //       720,
                                                                //   maxWidth:
                                                                //       1280,
                                                                // )
                                                                //     .then(
                                                                //         (value) {
                                                                //   RegisterShopBloc
                                                                //           .get(
                                                                //               context)
                                                                //       .add(
                                                                //     pickImageXFile(
                                                                //         imageXFile:
                                                                //             value),
                                                                //   );
                                                                //   RegisterShopBloc
                                                                //           .get(
                                                                //               context)
                                                                //       .add(
                                                                //     EditShopImage(
                                                                //         shopImage:
                                                                //             value?.path ??
                                                                //                 ""),
                                                                //   );
                                                                // });
                                                              },
                                                              isDisabled: false,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              );
                                            },
                                          ),
                                        );
                                      },
                                    );
                                  },
                                )
                              : Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 8.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                          height: 120,
                                          width: 100,
                                          child: Center(
                                            child: Image.file(
                                              File(
                                                  state.imageXFile!.path ?? ""),
                                              fit: BoxFit.cover,
                                              errorBuilder:
                                                  (context, error, stackTrace) {
                                                return const SizedBox.shrink();
                                              },
                                            ),
                                          )),
                                    ],
                                  ),
                                ),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10.00),
                          child: ImageWithText(
                            color: MyColors.red,
                            text: "حذف".tr(),
                            onPressed: () {
                              RegisterShopBloc.get(context)
                                  .removeFileAtIndex(0);
                              // RegisterShopBloc.get(context)
                              //     .add(pickImageXFile(imageXFile: null));
                            },
                            imagePath: Assets
                                .trashCan, // Replace with your image asset path
                          ),
                        ),
                      ],
                    ),

                    CSCPicker(
                      showStates: true,
                      showCities: false,
                      flagState: CountryFlag.DISABLE,
                      dropdownDecoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        color: Colors.white,
                        border: Border.all(color: Colors.white, width: 1),
                      ),
                      disabledDropdownDecoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: Colors.grey.shade300,
                        border:
                            Border.all(color: Colors.grey.shade300, width: 1),
                      ),
                      countrySearchPlaceholder: "الدولة",
                      stateSearchPlaceholder: "المدينة",
                      citySearchPlaceholder: "City",
                      countryDropdownLabel: "الدولة",
                      stateDropdownLabel: "المدينة",
                      cityDropdownLabel: "City",
                      selectedItemStyle: const TextStyle(
                        color: MyColors.lightText,
                        fontSize: 14,
                      ),
                      dropdownHeadingStyle: TextStyle(
                        color: Colors.black,
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                      dropdownItemStyle: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                      ),
                      dropdownDialogRadius: 20.0,
                      searchBarRadius: 10.0,
                      onCountryChanged: (value) {
                        RegisterShopBloc.get(context)
                            .add(EditShopCity(shopCity: value));
                      },
                      onStateChanged: (value) {
                        RegisterShopBloc.get(context)
                            .add(EditShopState(shopState: value ?? ""));
                      },
                      onCityChanged: (value) {
                        // Handle city change
                      },
                    ),
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "العنوان".tr(),
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w400),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: MyColors.white,
                        border: Border.all(
                          color: MyColors.white,
                        ),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: TextFormField(
                          textAlign: TextAlign.end,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "العنوان".tr(),
                            counterStyle: TextStyle(
                              color: Colors.grey[500],
                            ),
                          ),
                          controller: controllerShopLocation,

                          // initialValue: state.shopCategories,
                          // onChanged: (value) {
                          //   RegisterShopBloc.get(context)
                          //       .add(EditShopCategories(shopCategories: controllerShopLocation.text));
                          // },
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "الموقع الالكتروني".tr(),
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w400),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: MyColors.white,
                        border: Border.all(
                          color: MyColors.white,
                        ),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: TextFormField(
                          textAlign: TextAlign.end,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "الموقع الالكتروني".tr(),
                            counterStyle: TextStyle(
                              color: Colors.grey[500],
                            ),
                          ),
                          controller: controllerShopWebsite,

                          // initialValue: state.shopLocation,
                          // onChanged: (value) {
                          //   RegisterShopBloc.get(context)
                          //       .add(EditShopLocation(shopLocation: controllerShopWebsite.text));
                          // },
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "البريد الالكتروني".tr(),
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w400),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: MyColors.white,
                        border: Border.all(
                          color: MyColors.white,
                        ),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: TextFormField(
                          textAlign: TextAlign.end,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "البريد الالكتروني".tr(),
                            counterStyle: TextStyle(
                              color: Colors.grey[500],
                            ),
                          ),
                          controller: controllerShopEmail,
                          // initialValue: state.shopEmail,
                          // onChanged: (value) {
                          //   RegisterShopBloc.get(context)
                          //       .add(EditShopEmail(shopEmail: controllerShopEmail.text));
                          // },
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "رقم الهاتف".tr(),
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w400),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: MyColors.white,
                        border: Border.all(
                          color: MyColors.white,
                        ),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: TextFormField(
                          textAlign: TextAlign.end,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "رقم الهاتف".tr(),
                            counterStyle: TextStyle(
                              color: Colors.grey[500],
                            ),
                          ),
                          controller: controllerShopPhoneNumber,
                          keyboardType: TextInputType.phone,
                          // initialValue: state.shopPhoneNumber.toString(),
                          // onChanged: (value) {
                          //   RegisterShopBloc.get(context).add(
                          //       EditShopPhoneNumber(shopPhoneNumber: controllerShopPhoneNumber.text));
                          // },
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon_button(
                          onPressed: () {},
                          imagePath: Assets
                              .whatsApp, // Replace 'assets/delete_icon.png' with your image asset path
                        ),
                        Icon_button(
                          onPressed: () {},
                          imagePath: Assets
                              .facebook, // Replace 'assets/delete_icon.png' with your image asset path
                        ),
                        Icon_button(
                          onPressed: () {},
                          imagePath: Assets
                              .instgram, // Replace 'assets/delete_icon.png' with your image asset path
                        ),
                        Icon_button(
                          onPressed: () {},
                          imagePath: Assets
                              .twitter, // Replace 'assets/delete_icon.png' with your image asset path
                        ),
                        Icon_button(
                          onPressed: () {},
                          imagePath: Assets
                              .snapChat, // Replace 'assets/delete_icon.png' with your image asset path
                        ),
                      ],
                    ),

                    const Divider(
                      height: 50,
                      color: Color.fromARGB(108, 158, 158, 158),
                    ),

                    // Text(state.branches_list.length.toString()),

                    BranchesWidget(
                      onBranchesChanged: (branches) {
                        RegisterShopBloc.get(context)
                            .add(EditbranchesList(branchesList: branches));
                      },
                    ),

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SingleChildScrollView(
                        child: Column(
                          children: state.branchesList.map((branch) {
                            return Card(
                              // elevation: 3,
                              margin: const EdgeInsets.symmetric(vertical: 8),
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'دولة'.tr(),
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.grey[700],
                                          ),
                                        ),
                                        SizedBox(height: 4),
                                        Text(
                                          'مدينة'.tr(),
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.grey[700],
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          branch.country ?? 'N/A',
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: Colors.black,
                                          ),
                                        ),
                                        SizedBox(height: 4),
                                        Text(
                                          branch.state ?? 'N/A',
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "المنتجات التي تباع في هذاالمتجر".tr(),
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w400),
                      ),
                    ),

                    SizedBox(
                      // width: 200,
                      height: 100,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: items.length,
                        itemBuilder: (context, index) {
                          return CardWidget(item: items[index]);
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Text("عدد المشاركات"),
                            Card(
                              color: MyColors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              elevation: 1.0,
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 30.0, vertical: 10),
                                child: Text("15"),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Text("عدد المشاهدات"),
                            Card(
                              color: MyColors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              elevation: 1.0,
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 30.0, vertical: 10),
                                child: Text("15"),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Text("عدد المتابعين"),
                            Card(
                              color: MyColors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              elevation: 1.0,
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 30.0, vertical: 10),
                                child: Text("15"),
                              ),
                            ),
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

// Sample data model
class Item {
  final String imagePath;
  // final String title;
  // final String description;

  Item({
    required this.imagePath,
    // required this.title,
    // required this.description,
  });
}

// Sample data
final List<Item> items = [
  Item(
    imagePath: Assets.imagesCoupon, // Replace with your asset paths
    // title: 'Item 1',
    // description: 'This is the description for item 1.',
  ),
  Item(
    imagePath: Assets.imagesCoupon, // Replace with your asset paths
    // title: 'Item 2',
    // description: 'This is the description for item 2.',
  ),
  // Add more items here
];

class CardWidget extends StatelessWidget {
  final Item item;

  CardWidget({required this.item});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      elevation: 3.0,
      child: Padding(
        padding: EdgeInsets.all(5.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8.0),
          child: Image.asset(
            item.imagePath,
            fit: BoxFit.cover,
            height: 100, // Adjust the height as needed
            width: 100, // Adjust the width as needed
          ),
        ),
      ),
    );
  }
}
