import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
// import 'package:anwer_shop/User/user%20home%20screen/user_home_screen.dart';
import 'package:anwer_shop/authentication/screens/login_screen.dart';
import 'package:anwer_shop/authentication/screens/register_screen.dart';
import 'package:anwer_shop/authentication/widgets/custom_textbutton.dart';
import 'package:anwer_shop/constants/colors.dart';

import '../../User/screens/home_screen/user_home_screen.dart';
class AuthenticationScreen extends StatefulWidget {
  static const String routeName = '/authentication-screen';

  const AuthenticationScreen({super.key});

  @override
  State<AuthenticationScreen> createState() => _AuthenticationScreenState();
}

class _AuthenticationScreenState extends State<AuthenticationScreen> {
  bool isCustomer = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF3D7CA),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.45,
              child: Center(
                child: Image.asset(
                  'assets/images/cart.png',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          isCustomer = true;
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: isCustomer ? scheme.primary : Colors.grey,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Text(
                        'مستخدم'.tr(),
                        style: TextStyle(
                            color: isCustomer ? Colors.white : scheme.primary),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          isCustomer = false;
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: !isCustomer ? scheme.primary : Colors.grey,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Text(
                        'تاجر'.tr(),
                        style: TextStyle(
                            color: !isCustomer ? Colors.white : scheme.primary),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Text(
                'Elevate your business with us,',
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
                Navigator.pushNamed(
                    arguments: isCustomer ? "مستخدم" : "تاجر",
                    context,
                    RegisterScreen.routeName);
              },
              isDisabled: false,
            ),
            CustomTextButton(
              text: 'Sign In',
              onPressed: () {
                Navigator.pushNamed(
                    arguments: isCustomer ? "مستخدم" : "تاجر",
                    context,
                    LoginScreen.routeName);
              },
              isDisabled: false,
              isOutlined: true,
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, UserHomeScreen.routeName);
              },
              child: const Text("Continue as Guest"),
            ),
          ],
        ),
      ),
    );
  }
}
