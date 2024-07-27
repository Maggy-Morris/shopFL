import 'package:anwer_shop/User/screens/home_screen/cubit/map_marker_cubit.dart';
import 'package:anwer_shop/constants/colors.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';

import '../../../generated/assets.dart';
import '../../../widgets/icon_buttons.dart';
import '../home_screen/models/map_marker_model.dart';
import '../home_screen/widgets/countdown_timer.dart';
import '../home_screen/widgets/custom_appbar.dart';
import '../home_screen/widgets/image_slider_widget.dart';

// ignore: must_be_immutable
class PromotionScreen extends StatelessWidget {
  MapMarkerModel mapMarkerModel;
  static const String routeName = '/Promotion-screen';

  PromotionScreen({required this.mapMarkerModel, super.key});

  final AdvancedDrawerController _advancedDrawerController =
      AdvancedDrawerController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MapMarkerCubit(),
      child: BlocBuilder<MapMarkerCubit, MapMarkerState>(
        builder: (context, state) {
          return SafeArea(
            child: Scaffold(
              body: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  // crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    CustomAppBar(
                        advancedDrawerController: _advancedDrawerController),
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8.0),
                                child: Text(mapMarkerModel.shopName,
                                    style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold)),
                              ),
                              const SizedBox(height: 10),
                              Row(
                                children: [
                                  Column(
                                    children: [
                                      Text(mapMarkerModel.province,
                                          style: const TextStyle(fontSize: 16)),
                                      Text(
                                        mapMarkerModel.area,
                                        style: const TextStyle(fontSize: 16),
                                      ),
                                    ],
                                  ),
                                  const Icon(Icons.location_on,
                                      color: Colors.grey),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(width: 10),
                          CircleAvatar(
                            backgroundColor: Colors
                                .transparent, // Optional, sets the background to transparent

                            radius: 30,
                            child: Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: mapMarkerModel.shopImageUrl.isNotEmpty
                                      ? NetworkImage(
                                          mapMarkerModel.shopImageUrl)
                                      : const AssetImage(
                                              "assets/images/person_icon.png")
                                          as ImageProvider,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: MyColors.primary,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0, vertical: 4.0),
                                  minimumSize: const Size(0,
                                      0), // Set minimum size to 0 to make it as small as possible
                                ),
                                onPressed: () {},
                                child: Text(
                                    style: const TextStyle(
                                        color: MyColors.backgroundColor,
                                        fontSize: 12),
                                    "تخفيض الي ${mapMarkerModel.discountPercentageTo} %"
                                        .tr())),
                            const SizedBox(
                              width: 15,
                            ),
                            ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: MyColors.primary,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0, vertical: 4.0),
                                  minimumSize: const Size(0,
                                      0), // Set minimum size to 0 to make it as small as possible
                                ),
                                onPressed: () {},
                                child: Text(
                                    style: const TextStyle(
                                        color: MyColors.backgroundColor,
                                        fontSize: 12),
                                    "تخفيض من ${mapMarkerModel.discountPercentageFrom} %"
                                        .tr())),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButtonWidget(
                              onPressed: () {},
                              imagePath: Assets.whatsApp,
                            ),
                            IconButtonWidget(
                              onPressed: () {},
                              imagePath: Assets.facebook,
                            ),
                            IconButtonWidget(
                              onPressed: () {},
                              imagePath: Assets.instgram,
                            ),
                            IconButtonWidget(
                              onPressed: () {},
                              imagePath: Assets.twitter,
                            ),
                            IconButtonWidget(
                              onPressed: () {},
                              imagePath: Assets.snapChat,
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 30),
                    ImageSliderWidget(
                      imageUrls: [mapMarkerModel.offerImage],
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CountdownTimer(
                            targetDateString: mapMarkerModel.endOfferDate),
                        const Text('تبقى للخصم',
                            style: TextStyle(color: Colors.grey)),
                        IconButtonWidget(
                          onPressed: () {},
                          imagePath: Assets.share,
                        ),
                        const Text('20', style: TextStyle(color: Colors.grey)),
                        const Icon(Icons.remove_red_eye_outlined,
                            color: Colors.grey),
                        const Text('20', style: TextStyle(color: Colors.grey)),
                      ],
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                    ImageSliderWidget(
                      imageUrls: [mapMarkerModel.offerImage],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
