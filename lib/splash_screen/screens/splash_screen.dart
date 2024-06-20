import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodpanda_seller/User/screens/home_screen/user_home_screen.dart';
import 'package:foodpanda_seller/authentication/screens/authentication_screen.dart';
import 'package:foodpanda_seller/constants/colors.dart';
import 'package:foodpanda_seller/home/screens/home_screen.dart';
import 'package:foodpanda_seller/home/screens/home_screen_no_approve.dart';
import 'package:foodpanda_seller/providers/authentication_provider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    final ap = context.read<AuthenticationProvider>();

    super.initState();

    Timer(const Duration(seconds: 2), () async {
      if (!ap.isSignedIn) {
        Navigator.pushReplacementNamed(context, AuthenticationScreen.routeName);
      } else {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        String role = prefs.getString('role') ?? "";
        (role == "تاجر")
            ? await ap.getUserDataFromFirestore(
                FirebaseAuth.instance.currentUser!.uid)
            : await ap.getUserUSERDataFromFirestore(
                FirebaseAuth.instance.currentUser!.uid);

        if (ap.isApproved) {
          (role == "تاجر")
              ? Navigator.pushReplacementNamed(context, HomeScreen.routeName)
              : Navigator.pushReplacementNamed(
                  context, UserHomeScreen.routeName);
        } else {
          Navigator.pushReplacementNamed(
              context, HomeScreenNoApprove.routeName);
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF3D7CA),
      body: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                scale: 2.5,
                image: AssetImage('assets/images/cart.png'),
              ),
            ),
          ),
          Positioned(
            bottom: 100,
            child: Text('AnwerShop',
                style: TextStyle(
                    letterSpacing: 1.5,
                    color: Color(0xffFFF8E3),
                    fontSize: 30,
                    fontFamily: 'Pacifico',
                    fontWeight: FontWeight.bold)),
          ),
          const Positioned(
            bottom: 50,
            child: CupertinoActivityIndicator(
              color: Colors.black,
            ),
          )
        ],
      ),
    );
  }
}
