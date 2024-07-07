import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:anwer_shop/constants/colors.dart';

import 'package:anwer_shop/online%20Store/bloc/online_store_bloc.dart';

import 'package:anwer_shop/widgets/drop_down_widgets.dart';

import '../widgets/button_widget.dart';
import '../widgets/constant/toast.dart';

class OnlineStoreScreen extends StatefulWidget {
  static const String routeName = '/onlineStore-screen';
  const OnlineStoreScreen({super.key});

  @override
  State<OnlineStoreScreen> createState() => _OnlineStoreScreenState();
}

class _OnlineStoreScreenState extends State<OnlineStoreScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OnlineStoreBloc(),
      child: BlocBuilder<OnlineStoreBloc, OnlineStoreState>(
        builder: (context, state) {
          return Scaffold(
            backgroundColor: MyColors.onBackground,
            appBar: AppBar(
              foregroundColor: Colors.white,
              title: Text(
                'المتجر الالكتروني'.tr(),
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                ),
              ),
              centerTitle: true,
              actions: [
                IconButton(
                  onPressed: () {},
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

                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "رابط المتجر".tr(),
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
                            hintText: "رابط المتجر".tr(),
                            counterStyle: TextStyle(
                              color: Colors.grey[500],
                            ),
                          ),
                          onChanged: (value) {
                            OnlineStoreBloc.get(context).add(EditshopLink(
                              shopLink: value,
                            ));
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
                        "اختيار الفئة".tr(),
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
                            OnlineStoreBloc.get(context).add(EditShopCategories(
                              shopCategories: value.toString(),
                            ));
                          },
                          iconWidget: Icon(Icons.keyboard_arrow_down_sharp),
                          titleName: ".....".tr(),
                          isEnabled: true,
                          isRequired: false),
                    ),
                    const SizedBox(height: 20),

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "مدة الخصم".tr(),
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
                              keyboardType: TextInputType.number,
                              textAlign: TextAlign.end,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "5".tr(),
                                counterStyle: TextStyle(
                                  color: MyColors.lightText,
                                ),
                              ),
                              inputFormatters: <TextInputFormatter>[
                                FilteringTextInputFormatter.digitsOnly,
                              ],
                              onChanged: (value) {
                                OnlineStoreBloc.get(context).add(
                                    EditOffersDuration(
                                        offersDuration: int.parse(value)));
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
                                OnlineStoreBloc.get(context)
                                    .add(EditStartDayMonthYear(
                                  startDay: value.day,
                                  startMonth: value.month,
                                  startYear: value.year,
                                ));
                                // Handle date selection
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
                                OnlineStoreBloc.get(context)
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

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "تحديد نسبة الخصم".tr(),
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w400),
                      ),
                    ),
                    const SizedBox(height: 20),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 2.5,
                          child: Container(
                            decoration: BoxDecoration(
                              color: MyColors.white,
                              border: Border.all(
                                color: MyColors.white,
                              ),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10.0),
                              child: TextField(
                                keyboardType: TextInputType.number,
                                textAlign: TextAlign.end,
                                decoration: InputDecoration(
                                  prefixIcon: Icon(
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
                                inputFormatters: <TextInputFormatter>[
                                  FilteringTextInputFormatter.digitsOnly,
                                ],
                                onChanged: (value) {
                                  OnlineStoreBloc.get(context).add(
                                      EditDiscountPercentageTo(
                                          discountPercentageTo:
                                              double.parse(value)));

                                  // setState(() {
                                  //   // categoriesText = value;
                                  // });
                                },
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 2.5,
                          child: Container(
                            decoration: BoxDecoration(
                              color: MyColors.white,
                              border: Border.all(
                                color: MyColors.white,
                              ),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10.0),
                              child: TextField(
                                textAlign: TextAlign.end,
                                decoration: InputDecoration(
                                  prefixIcon:const Icon(
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
                                keyboardType: TextInputType.number,
                                inputFormatters: <TextInputFormatter>[
                                  FilteringTextInputFormatter.digitsOnly,
                                ],
                                onChanged: (value) {
                                  OnlineStoreBloc.get(context).add(
                                      EditDiscountPercentageFrom(
                                          discountPercentageFrom:
                                              double.parse(value)));

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
                      children: [
                        Text(
                            "اوافق على الشروط والاحكام و سياسة  ¨¨¨¨¨ للعروض\n                                                               الخاصة"
                                .tr()),
                        Checkbox(
                            value: state.agreementPolicy,
                            onChanged: (value) {
                              OnlineStoreBloc.get(context).add(
                                  EditAgreementPolicy(
                                      agreementPolicy: value ?? false));
                            }),
                      ],
                    ),

                    const SizedBox(height: 20),

                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: GradientButtonFb1(
                        onPressed: () {
                          (state.discountPercentageFrom != 0 &&
                                  state.discountPercentageTo != 0 &&
                                  state.startDay != 0 &&
                                  state.shopLink.isNotEmpty &&
                                  state.agreementPolicy == false)
                              ? FxToast.showSuccessToast(
                                  context: context,
                                )
                              : FxToast.showWarningToast(
                                  context: context,
                                  warningMessage: "Fill All The Fields");
                        },
                        text: "حفظ".tr(),
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
                          OnlineStoreBloc.get(context)
                              .add(const AddOnlineStore());

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
