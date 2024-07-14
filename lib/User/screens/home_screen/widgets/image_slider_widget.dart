import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';

class ImageSliderWidget extends StatelessWidget {
  final List<String> imageUrls;

  const ImageSliderWidget({
    Key? key,
    required this.imageUrls,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.25,
      child: ImageSlideshow(
        children: imageUrls.isNotEmpty
            ? imageUrls.map((url) {
                return Image.network(
                  url,
                  fit: BoxFit.fill,
                );
              }).toList()
            : [
                Image.asset(
                  "assets/icon_images/Rectangle 556.png",
                  fit: BoxFit.fill,
                ),
              ],
      ),
    );
  }
}
