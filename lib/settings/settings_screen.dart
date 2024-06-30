import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:anwer_shop/constants/colors.dart';

import 'package:anwer_shop/settings/bloc/settings_bloc.dart';
import 'package:anwer_shop/widgets/drop_down_widgets.dart';

import '../widgets/button_widget.dart';
import '../widgets/constant/toast.dart';

class SettingsScreen extends StatefulWidget {
  static const String routeName = '/settings-screen';
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SettingsBloc()..add(const FetchUserData()),
      child: BlocBuilder<SettingsBloc, SettingsState>(
        builder: (context, state) {
          return Scaffold(
            backgroundColor: MyColors.onBackground,
            appBar: AppBar(
              foregroundColor: Colors.white,
              title: Text(
                'الاعدادات'.tr(),
                style: const TextStyle(
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
                  icon: const Icon(
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
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "اسم المستخدم".tr(),
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
                        child: TextField(
                          controller:
                              TextEditingController(text: state.userName),
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
                    const SizedBox(height: 15),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "الرمز السري".tr(),
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
                        child: TextField(
                          textAlign: TextAlign.end,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "الرمز السري".tr(),
                            counterStyle: const TextStyle(
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
                    Center(
                      child: TextButton(
                          onPressed: () {
                            state.changePassword == true
                                ? SettingsBloc.get(context).add(
                                    const ChangePassword(changePassword: false))
                                : SettingsBloc.get(context).add(
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
                                  style: const TextStyle(
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
                                      counterStyle: const TextStyle(
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
                                      counterStyle: const TextStyle(
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
                                      SettingsBloc.get(context).add(
                                          EditConfirmNewPassword(
                                              confirmNewPassword: value));
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
                                    if (state.confirmNewPassword !=
                                        state.newPassword) {
                                      FxToast.showWarningToast(
                                          context: context,
                                          warningMessage:
                                              "الرمز السري الجدبد لا يماثل التأكيد"
                                                  .tr());

                                      return;
                                    }

                                    if (state.password !=
                                        state.fetchedPassword) {
                                      FxToast.showWarningToast(
                                          context: context,
                                          warningMessage:
                                              "الرمز السري غير صحيح".tr());
                                      return;
                                    }

                                    SettingsBloc.get(context)
                                        .add(const UpdateUserData());
                                    Navigator.pop(context);
                                  },
                                  text: "حفظ".tr(),
                                ),
                              ),
                            ],
                          )
                        : const SizedBox.shrink(),
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "اللغة".tr(),
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
                      child: singleSelectGenericDropdown(
                          onChanged: (value) {
                            SettingsBloc.get(context)
                                .add(EditLangueage(language: value ?? ""));
                          },
                          iconWidget:
                              const Icon(Icons.keyboard_arrow_down_sharp),
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
