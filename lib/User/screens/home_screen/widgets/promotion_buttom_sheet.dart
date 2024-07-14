import 'package:anwer_shop/User/screens/home_screen/models/map_marker_model.dart';
import 'package:anwer_shop/User/screens/home_screen/widgets/countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';

import '../../promotion _screen/promotion _screen.dart';

class PromotionBottomSheet extends StatelessWidget {
  MapMarkerModel mapMarkerModel;
  PromotionBottomSheet({required this.mapMarkerModel, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.7,
      padding: const EdgeInsets.all(16.0),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16.0),
          topRight: Radius.circular(16.0),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Column(
                children: [
                  Text(
                    mapMarkerModel.shopName,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Icon(Icons.star, color: Colors.yellow),
                      Icon(Icons.star, color: Colors.yellow),
                      Icon(Icons.star, color: Colors.yellow),
                      Icon(Icons.star, color: Colors.yellow),
                      Icon(Icons.star, color: Colors.grey),
                    ],
                  ),
                ],
              ),
              // const SizedBox(width: 8.0),
              CircleAvatar(
                backgroundColor: Colors
                    .transparent, // Optional, sets the background to transparent

                radius: 25,
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: mapMarkerModel.shopImageUrl.isNotEmpty
                          ? NetworkImage(mapMarkerModel.shopImageUrl)
                          : const AssetImage("assets/images/person_icon.png")
                              as ImageProvider,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                mapMarkerModel.discountPercentage != 0
                    ? '${mapMarkerModel.discountPercentage}%'
                    : '${mapMarkerModel.discountPercentageFrom}% > ${mapMarkerModel.discountPercentageTo}% ',
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Text(
                'نسبة الخصم',
                style: TextStyle(fontSize: 18),
              ),
            ],
          ),
          const Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CountdownTimer(targetDateString: mapMarkerModel.endOfferDate),
              const Text(
                'تبقى للخصم',
                style: TextStyle(fontSize: 18),
              ),
            ],
          ),
          const Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '${mapMarkerModel.province} , ${mapMarkerModel.area}',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Text(
                'مكان محل الخصم',
                style: TextStyle(fontSize: 18),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.2,
            child: ImageSlideshow(
              children: [
                Image.network(
                  mapMarkerModel.offerImage,
                  fit: BoxFit.fill,
                ),
                // Image.asset(
                //   "assets/icon_images/Rectangle 556.png",
                //   fit: BoxFit.cover,
                // ),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return PromotionScreen(
                  mapMarkerModel: mapMarkerModel,
                );
              }));
            },
            style: ElevatedButton.styleFrom(
              fixedSize: const Size(200, 40),
              backgroundColor: const Color(0xFF6C63FF),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: const Text(
              'عرض المزيد',
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
          ),
        ],
      ),
    );
  }
}
