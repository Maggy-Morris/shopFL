import 'package:flutter/material.dart';
import 'package:anwer_shop/constants/colors.dart';
import 'package:anwer_shop/widgets/assetImage_withtext.dart';

class GradientButtonFb1 extends StatelessWidget {
  final String text;
  final Function() onPressed;
  const GradientButtonFb1(
      {required this.text, required this.onPressed, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    const primaryColor = MyColors.primary;
    const secondaryColor = MyColors.primary;
    const accentColor = Color(0xffffffff);

    const double borderRadius = 15;

    return DecoratedBox(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(borderRadius),
            gradient:
                const LinearGradient(colors: [primaryColor, secondaryColor])),
        child: ElevatedButton(
          style: ButtonStyle(
              elevation: MaterialStateProperty.all(0),
              alignment: Alignment.center,
              padding: MaterialStateProperty.all(const EdgeInsets.only(
                  right: 75, left: 75, top: 15, bottom: 15)),
              backgroundColor: MaterialStateProperty.all(Colors.transparent),
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(borderRadius)),
              )),
          onPressed: onPressed,
          child: Text(
            text,
            style: const TextStyle(color: accentColor, fontSize: 16),
          ),
        ));
  }
}

class InvertedButtonFb2 extends StatelessWidget {
  final String text;
  final Function() onPressed;
  InvertedButtonFb2({required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    const primaryColor = MyColors.primary;

    return OutlinedButton(
      style: ButtonStyle(
          elevation: MaterialStateProperty.all(0),
          alignment: Alignment.center,
          side: MaterialStateProperty.all(
              const BorderSide(width: 1, color: primaryColor)),
          padding: MaterialStateProperty.all(const EdgeInsets.only(
              right: 60, left: 60, top: 10.5, bottom: 10.5)),
          backgroundColor: MaterialStateProperty.all(Colors.transparent),
          shape: MaterialStateProperty.all(RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25.0)))),
      onPressed: onPressed,
      child: Text(
        text,
        style: const TextStyle(color: primaryColor, fontSize: 16),
      ),
    );
  }
}

class GradientButtonFb3 extends StatelessWidget {
  final String text;
  final String imagePath;

  final Function() onPressed;
  const GradientButtonFb3(
      {required this.text,
      required this.onPressed,
      Key? key,
      required this.imagePath})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    const primaryColor = MyColors.primary;
    const secondaryColor = MyColors.primary;
    const accentColor = Color(0xffffffff);

    const double borderRadius = 15;

    return DecoratedBox(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(borderRadius),
            gradient:
                const LinearGradient(colors: [primaryColor, secondaryColor])),
        child: ElevatedButton(
          style: ButtonStyle(
              elevation: MaterialStateProperty.all(0),
              alignment: Alignment.center,
              padding: MaterialStateProperty.all(const EdgeInsets.only(
                  right: 75, left: 75, top: 15, bottom: 15)),
              backgroundColor: MaterialStateProperty.all(Colors.transparent),
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(borderRadius)),
              )),
          onPressed: onPressed,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                text,
                style: TextStyle(
                  fontSize: 12,
                  color: MyColors.white,
                ), // Adjust font size as needed
              ),
              SizedBox(
                width: 10,
              ),
              Image.asset(
                imagePath, // Use the provided asset image path
                width: 24, // Adjust size as needed
                height: 24,
              ),
            ],
          ),

          // ImageWithText(
          //   onPressed: () {},
          //   text: text,
          //   color: MyColors.white,
          //   imagePath: imagePath,
          // ),
        ));
  }
}

class InvertedButtonFb3 extends StatelessWidget {
  final String text;
  final Function() onPressed;
  InvertedButtonFb3({required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    const primaryColor = MyColors.primary;

    return OutlinedButton(
      style: ButtonStyle(
          elevation: MaterialStateProperty.all(0),
          alignment: Alignment.center,
          side: MaterialStateProperty.all(
              const BorderSide(width: 1, color: primaryColor)),
          padding: MaterialStateProperty.all(const EdgeInsets.only(
              right: 60, left: 60, top: 10.5, bottom: 10.5)),
          backgroundColor: MaterialStateProperty.all(Colors.transparent),
          shape: MaterialStateProperty.all(RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25.0)))),
      onPressed: onPressed,
      child: Text(
        text,
        style: const TextStyle(color: primaryColor, fontSize: 16),
      ),
    );
  }
}
