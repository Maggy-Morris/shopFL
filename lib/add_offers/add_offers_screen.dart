import 'dart:io';

import 'package:card_swiper/card_swiper.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:anwer_shop/constants/colors.dart';
import 'package:anwer_shop/generated/assets.dart';
import 'package:anwer_shop/models/address.dart';
import 'package:anwer_shop/providers/register_shop_provider.dart';
import 'package:anwer_shop/widgets/constant/toast.dart';

import 'package:anwer_shop/widgets/drop_down_widgets.dart';
import 'package:anwer_shop/widgets/enum/enum.dart';

// import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../../widgets/Icons_wit_text.dart';
import '../../widgets/assetImage_withtext.dart';

import '../widgets/button_widget.dart';
import 'bloc/add_offers_bloc.dart';

class AddOffersScreen extends StatefulWidget {
  static const String routeName = '/add-offers-screen';
  const AddOffersScreen({super.key});

  @override
  State<AddOffersScreen> createState() => _AddOffersScreenState();
}

class _AddOffersScreenState extends State<AddOffersScreen> {
  XFile? imageXFile;
  final ImagePicker _picker = ImagePicker();
  // GoogleMapController? mapPreviewController;

  // TextEditingController nameController = TextEditingController();
  // TextEditingController categoriesController = TextEditingController();

  // TextEditingController descriptionController = TextEditingController();

  String nameText = '';
  String categoriesText = '';

  String descriptionText = '';
  String imageUrl = '';
  Address? address;

