import 'package:flutter/material.dart';

class ImageWithText extends StatelessWidget {
  final Color color;
  final String text;
  final VoidCallback onPressed;
  final String imagePath; // Path to the asset image

  ImageWithText({
    required this.color,
    required this.text,
    required this.onPressed,
    required this.imagePath, // Image asset path
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        padding: EdgeInsets.zero,
      ),
      child: Row(
        children: [
          Text(
            text,
            style: TextStyle(fontSize: 12), // Adjust font size as needed
          ),
          Image.asset(
            imagePath, // Use the provided asset image path
            width: 24, // Adjust size as needed
            height: 24,
          ),
        ],
      ),
    );
  }
}
