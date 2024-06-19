import 'dart:io';
import 'package:card_swiper/card_swiper.dart';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:foodpanda_seller/adds/bloc/adds_bloc.dart';
import 'package:foodpanda_seller/authentication/widgets/custom_textbutton.dart';
import 'package:foodpanda_seller/constants/colors.dart';
import 'package:foodpanda_seller/generated/assets.dart';

// import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image_picker/image_picker.dart';

import '../../widgets/Icons_wit_text.dart';
import '../../widgets/assetImage_withtext.dart';

import '../widgets/button_widget.dart';
import '../widgets/constant/toast.dart';

class AddsScreen extends StatefulWidget {
  static const String routeName = '/addsScreen-screen';
  const AddsScreen({super.key});

  @override
  State<AddsScreen> createState() => _AddsScreenState();
}

class _AddsScreenState extends State<AddsScreen> {
  XFile? imageXFile;
  final ImagePicker _picker = ImagePicker();
  // GoogleMapController? mapPreviewController;

  // TextEditingController nameController = TextEditingController();
  // TextEditingController categoriesController = TextEditingController();

  // TextEditingController descriptionController = TextEditingController();

  // String nameText = '';
  // String categoriesText = '';

  // String descriptionText = '';
  String imageUrl = '';
  // Address? address;

  // /// Variables to store country state city data in onChanged method.
  // String? countryValue = "";
  // String? stateValue = "";
  // String? cityValue = "";
  // String address = "";

  // Future checkInfo() async {
  //   final rp = context.read<RegisterShopProvider>();
  //   await rp.checkIfAddressExist();
  //   setState(() {
  //     // categoriesController.text = rp.shopCategories ?? '';
  //     // categoriesText = rp.shopCategories;

  //     nameController.text = rp.shopName ?? '';
  //     nameText = rp.shopName ?? '';

  //     descriptionController.text = rp.shopDescription ?? '';
  //     descriptionText = rp.shopDescription ?? '';

  //     address = rp.shopAddress;
  //     imageUrl = rp.shopImage ?? '';
  //   });
  // }

  // @override
  // void initState() {
  //   super.initState();
  //   checkInfo();
  // }

  // @override
  // void dispose() {
  //   super.dispose();
  //   nameController.dispose();
  //   descriptionController.dispose();
  // }

  // handleRegisterShop() async {
  //   final registerShopProvider = context.read<RegisterShopProvider>();
  //   final internetProvider = context.read<InternetProvider>();

  //   await internetProvider.checkInternetConnection();
  //   if (internetProvider.hasInternet == false) {
  //     Navigator.pop(context);
  //     openSnackbar(context, 'Check your internet connection', scheme.primary);
  //   } else {
  //     if (imageUrl.isNotEmpty) {
  //       await registerShopProvider.registerShop(
  //         shopName: nameController.text.trim().toString(),
  //         shopDescription: descriptionController.text.trim().toString(),
  //         imageUrl: imageUrl,
  //         address: address!,
  //       );
  //     } else {
  //       await registerShopProvider.registerShop(
  //         shopName: nameController.text.trim().toString(),
  //         shopDescription: descriptionController.text.trim().toString(),
  //         image: imageXFile!,
  //         address: address!,
  //       );
  //     }

  //     Navigator.pop(context);
  //   }
  // }

  // takePhoto() async {
  //   imageXFile = await _picker.pickImage(
  //     source: ImageSource.camera,
  //     maxHeight: 720,
  //     maxWidth: 1280,
  //   );

  //   setState(() {
  //     imageXFile;
  //   });
  // }

  // uploadPhoto() async {
  //   imageXFile = await _picker.pickImage(
  //     source: ImageSource.gallery,
  //     maxHeight: 720,
  //     maxWidth: 1280,
  //   );