  /// Variables to store country state city data in onChanged method.
  String? countryValue = "";
  String? stateValue = "";
  String? cityValue = "";

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddOffersBloc()..add(const FetchOffersImages()),
      child: BlocBuilder<AddOffersBloc, AddOffersState>(
        builder: (context, state) {
          return Scaffold(
            backgroundColor: MyColors.onBackground,
            appBar: AppBar(
              foregroundColor: Colors.white,
              title: Text(
                "اضافة عروض".tr(),
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                ),
              ),
              centerTitle: true,
              actions: [
                IconButton(
                  onPressed: nameText.isNotEmpty &&
                          descriptionText.isNotEmpty &&
                          address != null &&
                          ((imageXFile == null && imageUrl.isNotEmpty) ||
                              (imageXFile != null && imageUrl.isEmpty))
                      ? null
                      : null,
                  icon: Icon(
                    Icons.arrow_forward_ios_sharp,
                    color: nameText.isNotEmpty &&
                            descriptionText.isNotEmpty &&
                            address != null &&
                            ((imageXFile == null && imageUrl.isNotEmpty) ||
                                (imageXFile != null && imageUrl.isEmpty))
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

                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "أضافة طريقة تقديم العروض".tr(),
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w400),
                      ),
                    ),

                    const SizedBox(height: 20),
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
                            AddOffersBloc.get(context)
                                .add(EditShowOffersDisplay(
                              showOffersDisplay: value ?? "",
                            ));
                          },
                          iconWidget:
                              const Icon(Icons.keyboard_arrow_down_sharp),
                          titleName: "عرض لمنتج واحد في صفحة واحدة".tr(),
                          itemsList: ['كتالوج', 'عرض لمنتج واحد في صفحة واحدة'],
                          isEnabled: true,
                          isRequired: false),
                    ),
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "أضافة العروض".tr(),
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w400),
                      ),
                    ),
                    const SizedBox(height: 20),

                    SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: GradientButtonFb3(
                          onPressed: () async {
                            await ImagePicker()
                                .pickImage(source: ImageSource.gallery)
                                .then((value) {
                              AddOffersBloc.get(context)
                                  .add(pickImageXFile(imageXFile: value));
                              AddOffersBloc.get(context).add(
                                  EditShopImage(shopImage: value?.path ?? ""));
                            });
                          },
                          text: "رفع الملف".tr(),
                          imagePath: Assets.downloadIcon,
                        )),
                    const SizedBox(height: 20),

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
                              onPressed: () {
                                showDialog(
                                    context: context,
                                    builder: (ctx) {
                                      return AlertDialog(
                                        content: state.imageXFile != null
                                            ? Image.file(
                                                File(state.imageXFile!.path),
                                                fit: BoxFit.fill)
                                            : const Text("No image selected"),
                                      );
                                    });
                              },
                              icon: Icons.search),
                        ]),
                    const Divider(
                      height: 50,
                      color: Color.fromARGB(108, 158, 158, 158),
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

                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "مدة العرض".tr(),
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w400),
                      ),
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text("يوم".tr()),
                        const SizedBox(
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
                            child: TextFormField(
                              textAlign: TextAlign.end,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "5".tr(),
                                counterStyle: const TextStyle(
                                  color: MyColors.lightText,
                                ),
                              ),
                              keyboardType: TextInputType.number,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'This field is required';
                                }
                              },
                              onChanged: (value) {
                                AddOffersBloc.get(context)
                                    .add(EditOffersDuration(
                                  offersDuration: value,
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
                        "تاريخ بداية العرض".tr(),
                        style: const TextStyle(
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
                                // Handle date selection

                                AddOffersBloc.get(context)
                                    .add(EditStartDayMonthYear(
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
                            const Icon(
                              Icons.date_range_outlined,
                              color: MyColors.lightText,
                            ),
                            Text(
                              state.startDay == 0 &&
                                      state.startMonth == 0 &&
                                      state.startYear == 0
                                  ? "تاريخ بداية العرض".tr()
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
                        "تاريخ نهاية العرض".tr(),
                        style: const TextStyle(
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
                                AddOffersBloc.get(context)
                                    .add(EditEndDayMonthYear(
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
                            const Icon(
                              Icons.date_range_outlined,
                              color: MyColors.lightText,
                            ),
                            Text(
                              state.endDay == 0 &&
                                      state.endMonth == 0 &&
                                      state.endYear == 0
                                  ? "تاريخ نهاية العرض".tr()
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

                    (state.showOffersDisplay == "كتالوج")
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "تحديد نسبة الخصم".tr(),
                                  style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                              const SizedBox(height: 20),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width / 2.5,
                                    child: Container(
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
                                          keyboardType: TextInputType.number,
                                          textAlign: TextAlign.end,
                                          decoration: InputDecoration(
                                            prefixIcon: const Icon(
                                              Icons.percent_rounded,
                                              color: MyColors.lightText,
                                              size: 15,
                                            ),
                                            border: InputBorder.none,
                                            hintText: "الي".tr(),
                                            counterStyle: TextStyle(
                                              color: Colors.grey[500],
                                            ),
                                          ),
                                          onChanged: (value) {
                                            AddOffersBloc.get(context).add(
                                                EditDiscountPercentageTo(
                                                    discountPercentageTo:
                                                        value));
                                            // setState(() {
                                            //   // categoriesText = value;
                                            // });
                                          },
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width / 2.5,
                                    child: Container(
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
                                          keyboardType: TextInputType.number,
                                          textAlign: TextAlign.end,
                                          decoration: InputDecoration(
                                            prefixIcon: const Icon(
                                              Icons.percent_rounded,
                                              color: MyColors.lightText,
                                              size: 15,
                                            ),
                                            border: InputBorder.none,
                                            hintText: "من".tr(),
                                            counterStyle: TextStyle(
                                              color: Colors.grey[500],
                                            ),
                                          ),
                                          onChanged: (value) {
                                            AddOffersBloc.get(context).add(
                                                EditDiscountPercentageFrom(
                                                    discountPercentageFrom:
                                                        value));
                                          },
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          )
                        :
                        // if (state.showOffersDisplay != "كتالوج")
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "تحديد مقدار الخصم".tr(),
                                  style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                              const SizedBox(height: 20),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width / 2.3,
                                    child: Container(
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
                                          keyboardType: TextInputType.number,
                                          textAlign: TextAlign.end,
                                          decoration: InputDecoration(
                                            border: InputBorder.none,
                                            hintText: "السعر بعد الخصم".tr(),
                                            counterStyle: TextStyle(
                                              color: Colors.grey[500],
                                            ),
                                          ),
                                          onChanged: (value) {
                                            AddOffersBloc.get(context).add(
                                                EditPriceAfterDiscount(
                                                    priceAfterDiscount: value));
                                            // setState(() {
                                            //   // categoriesText = value;
                                            // });
                                          },
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width / 2.3,
                                    child: Container(
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
                                          keyboardType: TextInputType.number,
                                          textAlign: TextAlign.end,
                                          decoration: InputDecoration(
                                            border: InputBorder.none,
                                            hintText: "السعر الاصلي".tr(),
                                            counterStyle: TextStyle(
                                              color: Colors.grey[500],
                                            ),
                                          ),
                                          onChanged: (value) {
                                            AddOffersBloc.get(context).add(
                                                EditOriginalPrice(
                                                    originalPrice: value));
                                            // setState(() {
                                            //   // categoriesText = value;
                                            // });
                                          },
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 20),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width / 2.3,
                                    child: Container(
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
                                            hintText: "العملة".tr(),
                                            counterStyle: TextStyle(
                                              color: Colors.grey[500],
                                            ),
                                          ),
                                          onChanged: (value) {
                                            AddOffersBloc.get(context).add(
                                                EditCurrency(currency: value));
                                            // setState(() {
                                            //   // categoriesText = value;
                                            // });
                                          },
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width / 2.3,
                                    child: Container(
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
                                          keyboardType: TextInputType.number,
                                          textAlign: TextAlign.end,
                                          decoration: InputDecoration(
                                            border: InputBorder.none,
                                            hintText: "نسبة الخصم".tr(),
                                            counterStyle: TextStyle(
                                              color: Colors.grey[500],
                                            ),
                                          ),
                                          onChanged: (value) {
                                            AddOffersBloc.get(context).add(
                                                EditDiscountPercentage(
                                                    discountPercentage: value));
                                            // setState(() {
                                            //   // categoriesText = value;
                                            // });
                                          },
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),

                    const SizedBox(height: 20),

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "العروض القائمة".tr(),
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w400),
                      ),
                    ),
                    const SizedBox(height: 20),
                    state.offerImages.isNotEmpty
                        ? Container(
                            width: double
                                .infinity, // Ensure it takes the full width of the screen
                            height: 200,
                            child: Swiper(
                              itemBuilder: (context, index) {
                                final image = state.offerImages[index];
                                return Image.network(
                                  image,
                                  fit: BoxFit.fill,
                                );
                              },
                              indicatorLayout: PageIndicatorLayout.COLOR,
                              autoplay: true,
                              itemCount: state.offerImages.length,
                              pagination: const SwiperPagination(),
                              control: const SwiperControl(),
                            ),
                          )
                        : Container(
                            width: MediaQuery.of(context).size.width,
                            height: 200,
                            child:
                                Center(child: Text("لا يوجد عروض حاليا".tr()))),

                    const SizedBox(height: 20),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "  ${state.offersDuration} ايام".tr(),
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w400),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "مدة الخصم".tr(),
                            style: const TextStyle(
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
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w400),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "نهاية الخصم".tr(),
                            style: const TextStyle(
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
                            state.discountPercentage.isNotEmpty
                                ? state.discountPercentage.tr()
                                : state.discountPercentageTo.tr(),
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w400),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "مقدار الخصم".tr(),
                            style: const TextStyle(
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
                              AddOffersBloc.get(context)
                                  .add(EditAgreementPolicy(
                                agreementPolicy: value ?? false,
                              ));
                            }),
                      ],
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
                          AddOffersBloc.get(context).add(const AddOffers());

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
