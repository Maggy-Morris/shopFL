import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodpanda_seller/User/core/screen/not_sign_in_screen.dart';
// import 'package:shops/screens/home_screen/widgets/custom_navigation_icons.dart';

import '../../../../providers/authentication_provider.dart';
// import '../../../auth/blocs/authentication_bloc/authentication_bloc.dart';
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
                print("Authenticated");
              } else {
                Navigator.pushNamed(context, NotSignInScreen.routeName);

                // Navigator.pushNamed(context, "NotSigned");
              }
            },
            image: "assets/icon_images/share-2.svg",
            text: "مشاركة التطبيق",
          ),
          CustomNavigationIcons(
            onTap: () {
              if (ap.isSignedIn) {
                print("Authenticated");
              } else {
                Navigator.pushNamed(context, NotSignInScreen.routeName);

                // Navigator.pushNamed(context, "NotSigned");
              }
            },
            image: "assets/icon_images/briefcase.svg",
            text: "العروض",
          ),
          CustomNavigationIcons(
            onTap: () {
              if (ap.isSignedIn) {
                print("Authenticated");
              } else {
                Navigator.pushNamed(context, NotSignInScreen.routeName);

                // Navigator.pushNamed(context, "NotSigned");
              }
            },
            image: "assets/icon_images/shopping-bag.svg",
            text: "الخصومات",
          ),
          CustomNavigationIcons(
            onTap: () {
              if (ap.isSignedIn) {
                print("Authenticated");
              } else {
                Navigator.pushNamed(context, NotSignInScreen.routeName);

                // Navigator.pushNamed(context, "NotSigned");
              }
            },
            image: "assets/icon_images/user.svg",
            text: "حسابي",
          )
        ],
      ),
      //   },
      // ),
    );
  }
}
