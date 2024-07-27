// import 'package:anwer_shop/constants/colors.dart';
// import 'package:flutter/material.dart';

// class DiscountScreenUser extends StatelessWidget {
//   static const String routeName = '/discount-screen-user';

//   const DiscountScreenUser({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const Scaffold(
//       backgroundColor: MyColors.backgroundColor,
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [],
//         ),
//       ),
//     );
//   }
// }

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../constants/colors.dart';
import '../../../providers/offers_provider.dart';

class DiscountScreenUser extends StatefulWidget {
  static const String routeName = '/discount-screen-user';

  const DiscountScreenUser({super.key});
  @override
  // ignore: library_private_types_in_public_api
  _DiscountScreenUserState createState() => _DiscountScreenUserState();
}

class _DiscountScreenUserState extends State<DiscountScreenUser> {
  late Future<List<Map<String, dynamic>>> _offersFuture;

  @override
  void initState() {
    super.initState();
    _offersFuture = Provider.of<RegisterOfferProvider>(context, listen: false)
        .fetchAllOffers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.onBackground,
      appBar: AppBar(
        forceMaterialTransparency: true,
        foregroundColor: MyColors.onBackground,
        title: Text(
          'الخصومات'.tr(),
          style: const TextStyle(
            color: MyColors.textColor,
            fontSize: 16,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            // nameText.isNotEmpty &&
            //         descriptionText.isNotEmpty &&
            //         address != null &&
            //         ((imageXFile == null && imageUrl.isNotEmpty) ||
            //             (imageXFile != null && imageUrl.isEmpty))
            //     ? null
            //     //  handleRegisterShop
            //     : null,
            icon: const Icon(
              Icons.arrow_forward_ios_sharp,
              color: MyColors.textColor,
            ),
          ),
        ],
      ),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: _offersFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return const Center(child: Text('Error fetching offers'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No offers available'));
          } else {
            final offers = snapshot.data!;
            return ListView.builder(
              itemCount: offers.length,
              itemBuilder: (context, index) {
                final offer = offers[index];
                return buildOfferCard(offer);
              },
            );
          }
        },
      ),
    );
  }

  Widget buildOfferCard(Map<String, dynamic> offer) {
    return Card(
      elevation: 4.0,
      margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                if (offer['offerImage'] != null)
                  Image.network(
                    offer['offerImage'],
                    width: 80,
                    height: 80,
                    fit: BoxFit.cover,
                  ),
                const SizedBox(width: 16.0),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        offer['shopName'] ?? 'No Shop Name',
                        style: const TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8.0),
                      Text(
                        'Ends on: ${offer['endOffersDate']}',
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16.0),
            Text(
              'Original Price: \$${offer['originalPrice']?.toStringAsFixed(2) ?? 'N/A'}',
              style: const TextStyle(
                fontSize: 16.0,
              ),
            ),
            const SizedBox(height: 8.0),
            Text(
              'Discounted Price: \$${offer['priceAfterDiscount']?.toStringAsFixed(2) ?? 'N/A'}',
              style: const TextStyle(
                fontSize: 16.0,
              ),
            ),
            const SizedBox(height: 8.0),
            Text(
              'Discount: ${offer['discountPercentage']?.toStringAsFixed(2) ?? 'N/A'}%',
              style: const TextStyle(
                fontSize: 16.0,
              ),
            ),
            const SizedBox(height: 8.0),
            offer['discountPercentageFrom'] != 0.0
                ? Text(
                    'Discount From: ${offer['discountPercentageFrom']?.toStringAsFixed(2) ?? 'N/A'}%',
                    style: const TextStyle(
                      fontSize: 16.0,
                    ),
                  )
                : Container(),
            const SizedBox(height: 8.0),
            offer['discountPercentageTo'] != 0.0
                ? Text(
                    'Discount To: ${offer['discountPercentageTo']?.toStringAsFixed(2) ?? 'N/A'}%',
                    style: const TextStyle(
                      fontSize: 16.0,
                    ),
                  )
                : Container(),
            const SizedBox(height: 8.0),
            offer['currency'] != ''
                ? Text(
                    'Currency: ${offer['currency'] ?? 'N/A'}',
                    style: const TextStyle(
                      fontSize: 16.0,
                    ),
                  )
                : Container()
          ],
        ),
      ),
    );
  }
}
