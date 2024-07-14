import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:anwer_shop/User/screens/home_screen/widgets/custom_buttoms.dart';
import 'package:anwer_shop/User/screens/home_screen/widgets/image_slider_widget.dart';
import '../../../authentication/screens/authentication_screen.dart';
import '../../../authentication/screens/login_screen.dart';
import '../../../providers/authentication_provider.dart';
import '../../../widgets/my_alert_dialog.dart';
import 'cubit/map_marker_cubit.dart';
import 'cubit/slider_cubit.dart';
import 'widgets/custom_appbar.dart';
import 'widgets/custom_navigation_bar.dart';
import 'widgets/map_widget.dart';
import 'widgets/slider_widget.dart';

class UserHomeScreen extends StatelessWidget {
  static const String routeName = '/UserHome-screen';

  UserHomeScreen({super.key});

  final AdvancedDrawerController _advancedDrawerController =
      AdvancedDrawerController();

  @override
  Widget build(BuildContext context) {
    final ap = context.watch<AuthenticationProvider>();

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => MapMarkerCubit()
            ..getAddressFromLatLng()
            ..fetchMarkers()
            ..getCurrentLocation(),
        ),
        BlocProvider(
          create: (context) => SliderCubit(),
        ),
      ],
      child:
          //  BlocBuilder<AuthenticationUserBloc, AuthenticationUserState>(
          //   builder: (context, state) {
          //     context.read<MapMarkerCubit>().getCurrentLocation();
          // context.read<MapMarkerCubit>().getAddressFromLatLng();
          (ap.isSignedIn)
              ? AdvancedDrawer(
                  backdropColor: Colors.white,
                  controller: _advancedDrawerController,
                  animationCurve: Curves.easeInOut,
                  animationDuration: const Duration(milliseconds: 300),
                  animateChildDecoration: true,
                  disabledGestures: false,
                  childDecoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(16)),
                  ),
                  drawer: SafeArea(
                    child: ListTileTheme(
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 20,
                          ),
                          const CircleAvatar(
                            radius: 40,
                            backgroundColor: Color(0xffF0F5FA),
                            child: Icon(
                              Icons.person,
                              size: 40,
                              color: Color(0xffD2D5F9),
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.02,
                          ),
                          Text("${ap.name}"),

                          // Text("//${state.user?.displayName}"),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.02,
                          ),
                          const Divider(),
                          Padding(
                            padding: const EdgeInsets.only(right: 15.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                DropdownButton<String>(
                                  iconEnabledColor: const Color(0xff4624C2),
                                  items: <String>['العربية', 'English']
                                      .map((String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value,
                                          style: const TextStyle(
                                              color: Color(0xff4624C2))),
                                    );
                                  }).toList(),
                                  onChanged: (_) {},
                                  hint: const Text('العربية',
                                      style:
                                          TextStyle(color: Color(0xff4624C2))),
                                ),
                                const Spacer(),
                                const Text('اللغة'),
                                const SizedBox(
                                  width: 10,
                                ),
                                SvgPicture.asset("assets/icon_images/lang.svg"),
                              ],
                            ),
                          ),
                          const Divider(),
                          CustomButton(
                            text: 'الاشعارات',
                            icon:
                                "assets/icon_images/ic_round-notifications.svg",
                            onTap: () {},
                          ),
                          const Divider(),
                          CustomButton(
                            text: 'القائمة المفضلة',
                            icon: "assets/icon_images/favorite.svg",
                            onTap: () {},
                          ),
                          const Divider(),
                          CustomButton(
                            text: 'بريد',
                            icon: "assets/icon_images/phone.svg",
                            onTap: () {},
                          ),
                          const Divider(),
                          CustomButton(
                            text: 'الاعدادات',
                            icon: "assets/icon_images/sitting.svg",
                            onTap: () {},
                          ),
                          const Divider(),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.02,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.5,
                            decoration: BoxDecoration(
                              border:
                                  Border.all(color: const Color(0xff4624C2)),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            height: MediaQuery.of(context).size.height * 0.05,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('مشاركة التطبيق'.tr()),
                                const SizedBox(width: 10),
                                SvgPicture.asset(
                                    "assets/icon_images/share.svg"),
                              ],
                            ),
                          ),
                          const Spacer(),
                          ElevatedButton(
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (ctx) => MyAlertDialog(
                                  title: 'Logging out?'.tr(),
                                  subtitle:
                                      'Thanks for stopping by. See you again soon!'
                                          .tr(),
                                  action1Name: 'Cancel'.tr(),
                                  action2Name: 'Log out'.tr(),
                                  action1Func: () {
                                    Navigator.pop(ctx);
                                  },
                                  action2Func: () async {
                                    await ap.userSignOut();

                                    Navigator.pushNamedAndRemoveUntil(
                                        ctx,
                                        AuthenticationScreen.routeName,
                                        (route) => false);
                                  },
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xff4624C2),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            child: Text(
                              'تسجيل الخروج'.tr(),
                              style: TextStyle(color: Colors.white),
                            ),
                          ),

                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.02,
                          ),
                        ],
                      ),
                    ),
                  ),
                  rtlOpening: true,
                  child: SafeArea(
                    child: BlocBuilder<MapMarkerCubit, MapMarkerState>(
                      builder: (context, state) {
                        return Scaffold(
                          body: SingleChildScrollView(
                            // Added SingleChildScrollView here
                            child: Column(
                              children: [
                                Column(
                                  children: [
                                    CustomAppBar(
                                        advancedDrawerController:
                                            _advancedDrawerController),
                                    MapScreen(),

                                    const SliderWidget(),

                                    // slider range
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.25,
                                      child: ImageSlideshow(
                                        children: [
                                          Image.asset(
                                            "assets/icon_images/Rectangle 556.png",
                                            fit: BoxFit.cover,
                                          ),
                                          Image.asset(
                                            "assets/icon_images/Rectangle 556.png",
                                            fit: BoxFit.cover,
                                          ),
                                          // Image.network(
                                          //   "https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885_1280.jpg",
                                          //   fit: BoxFit.cover,
                                          // ),
                                          // Image.network(
                                          //   "https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885_1280.jpg",
                                          //   fit: BoxFit.cover,
                                          // ),
                                        ],
                                      ),
                                    ),

                                    const Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 12.0),
                                      child: CustomNavigationBar(),
                                    )
                                    // SizedBox(
                                    //   height: 10,
                                    // ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                )
              : AdvancedDrawer(
                  backdropColor: Colors.white,
                  controller: _advancedDrawerController,
                  animationCurve: Curves.easeInOut,
                  animationDuration: const Duration(milliseconds: 300),
                  animateChildDecoration: true,
                  disabledGestures: false,
                  childDecoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(16)),
                  ),
                  drawer: SafeArea(
                    child: ListTileTheme(
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 20,
                          ),
                          const CircleAvatar(
                            radius: 40,
                            backgroundColor: Color(0xffF0F5FA),
                            child: Icon(
                              Icons.person,
                              size: 40,
                              color: Color(0xffD2D5F9),
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.02,
                          ),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.pushNamed(
                                  arguments: "مستخدم",
                                  context,
                                  LoginScreen.routeName);

                              // Navigator.pushReplacement(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: (context) =>
                              //             const LoginScreen()));
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xff4624C2),
                              fixedSize: const Size(200, 30),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            child: Text(
                              'تسجيل الدخول'.tr(),
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.pushNamed(
                                  arguments: "تاجر".tr(),
                                  context,
                                  LoginScreen.routeName);
                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: (context) =>
                              //             const SellerHomeScreen()));
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xff4624C2),
                              fixedSize: const Size(200, 30),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            child: Text(
                              'تسجيل الدخول كتاجر'.tr(),
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.02,
                          ),
                          const Divider(),
                          Padding(
                            padding: const EdgeInsets.only(right: 15.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                DropdownButton<String>(
                                  iconEnabledColor: const Color(0xff4624C2),
                                  items: <String>['العربية', 'English']
                                      .map((String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value,
                                          style: const TextStyle(
                                              color: Color(0xff4624C2))),
                                    );
                                  }).toList(),
                                  onChanged: (_) {},
                                  hint: const Text('العربية',
                                      style:
                                          TextStyle(color: Color(0xff4624C2))),
                                ),
                                const Spacer(),
                                const Text('اللغة'),
                                const SizedBox(
                                  width: 10,
                                ),
                                SvgPicture.asset("assets/icon_images/lang.svg"),
                              ],
                            ),
                          ),
                          const Divider(),
                          CustomButton(
                            text: 'الشروط و الأحكام'.tr(),
                            icon: "assets/icon_images/conditions.svg",
                            onTap: () {},
                          ),
                          const Divider(),
                          CustomButton(
                            text: 'سياسة الخصوصية'.tr(),
                            icon: "assets/icon_images/politics.svg",
                            onTap: () {},
                          ),
                          const Divider(),
                          CustomButton(
                            text: 'تواصل معنا'.tr(),
                            icon: "assets/icon_images/phone.svg",
                            onTap: () {},
                          ),
                          const Divider(),
                          CustomButton(
                            text: 'الاشعارات'.tr(),
                            icon:
                                "assets/icon_images/ic_round-notifications.svg",
                            onTap: () {},
                          ),
                          const Divider(),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.02,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.5,
                            decoration: BoxDecoration(
                              border:
                                  Border.all(color: const Color(0xff4624C2)),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            height: MediaQuery.of(context).size.height * 0.05,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('مشاركة التطبيق'.tr()),
                                const SizedBox(width: 10),
                                SvgPicture.asset(
                                    "assets/icon_images/share.svg"),
                              ],
                            ),
                          ),
                          const Spacer(),
                          ElevatedButton(
                            onPressed: () {
                              Scaffold.of(context).closeDrawer();
                              showDialog(
                                context: context,
                                builder: (ctx) => MyAlertDialog(
                                  title: 'Logging out?',
                                  subtitle:
                                      'Thanks for stopping by. See you again soon!',
                                  action1Name: 'Cancel',
                                  action2Name: 'Log out',
                                  action1Func: () {
                                    Navigator.pop(ctx);
                                  },
                                  action2Func: () async {
                                    await ap.userSignOut().then((onValue) {
                                      Navigator.pushNamedAndRemoveUntil(
                                          ctx,
                                          AuthenticationScreen.routeName,
                                          (route) => false);
                                    });
                                  },
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xff4624C2),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            child: const Text(
                              'تسجيل الخروج',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.02,
                          ),
                        ],
                      ),
                    ),
                  ),
                  rtlOpening: true,
                  child: SafeArea(
                    child: BlocBuilder<MapMarkerCubit, MapMarkerState>(
                      builder: (context, state) {
                        return Scaffold(
                          body: SingleChildScrollView(
                            child: Column(
                              children: [
                                CustomAppBar(
                                    advancedDrawerController:
                                        _advancedDrawerController),
                                MapScreen(),
                                const SliderWidget(),
                                //  ImageSliderWidget(),
                                const CustomNavigationBar()
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
      //     }
      //   },
      // ),
    );
  }
}
