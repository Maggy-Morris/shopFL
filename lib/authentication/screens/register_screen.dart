import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pw_validator/flutter_pw_validator.dart';
import 'package:anwer_shop/User/screens/home_screen/user_home_screen.dart';
import 'package:anwer_shop/authentication/screens/send_verification_email_screen.dart';
import 'package:anwer_shop/authentication/widgets/custom_textbutton.dart';
import 'package:anwer_shop/constants/colors.dart';
import 'package:anwer_shop/home/screens/home_screen.dart';
import 'package:anwer_shop/providers/authentication_provider.dart';
import 'package:anwer_shop/providers/internet_provider.dart';
import 'package:anwer_shop/widgets/custom_textfield.dart';
import 'package:anwer_shop/widgets/my_snack_bar.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatefulWidget {
  static const String routeName = '/register-screen';
  final String role;
  const RegisterScreen({super.key, required this.role});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController shopNameController = TextEditingController();

  bool isFocus = false;
  bool isObscure = false;
  String firstNameText = '';
  String lastNameText = '';
  String shopNameText = '';

  String emailText = '';
  String passwordText = '';
  String errorText = '';
  String errorEmailText = '';
  bool isError = false;

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    shopNameController.dispose();
  }

  String? validateEmail(String? value) {
    const pattern = r"(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'"
        r'*+/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-'
        r'\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*'
        r'[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:(2(5[0-5]|[0-4]'
        r'[0-9])|1[0-9][0-9]|[1-9]?[0-9]))\.){3}(?:(2(5[0-5]|[0-4][0-9])|1[0-9]'
        r'[0-9]|[1-9]?[0-9])|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\'
        r'x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])';
    final regex = RegExp(pattern);

    return value!.isNotEmpty && !regex.hasMatch(value)
        ? 'Enter a valid email address'
        : '';
  }

  String? validPassword() {
    return isError ? 'Please complete the requirement.' : '';
  }

  handleRegister() async {
    final authenticationProvider = context.read<AuthenticationProvider>();
    final internetProvider = context.read<InternetProvider>();

    setState(() {
      errorEmailText = validateEmail(emailController.text.trim().toString())!;
      errorText = validPassword()!;
    });
    if (errorText.isEmpty && errorEmailText.isEmpty) {
      await internetProvider.checkInternetConnection();
      if (internetProvider.hasInternet == false) {
        Navigator.pop(context);
        openSnackbar(context, 'Check your internet connection', scheme.primary);
      } else {
        await authenticationProvider
            .registerWithEmail(
          '${firstNameController.text.trim()} ${lastNameController.text.trim()}',
          emailController.text.trim().toString(),
          passwordController.text.toString(),
          widget.role,
          shopNameController.text,
        )
            .then((value) async {
          if (authenticationProvider.hasError) {
            openSnackbar(
              context,
              authenticationProvider.errorCode,
              scheme.primary,
            );
            authenticationProvider.resetError();
          } else {
            // save to firestore
            await authenticationProvider.saveUserDataToFirestore(
                roleChosen: widget.role);

            await authenticationProvider.saveDataToSharedPreferences(
                roleChosen: widget.role);
            await authenticationProvider.setSignIn();
            (widget.role == "تاجر")
                ? Navigator.pushNamedAndRemoveUntil(
                    context, HomeScreen.routeName, (route) => false)
                : Navigator.pushNamedAndRemoveUntil(
                    context, UserHomeScreen.routeName, (route) => false);

            Navigator.pushNamed(
                arguments: widget.role,
                context,
                SendVerificationEmailScreen.routeName);
          }
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF3D7CA),
      appBar: AppBar(
        backgroundColor: Color(0xffF3D7CA),
        actions: [
          TextButton(
            onPressed: firstNameText.isEmpty ||
                    lastNameText.isEmpty ||
                    shopNameText.isEmpty ||
                    passwordText.isEmpty
                ? null
                : handleRegister,
            child: Text(
              'Continue',
              style: TextStyle(
                color: firstNameText.isEmpty ||
                        lastNameText.isEmpty ||
                        passwordText.isEmpty ||
                        shopNameText.isEmpty ||
                        emailText.isEmpty
                    ? Colors.black
                    : scheme.primary,
              ),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 15, bottom: 20),
                        child: Image.asset(
                          'assets/images/cart.png',
                          width: 60,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 25.0),
                        child: Text(
                          "${widget.role}".tr(),
                          style: TextStyle(fontSize: 18),
                        ),
                      )
                    ],
                  ),
                  Text(
                    'Sign up with your email'.tr(),
                    style: const TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width / 2 - 15,
                        padding: const EdgeInsets.only(right: 7),
                        child: CustomTextField(
                          controller: firstNameController,
                          labelText: 'First name',
                          onChanged: (value) {
                            setState(() {
                              firstNameText = value;
                            });
                          },
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width / 2 - 15,
                        padding: const EdgeInsets.only(left: 7),
                        child: CustomTextField(
                          controller: lastNameController,
                          labelText: 'Last name',
                          onChanged: (value) {
                            setState(() {
                              lastNameText = value;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  (widget.role == "تاجر")
                      ? Padding(
                          padding: const EdgeInsets.only(bottom: 20.0),
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            child: CustomTextField(
                              controller: shopNameController,
                              labelText: 'Shop name',
                              onChanged: (value) {
                                setState(() {
                                  shopNameText = value;
                                });
                              },
                            ),
                          ),
                        )
                      : SizedBox.shrink(),
                  CustomTextField(
                    controller: emailController,
                    labelText: 'Email',
                    onChanged: (value) {
                      setState(() {
                        emailText = value;
                      });
                    },
                    errorText: errorEmailText,
                  ),
                  const SizedBox(height: 20),
                  CustomTextField(
                    controller: passwordController,
                    labelText: 'Password',
                    noIcon: false,
                    onChanged: (value) {
                      setState(() {
                        passwordText = value;
                      });
                    },
                    errorText: errorText,
                  ),
                  const SizedBox(height: 20),
                  FlutterPwValidator(
                    controller: passwordController,
                    minLength: 6,
                    uppercaseCharCount: 1,
                    lowercaseCharCount: 1,
                    numericCharCount: 1,
                    specialCharCount: 1,
                    width: 400,
                    defaultColor: Colors.grey[400]!,
                    failureColor: Colors.red,
                    height: 170,
                    onSuccess: () {
                      setState(() {
                        isError = false;
                      });
                    },
                    onFail: () {
                      setState(() {
                        isError = true;
                      });
                    },
                  ),
                  // const SizedBox(height: 20),
                ],
              ),
              Divider(
                color: Colors.grey[300],
              ),
              CustomTextButton(
                text: 'Continue',
                onPressed: handleRegister,
                isDisabled: firstNameText.isEmpty ||
                    lastNameText.isEmpty ||
                    passwordText.isEmpty ||
                    emailText.isEmpty,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
