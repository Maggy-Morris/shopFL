import 'package:flutter/material.dart';
// import 'package:foodpanda_seller/User/user%20home%20screen/user_home_screen.dart';
import 'package:foodpanda_seller/authentication/screens/login_screen.dart';
import 'package:foodpanda_seller/authentication/screens/register_screen.dart';
import 'package:foodpanda_seller/authentication/widgets/custom_textbutton.dart';

import '../../User/screens/home_screen/user_home_screen.dart';

class AuthenticationScreen extends StatefulWidget {
  static const String routeName = '/authentication-screen';

  const AuthenticationScreen({super.key});

  @override
  State<AuthenticationScreen> createState() => _AuthenticationScreenState();
}

class _AuthenticationScreenState extends State<AuthenticationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF3D7CA),
      // appBar: AppBar(
      //   backgroundColor: Color(0xffF3D7CA),
      // ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.55,
              child: Center(
                child: Image.asset(
                  'assets/images/cart.png',
                  // width: 200,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Text(
                'Elevated your business with us,',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 25,
                ),
              ),
            ),
            Text(
              'Welcome to AnwerShop App',
              style: TextStyle(
                color: Colors.grey[500]!,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 15),
            CustomTextButton(
              text: 'I\'m new here',
              onPressed: () {
                Navigator.pushNamed(context, RegisterScreen.routeName);
              },
              isDisabled: false,
            ),
            CustomTextButton(
              text: 'Sign In',
              onPressed: () {
                Navigator.pushNamed(context, LoginScreen.routeName);
              },
              isDisabled: false,
              isOutlined: true,
            ),
            TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, UserHomeScreen.routeName);
                },
                child: Text("Countinue as Guest "))
          ],
        ),
      ),
    );
  }
}