  //   setState(() {
  //     imageXFile;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddsBloc()..add(const FetchAddsImages()),
      child: BlocBuilder<AddsBloc, AddsState>(
        builder: (context, state) {
          return Scaffold(
            backgroundColor: MyColors.onBackground,
            appBar: AppBar(
              foregroundColor: Colors.white,
              title: Text(
                "الاعلانات".tr(),
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                ),
              ),
              centerTitle: true,
              actions: [
                IconButton(
                  onPressed: () {},
                  //  nameText.isNotEmpty &&
                  //         descriptionText.isNotEmpty &&
                  //         address != null &&
                  //         ((imageXFile == null && imageUrl.isNotEmpty) ||
                  //             (imageXFile != null && imageUrl.isEmpty))
                  //     ? null
                  //     : null,
                  icon: const Icon(
                    Icons.arrow_forward_ios_sharp,
                    color:
                        //  nameText.isNotEmpty &&
                        //         descriptionText.isNotEmpty &&
                        //         address != null &&
                        //         ((imageXFile == null && imageUrl.isNotEmpty) ||
                        //             (imageXFile != null && imageUrl.isEmpty))
                        //     ? Colors.white
                        //     :
                        Colors.black,
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
                    // Text(
                    //   'بياناتي'.tr(),
                    //   style: TextStyle(
                    //     fontSize: 14,
                    //     fontWeight: FontWeight.w600,
                    //     color: Colors.grey[600],
                    //   ),
                    // ),
                    // const Text(
                    //   'Fill in the informations',
                    //   style: TextStyle(
                    //     fontSize: 30,
                    //     fontWeight: FontWeight.w600,
                    //   ),
                    // ),

                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "نوع الاعلان".tr(),
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w400),
                      ),
                    ),

                    const SizedBox(height: 20),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text("خاص بالمتجر".tr()),
                        Checkbox(
                            value: state.shopRelated,
                            onChanged: (value) {
                              AddsBloc.get(context).add(
                                  EditShopRelated(shopRelated: value ?? false));
                            }),
                      ],
                    ),
                    const SizedBox(height: 20),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text("اعلان لجهه اخري".tr()),
                        Checkbox(
                            value: state.anotherShop,
                            onChanged: (value) {
                              AddsBloc.get(context).add(
                                  EditAnotherShop(anotherShop: value ?? false));
                            }),
                      ],
                    ),

                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "تحميل الاعلان".tr(),
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w400),
                      ),
                    ),

                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: SizedBox(
                        height: 55,
                        width: MediaQuery.of(context).size.width,
                        child:
                            //  imageXFile == null && imageUrl.isEmpty
                            //     ?
                            Container(
                          height: 55,
                          color: MyColors.white,
                          width: MediaQuery.of(context).size.width,
                          child: Center(
                            child: GestureDetector(
                              child: RichText(
                                text: const TextSpan(
                                  children: [
                                    TextSpan(
                                      text: "اضافة صورة للاعلان",
                                      style: TextStyle(
                                        color: MyColors.lightText,
                                        fontSize: 16,
                                      ),
                                    ),
                                    TextSpan(text: "     "),
                                    WidgetSpan(
                                      child: Icon(
                                        Icons.add_photo_alternate_rounded,
                                        color: MyColors.primary,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              onTap: () {
                                showDialog(
                                    context: context,
                                    builder: (ctx) {
                                      return BlocProvider.value(
                                        value: AddsBloc.get(context),
                                        child: BlocBuilder<AddsBloc, AddsState>(
                                          builder: (context, state) {
                                            return AlertDialog(
                                                content: SizedBox(
                                              height: 200,
                                              width: double.infinity,
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
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
                                                              child: Image.file(
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
                                                              child: IconButton(
                                                                icon:
                                                                    const Icon(
                                                                  Icons.delete,
                                                                  color: Colors
                                                                      .red,
                                                                ),
                                                                onPressed: () {
                                                                  AddsBloc.get(
                                                                          context)
                                                                      .add(pickImageXFile(
                                                                          imageXFile:
                                                                              null));
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
                                                        width: 100,
                                                        child: CustomTextButton(
                                                          text: 'Take a photo',
                                                          onPressed: () async {
                                                            await _picker
                                                                .pickImage(
                                                              source:
                                                                  ImageSource
                                                                      .camera,
                                                              maxHeight: 720,
                                                              maxWidth: 1280,
                                                            )
                                                                .then((value) {
                                                              AddsBloc.get(
                                                                      context)
                                                                  .add(pickImageXFile(
                                                                      imageXFile:
                                                                          value));
                                                              AddsBloc.get(
                                                                      context)
                                                                  .add(EditShopImage(
                                                                      shopImage:
                                                                          value?.path ??
                                                                              ""));
                                                            });
                                                          },
                                                          isDisabled: false,
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width: 100,
                                                        child: CustomTextButton(
                                                          text:
                                                              'Upload a photo',
                                                          onPressed: () async {
                                                            await _picker
                                                                .pickImage(
                                                              source:
                                                                  ImageSource
                                                                      .gallery,
                                                              maxHeight: 720,
                                                              maxWidth: 1280,
                                                            )
                                                                .then((value) {
                                                              AddsBloc.get(
                                                                      context)
                                                                  .add(pickImageXFile(
                                                                      imageXFile:
                                                                          value));
                                                              AddsBloc.get(
                                                                      context)
                                                                  .add(EditShopImage(
                                                                      shopImage:
                                                                          value?.path ??
                                                                              ""));
                                                            });
                                                          },
                                                          isDisabled: false,
                                                        ),
                                                      ),
                                                    ],
                                                  )
                                                ],
                                              ),
                                            )

                                                // title: const Text(
                                                //   'تحميل الصورة',
                                                //   style: TextStyle(
                                                //     fontWeight: FontWeight.w600,
                                                //   ),
                                                // ),
                                                );
                                          },
                                        ),
                                      );
                                    });
                              },
                            ),
                          ),
                        ),
                        // : Padding(
                        //     padding:
                        //         const EdgeInsets.symmetric(vertical: 8.0),
                        //     child: Row(
                        //       mainAxisAlignment: MainAxisAlignment.center,
                        //       children: [
                        //         SizedBox(
                        //           height: 120,
                        //           width: 100,
                        //           child: Center(
                        //             child: Container(
                        //               decoration: BoxDecoration(
                        //                 image: DecorationImage(
                        //                   image: imageUrl == ''
                        //                       ? FileImage(
                        //                           File(imageXFile!.path),
                        //                         )
                        //                       : NetworkImage(imageUrl)
                        //                           as ImageProvider,
                        //                   fit: BoxFit.cover,
                        //                 ),
                        //               ),
                        //             ),
                        //           ),
                        //         ),
                        //       ],
                        //     ),
                        //   ),
                      ),
                    ),

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
                              onPressed: () {
                                showDialog(
                                    context: context,
                                    builder: (ctx) {
                                      return AlertDialog(
                                        content: state.imageXFile != null
                                            ? Image.file(
                                                File(state.imageXFile!.path),
                                                fit: BoxFit.fill)
                                            : Text("No image selected"),
                                      );
                                    });
                              },
                              icon: Icons.search),
                        ]),
                    Divider(
                      height: 50,
                      color: const Color.fromARGB(108, 158, 158, 158),
                    ),
                    // const SizedBox(height: 20),
                    // Container(
                    //   padding: const EdgeInsets.symmetric(horizontal: 15),
                    //   alignment: Alignment.center,
                    //   decoration: BoxDecoration(
                    //     color: MyColors.white,
                    //     border: Border.all(
                    //       color: MyColors.white,
                    //     ),
                    //     borderRadius: BorderRadius.circular(20),
                    //   ),
                    //   child: TextField(
                    //     textAlign: TextAlign.end,
                    //     onChanged: (value) {
                    //       setState(() {
                    //         descriptionText = value;
                    //       });
                    //     },
                    //     // maxLength: 500,
                    //     style: const TextStyle(
                    //       fontSize: 14,
                    //       fontWeight: FontWeight.normal,
                    //     ),
                    //     maxLines: 2,
                    //     decoration: InputDecoration(
                    //       border: InputBorder.none,
                    //       hintText: 'من نحن'.tr(),
                    //       counterStyle: TextStyle(
                    //         color: MyColors.white,
                    //       ),
                    //     ),
                    //   ),
                    // ),

                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "مدة الاعلان".tr(),
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w400),
                      ),
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text("يوم".tr()),
                        SizedBox(
                            width:
                                10), // Add spacing between text and text field if needed

                        Container(
                          width: 150,
                          decoration: BoxDecoration(
                            color: MyColors.white,
                            border: Border.all(
                              color: MyColors.white,
                            ),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 20.0),
                            child: TextField(
                              textAlign: TextAlign.end,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "5".tr(),
                                counterStyle: TextStyle(
                                  color: MyColors.lightText,
                                ),
                              ),
                              onChanged: (value) {
                                AddsBloc.get(context).add(EditAddsDuration(
                                  addsDuration: value,
                                ));
                              },
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 20),

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "تاريخ بداية الاعلان".tr(),
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w400),
                      ),
                    ),

                    SizedBox(
                      height: 55,
                      width: MediaQuery.of(context).size.width,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          elevation: 0,
                          foregroundColor: Colors.white,
                          backgroundColor: Colors.white,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(20.0),
                            ),
                          ),
                        ),
                        onPressed: () async {
                          showDatePicker(
                            context: context,
                            lastDate: DateTime(3000),
                            firstDate: DateTime(2020),
                          ).then(
                            (value) {
                              if (value != null) {
                                AddsBloc.get(context).add(EditStartDayMonthYear(
                                  startDay: value.day,
                                  startMonth: value.month,
                                  startYear: value.year,
                                ));
                              }
                            },
                          );
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(
                              Icons.date_range_outlined,
                              color: MyColors.lightText,
                            ),
                            Text(
                              state.startDay == 0 &&
                                      state.startMonth == 0 &&
                                      state.startYear == 0
                                  ? "تاريخ بداية الاعلان".tr()
                                  : "${state.startDay}/${state.startMonth}/${state.startYear}",
                              style: const TextStyle(
                                color: MyColors.lightText,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "تاريخ نهاية الاعلان".tr(),
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w400),
                      ),
                    ),

                    SizedBox(
                      height: 55,
                      width: MediaQuery.of(context).size.width,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          elevation: 0,
                          foregroundColor: Colors.white,
                          backgroundColor: Colors.white,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(20.0),
                            ),
                          ),
                        ),
                        onPressed: () async {
                          showDatePicker(
                            context: context,
                            lastDate: DateTime(3000),
                            firstDate: DateTime(2020),
                          ).then(
                            (value) {
                              if (value != null) {
                                AddsBloc.get(context).add(EditEndDayMonthYear(
                                  endDay: value.day,
                                  endMonth: value.month,
                                  endYear: value.year,
                                ));
                              }
                            },
                          );
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(
                              Icons.date_range_outlined,
                              color: MyColors.lightText,
                            ),
                            Text(
                              state.endDay == 0 &&
                                      state.endMonth == 0 &&
                                      state.endYear == 0
                                  ? "تاريخ نهاية الاعلان".tr()
                                  : "${state.endDay}/${state.endMonth}/${state.endYear}",
                              style: const TextStyle(
                                color: MyColors.lightText,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "الاعلانات القائمة حاليا".tr(),
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w400),
                      ),
                    ),
                    const SizedBox(height: 20),

                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 200,
                      child: Swiper(
                        itemBuilder: (context, index) {
                          final image = state.addImages[index];
                          return Image.network(
                            image,
                            fit: BoxFit.fill,
                          );
                        },
                        indicatorLayout: PageIndicatorLayout.COLOR,
                        autoplay: true,
                        itemCount: state.addImages.length,
                        pagination: const SwiperPagination(),
                        control: const SwiperControl(),
                      ),
                    ),

                    const SizedBox(height: 20),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "  ${state.addsDuration} ايام".tr(),
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w400),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "مدة الاعلان".tr(),
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w400),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "${state.startDay}/${state.startMonth}/${state.startYear}"
                                .tr(),
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w400),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "بداية الاعلان في".tr(),
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w400),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "${state.endDay}/${state.endMonth}/${state.endYear}"
                                .tr(),
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w400),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "نهاية الاعلان في".tr(),
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w400),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          IconWithText(
                              color: MyColors.primary,
                              text: "تعديل".tr(),
                              onPressed: () {},
                              icon: Icons.mode_edit_outlined),
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
                        ]),
                    const SizedBox(height: 20),

                    Row(
                      children: [
                        Text(
                            "اوافق على الشروط والاحكام و سياسة  ¨¨¨¨¨ للعروض\n                                                               الخاصة"
                                .tr()),
                        Checkbox(
                            value: state.agreementPolicy,
                            onChanged: (value) {
                              AddsBloc.get(context).add(EditAgreementPolicy(
                                  agreementPolicy: value ?? false));
                            }),
                      ],
                    ),

                    const SizedBox(height: 20),

                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: GradientButtonFb1(
                        onPressed: () {},
                        text: "اوافق".tr(),
                      ),
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: GradientButtonFb1(
                        onPressed: () {
                          if (state.agreementPolicy == false) {
                            FxToast.showErrorToast(
                                context: context,
                                message: "وافق علي الشروط والاحكام اولا".tr());
                            return;
                          }
                          AddsBloc.get(context).add(const AddAdds());

                          Navigator.of(context).pop();
                        },
                        text: "نشر".tr(),
                      ),
                    ),

                    const SizedBox(height: 40),
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
