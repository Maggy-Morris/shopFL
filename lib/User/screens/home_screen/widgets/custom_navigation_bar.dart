import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:anwer_shop/User/core/screen/not_sign_in_screen.dart';
import 'package:anwer_shop/User/screens/user_profile/user_profile_screen.dart';
// import 'package:shops/screens/home_screen/widgets/custom_navigation_icons.dart';

import '../../../../providers/authentication_provider.dart';
// import '../../../auth/blocs/authentication_bloc/authentication_bloc.dart';
import '../../discount_screen_user/discount_screen_user.dart';
import '../../offers_screen_user/offers_screen_user.dart';
import 'custom_navigation_icons.dart';

class CustomNavigationBar extends StatelessWidget {
  const CustomNavigationBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final ap = context.watch<AuthenticationProvider>();

    return Container(
      height: MediaQuery.of(context).size.height * 0.08,
      width: MediaQuery.of(context).size.width * 0.9,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: const Color(0xff4624C2),
      ),
      child:
          //  BlocBuilder<AuthenticationUserBloc, AuthenticationUserState>(
          //   builder: (context, state) {
          //     return
          Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CustomNavigationIcons(
            onTap: () {
              if (ap.isSignedIn) {
                debugPrint("Authenticated");
              } else {
                Navigator.pushNamed(context, NotSignInScreen.routeName);

                // Navigator.pushNamed(context, "NotSigned");
              }
            },
            image: "assets/icon_images/share-2.svg",
            text: "مشاركة التطبيق".tr(),
          ),
          CustomNavigationIcons(
            onTap: () {
              if (ap.isSignedIn) {
                debugPrint("Authenticated");
                Navigator.pushNamed(context, OffersScreenUser.routeName);
              } else {
                Navigator.pushNamed(context, NotSignInScreen.routeName);

                // Navigator.pushNamed(context, "NotSigned");
              }
            },
            image: "assets/icon_images/briefcase.svg",
            text: "العروض".tr(),
          ),
          CustomNavigationIcons(
            onTap: () {
              if (ap.isSignedIn) {
                debugPrint("Authenticated");

                Navigator.pushNamed(context, DiscountScreenUser.routeName);
              } else {
                Navigator.pushNamed(context, NotSignInScreen.routeName);
              }
            },
            image: "assets/icon_images/shopping-bag.svg",
            text: "الخصومات".tr(),
          ),
          CustomNavigationIcons(
            onTap: () {
              if (ap.isSignedIn) {
                Navigator.pushNamed(context, UserProfileScreen.routeName);
              } else {
                Navigator.pushNamed(context, NotSignInScreen.routeName);

                // Navigator.pushNamed(context, "NotSigned");
              }
            },
            image: "assets/icon_images/user.svg",
            text: "حسابي".tr(),
          )
        ],
      ),
      //   },
      // ),
    );
  }
}
