import 'dart:io';
import 'package:csc_picker/csc_picker.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:foodpanda_seller/authentication/widgets/custom_textbutton.dart';
import 'package:foodpanda_seller/constants/colors.dart';
import 'package:foodpanda_seller/generated/assets.dart';
import 'package:foodpanda_seller/models/address.dart';
import 'package:foodpanda_seller/providers/internet_provider.dart';
import 'package:foodpanda_seller/providers/register_shop_provider.dart';
import 'package:foodpanda_seller/register_shop/screens/search_address_manual_screen.dart';
import 'package:foodpanda_seller/settings/bloc/settings_bloc.dart';
import 'package:foodpanda_seller/widgets/custom_textfield.dart';
import 'package:foodpanda_seller/widgets/drop_down_widgets.dart';
import 'package:foodpanda_seller/widgets/ficon_button.dart';
import 'package:foodpanda_seller/widgets/map_preview.dart';
import 'package:foodpanda_seller/widgets/my_snack_bar.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../../widgets/Icons_wit_text.dart';
import '../../widgets/assetImage_withtext.dart';
import '../../widgets/branches_widget.dart';
import '../../widgets/icon_buttons.dart';
import '../widgets/button_widget.dart';

class SettingsScreen extends StatefulWidget {
  static const String routeName = '/settings-screen';
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  // XFile? imageXFile;
  // final ImagePicker _picker = ImagePicker();
  // // GoogleMapController? mapPreviewController;

  // TextEditingController nameController = TextEditingController();
  // TextEditingController categoriesController = TextEditingController();

  // TextEditingController descriptionController = TextEditingController();

  // String nameText = '';
  // String categoriesText = '';

  // String descriptionText = '';
  // String imageUrl = '';
  // Address? address;

  // /// Variables to store country state city data in onChanged method.
  // String? countryValue = "";
  // String? stateValue = "";
  // String? cityValue = "";
  // // String address = "";

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

  // // handleRegisterShop() async {
  // //   final registerShopProvider = context.read<RegisterShopProvider>();
  // //   final internetProvider = context.read<InternetProvider>();

  // //   await internetProvider.checkInternetConnection();
  // //   if (internetProvider.hasInternet == false) {
  // //     Navigator.pop(context);
  // //     openSnackbar(context, 'Check your internet connection', scheme.primary);
  // //   } else {
  // //     if (imageUrl.isNotEmpty) {
  // //       await registerShopProvider.registerShop(
  // //         shopName: nameController.text.trim().toString(),
  // //         shopDescription: descriptionController.text.trim().toString(),
  // //         imageUrl: imageUrl,
  // //         address: address!,
  // //       );
  // //     } else {
  // //       await registerShopProvider.registerShop(
  // //         shopName: nameController.text.trim().toString(),
  // //         shopDescription: descriptionController.text.trim().toString(),
  // //         image: imageXFile!,
  // //         address: address!,
  // //       );
  // //     }

