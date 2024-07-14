import 'package:anwer_shop/User/screens/home_screen/cubit/map_marker_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';

import '../home_screen/models/map_marker_model.dart';
import '../home_screen/widgets/countdown_timer.dart';
import '../home_screen/widgets/custom_appbar.dart';
import '../home_screen/widgets/image_slider_widget.dart';

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
                      padding: EdgeInsets.symmetric(horizontal: 16.0),
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
                              SizedBox(height: 10),
                              Row(
                                children: [
                                  Column(
                                    children: [
                                      Text(mapMarkerModel.province,
                                          style: TextStyle(fontSize: 16)),
                                      Text(
                                        mapMarkerModel.area,
                                        style: TextStyle(fontSize: 16),
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
                        const Icon(Icons.share, color: Colors.grey),
                        const Text('20', style: TextStyle(color: Colors.grey)),
                        const Icon(Icons.remove_red_eye, color: Colors.grey),
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
