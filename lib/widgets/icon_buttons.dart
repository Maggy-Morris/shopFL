import 'package:flutter/material.dart';
import 'package:anwer_shop/constants/colors.dart';

class IconButtonWidget extends StatelessWidget {
  final Color? color;
  final VoidCallback onPressed;
  final String imagePath; // Path to the asset image

  const IconButtonWidget({super.key, 
    this.color,
    required this.onPressed,
    required this.imagePath, // Image asset path
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0), // Reduce padding for tighter spacing
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(8.0), // Rounded corners
        splashColor: MyColors.primary.withOpacity(0.2), // Light splash color
        child: Image.asset(
          imagePath,

          fit: BoxFit.cover, // Ensure the image covers the container
        ),
      ),
    );
  }
}
