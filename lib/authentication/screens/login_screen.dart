import 'package:flutter/material.dart';
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

import 'forgot_password.dart';
import 'register_screen.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = '/login-screen';
  final String role;
  const LoginScreen({super.key, required this.role});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isFocus = false;
  bool isObscure = false;
  String emailText = '';
  String passwordText = '';
  String errorText = '';
  String errorEmailText = '';

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
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

  String? validPassword(String? value) {
    return value!.length < 6
        ? 'Password has to be at least 6 characters long'
        : '';
  }

  handleLogin() async {
    final authenticationProvider = context.read<AuthenticationProvider>();
    final internetProvider = context.read<InternetProvider>();

    setState(() {
      errorEmailText = validateEmail(emailController.text.trim().toString())!;
      errorText = validPassword(passwordController.text.toString())!;
    });

    if (errorText.isEmpty && errorEmailText.isEmpty) {
      await internetProvider.checkInternetConnection();

      if (!internetProvider.hasInternet) {
        if (mounted) {
          Navigator.pop(context);
          openSnackbar(
              context, 'Check your internet connection', scheme.primary);
        }
      } else {
        try {
          await authenticationProvider.signInWithEmailAndPassword(
            emailController.text.trim(),
            passwordController.text,
          );

          if (authenticationProvider.hasError) {
            if (mounted) {
              openSnackbar(
                context,
                authenticationProvider.errorCode,
                scheme.primary,
              );
              authenticationProvider.resetError();
            }
          } else {
            if (widget.role == "تاجر") {
              await authenticationProvider
                  .getUserDataFromFirestore(authenticationProvider.uid);
            } else {
              await authenticationProvider
                  .getUserUSERDataFromFirestore(authenticationProvider.uid);
            }

            await authenticationProvider.saveDataToSharedPreferences(
                roleChosen: authenticationProvider.role ?? '');

            await authenticationProvider.setSignIn();

            if (authenticationProvider.emailVerified) {
              if (authenticationProvider.role == "تاجر") {
                if (mounted) {
                  Navigator.pushNamedAndRemoveUntil(
                      context, HomeScreen.routeName, (route) => false);
                }
              } else {
                if (mounted) {
                  Navigator.pushNamedAndRemoveUntil(
                      context, UserHomeScreen.routeName, (route) => false);
                }
              }
            } else {
              if (mounted) {
                Navigator.pushNamedAndRemoveUntil(
                    context, HomeScreen.routeName, (route) => false);
                Navigator.pushNamed(
                    context, SendVerificationEmailScreen.routeName,
                    arguments: widget.role);
              }
            }
          }
        } catch (e) {
          if (mounted) {
            openSnackbar(context, 'An error occurred: $e', scheme.primary);
          }
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF3D7CA),
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
        backgroundColor: Color(0xffF3D7CA),
        actions: [
          TextButton(
            onPressed: passwordText.isEmpty ? null : handleLogin,
            child: Text(
              'Continue',
              style: TextStyle(
                color: passwordText.isEmpty || emailText.isEmpty
                    ? Colors.grey[400]
                    : scheme.primary,
              ),
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 15, bottom: 20),
                      child: Image.asset(
                        'assets/images/login_icon.png',
                        width: 60,
                      ),
                    ),
                    const Text(
                      'Log in with your email',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 50),
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
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ResetPasswordScreen()),
                        );
                      },
                      child: Center(
                        child: Text(
                          'I forgot my password',
                          style: TextStyle(
                            color: scheme.primary,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(
                            arguments: widget.role,
                            context,
                            RegisterScreen.routeName);

                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //       builder: (context) => ResetPasswordScreen()),
                        // );
                      },
                      child: Center(
                        child: Text(
                          "I'm New",
                          style: TextStyle(
                            color: scheme.primary,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Divider(
              color: Colors.grey[300],
            ),
            CustomTextButton(
              text: 'Continue',
              onPressed: handleLogin,
              isDisabled: passwordText.isEmpty || emailText.isEmpty,
            ),
          ],
        ),
      ),
    );
  }
}
