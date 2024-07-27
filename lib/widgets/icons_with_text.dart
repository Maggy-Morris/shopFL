import 'package:flutter/material.dart';
import 'package:anwer_shop/constants/colors.dart';

class IconWithText extends StatelessWidget {
  final IconData icon;
  final Color color;

  final String text;
  final VoidCallback onPressed;

  const IconWithText({
    Key? key,
    required this.icon,
    required this.text,
    required this.onPressed,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        padding: EdgeInsets.zero,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(text,
              style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: MyColors.lightText)),
          Icon(
            icon,
            color: color,
          )
        ],
      ),
    );
  }
}