  // //     Navigator.pop(context);
  // //   }
  // // }

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
      create: (context) => SettingsBloc(),
      child: BlocBuilder<SettingsBloc, SettingsState>(
        builder: (context, state) {
          return Scaffold(
            backgroundColor: MyColors.onBackground,
            appBar: AppBar(
              foregroundColor: Colors.white,
              title: Text(
                'الاعدادات'.tr(),
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                ),
              ),
              centerTitle: true,
              actions: [
                IconButton(
                  onPressed: () {},
                  // nameText.isNotEmpty &&
                  //         descriptionText.isNotEmpty &&
                  //         address != null &&
                  //         ((imageXFile == null && imageUrl.isNotEmpty) ||
                  //             (imageXFile != null && imageUrl.isEmpty))
                  //     ? null
                  //     //  handleRegisterShop
                  //     : null,
                  icon: Icon(
                    Icons.arrow_forward_ios_sharp,
                    color: Colors.black,
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

                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.end,
                    //   children: [
                    //     Padding(
                    //       padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    //       child: Text(
                    //         nameController.text,
                    //         style: TextStyle(
                    //           fontWeight: FontWeight.w600,
                    //           fontSize: 16,
                    //         ),
                    //       ),
                    //     ),
                    //     CircleAvatar(
                    //       backgroundColor: Colors
                    //           .transparent, // Optional, sets the background to transparent

                    //       radius: 30,
                    //       child: Container(
                    //         decoration: BoxDecoration(
                    //           shape: BoxShape.circle,
                    //           image: DecorationImage(
                    //             fit: BoxFit.cover,
                    //             image: imageUrl.isNotEmpty
                    //                 ? NetworkImage(imageUrl)
                    //                 : AssetImage("assets/images/person_icon.png")
                    //                     as ImageProvider,
                    //           ),
                    //         ),
                    //       ),
                    //     ),
                    //   ],
                    // ),

                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "اسم المستخدم".tr(),
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
                        child: TextField(
                          textAlign: TextAlign.end,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "اسم المستخدم".tr(),
                            counterStyle: TextStyle(
                              color: Colors.grey[500],
                            ),
                          ),
                          // controller: categoriesController,
                          onChanged: (value) {
                            SettingsBloc.get(context)
                                .add(EditUserName(userName: value));
                            // setState(() {
                            //   // categoriesText = value;
                            // });
                          },
                        ),
                      ),
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
                    //     controller: descriptionController,
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
                    const SizedBox(height: 15),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "الرمز السري".tr(),
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
                        child: TextField(
                          textAlign: TextAlign.end,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "الرمز السري".tr(),
                            counterStyle: TextStyle(
                              color: MyColors.lightText,
                            ),
                          ),
                          onChanged: (value) {
                            SettingsBloc.get(context)
                                .add(EditPassword(password: value));
                            // setState(() {
                            //   categoriesText = value;
                            // });
                          },
                        ),
                      ),
                    ),

                    const SizedBox(height: 15),
                    Center(
                      child: TextButton(
                          onPressed: () {
                            SettingsBloc.get(context).add(
                                const ChangePassword(changePassword: true));
                          },
                          child: Text("تعديل الرقم السري".tr())),
                    ),

                    state.changePassword == true
                        ? Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "تعديل الرقم السري".tr(),
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400),
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
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10.0),
                                  child: TextField(
                                    textAlign: TextAlign.end,
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "الرمز السري القديم".tr(),
                                      counterStyle: TextStyle(
                                        color: MyColors.lightText,
                                      ),
                                    ),
                                    onChanged: (value) {
                                      SettingsBloc.get(context)
                                          .add(EditPassword(password: value));
                                    },
                                  ),
                                ),
                              ),
                              const SizedBox(height: 15),
                              Container(
                                decoration: BoxDecoration(
                                  color: MyColors.white,
                                  border: Border.all(
                                    color: MyColors.white,
                                  ),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10.0),
                                  child: TextField(
                                    textAlign: TextAlign.end,
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "الرمز السري الجديد".tr(),
                                      counterStyle: TextStyle(
                                        color: MyColors.lightText,
                                      ),
                                    ),
                                    onChanged: (value) {
                                      SettingsBloc.get(context).add(
                                          EditNewPassword(newPassword: value));
                                    },
                                  ),
                                ),
                              ),
                              const SizedBox(height: 15),
                              Container(
                                decoration: BoxDecoration(
                                  color: MyColors.white,
                                  border: Border.all(
                                    color: MyColors.white,
                                  ),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10.0),
                                  child: TextField(
                                    textAlign: TextAlign.end,
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "تأكيد الرمز السري الجديد".tr(),
                                      counterStyle: TextStyle(
                                        color: Colors.grey[500],
                                      ),
                                    ),
                                    onChanged: (value) {
                                      // setState(() {
                                      //   categoriesText = value;
                                      // });
                                    },
                                  ),
                                ),
                              ),
                              const SizedBox(height: 20),
                              SizedBox(
                                width: MediaQuery.of(context).size.width,
                                child: GradientButtonFb1(
                                  onPressed: () {
                                    
                                  },
                                  text: "حفظ".tr(),
                                ),
                              ),
                            ],
                          )
                        : SizedBox.shrink(),
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "اللغة".tr(),
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
                          onChanged: (value) {
                            SettingsBloc.get(context)
                                .add(EditLangueage(language: value ?? ""));
                          },
                          iconWidget: Icon(Icons.keyboard_arrow_down_sharp),
                          titleName: "اللغة".tr(),
                          itemsList: ['فرنساوي', 'انجليزي', 'عربي'],
                          isEnabled: true,
                          isRequired: false),
                    ),
                    const SizedBox(height: 20),
                    Center(
                        child: TextButton(
                            onPressed: () {},
                            child: Text("تحتاج مساعدة؟".tr()))),
                    const SizedBox(height: 20),
                    Center(
                      child: InvertedButtonFb2(
                          onPressed: () {},
                          text: "  تواصل معنا علي واتساب".tr()),
                    ),
                    const SizedBox(height: 20),
                    Center(
                      child: InvertedButtonFb2(
                          onPressed: () {},
                          text: "راسلنا عبر البريد الالكتروني".tr()),
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
