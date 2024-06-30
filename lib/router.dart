import 'package:flutter/material.dart';
import 'package:anwer_shop/User/core/screen/not_sign_in_screen.dart';
import 'package:anwer_shop/address/screens/address_screen.dart';
import 'package:anwer_shop/adds/adds_screen.dart';
import 'package:anwer_shop/authentication/screens/authentication_screen.dart';
import 'package:anwer_shop/authentication/screens/login_screen.dart';
import 'package:anwer_shop/authentication/screens/register_screen.dart';
import 'package:anwer_shop/authentication/screens/send_verification_email_screen.dart';

import 'package:anwer_shop/home/screens/home_screen.dart';
import 'package:anwer_shop/home/screens/home_screen_no_approve.dart';
import 'package:anwer_shop/online%20Store/online_store_screen.dart';

import 'package:anwer_shop/register_shop/screens/register_shop_screen.dart';
import 'package:anwer_shop/register_shop/screens/search_address_manual_screen.dart';

// import 'User/user home screen/user_home_screen.dart';
import 'User/screens/home_screen/user_home_screen.dart';
import 'User/screens/user_profile/user_profile_screen.dart';
import 'add_offers/add_offers_screen.dart';
import 'settings/settings_screen.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case HomeScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const HomeScreen(),
      );

    case HomeScreenNoApprove.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const HomeScreenNoApprove(),
      );

    case AuthenticationScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const AuthenticationScreen(),
      );

    case LoginScreen.routeName:
      final role = routeSettings.arguments as String;

      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => LoginScreen(role: role),
      );

    case UserHomeScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => UserHomeScreen(),
      );

    case NotSignInScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const NotSignInScreen(),
      );

    //  case MarkerPage.routeName:
    //   return MaterialPageRoute(
    //     settings: routeSettings,
    //     builder: (_) => const MarkerPage(),
    //   );
    case RegisterScreen.routeName:
      final role = routeSettings.arguments as String;

      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => RegisterScreen(
          role: role,
        ),
      );

    case SendVerificationEmailScreen.routeName:
      final role = routeSettings.arguments as String;

      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => SendVerificationEmailScreen(
          role: role,
        ),
      );

    // case MenuScreen.routeName:
    //   return MaterialPageRoute(
    //     settings: routeSettings,
    //     builder: (_) => const MenuScreen(),
    //   );

    // case FoodScreen.routeName:
    //   final id = routeSettings.arguments as String;

    //   return MaterialPageRoute(
    //     settings: routeSettings,
    //     builder: (_) => FoodScreen(
    //       id: id,
    //     ),
    //   );

    // case AddCategoryScreen.routeName:
    //   final args = routeSettings.arguments as AddCategoryScreen;
    //   return MaterialPageRoute(
    //     settings: routeSettings,
    //     builder: (_) => AddCategoryScreen(
    //       title: args.title,
    //       subtitle: args.subtitle,
    //       id: args.id,
    //     ),
    //   );

    // case AddFoodScreen.routeName:
    //   final args = routeSettings.arguments as AddFoodScreen;

    //   return MaterialPageRoute(
    //     settings: routeSettings,
    //     builder: (_) => AddFoodScreen(
    //       id: args.id,
    //       foodId: args.foodId,
    //     ),
    //   );

    // case AddCustomizationScreen.routeName:
    //   final args = routeSettings.arguments as AddCustomizationScreen;
    //   return MaterialPageRoute(
    //     settings: routeSettings,
    //     builder: (_) => AddCustomizationScreen(
    //       categoryId: args.categoryId,
    //       foodId: args.foodId,
    //     ),
    //   );

    case RegisterShopScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => RegisterShopScreen(),
      );

    case AddOffersScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const AddOffersScreen(),
      );

    case SettingsScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const SettingsScreen(),
      );

    case UserProfileScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const UserProfileScreen(),
      );

    case OnlineStoreScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const OnlineStoreScreen(),
      );

    case AddsScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const AddsScreen(),
      );

    // case SearchAddressManualScreen.routeName:
    //   final args = routeSettings.arguments as SearchAddressManualScreen;

    //   return MaterialPageRoute(
    //     settings: routeSettings,
    //     builder: (_) => SearchAddressManualScreen(
    //       initialLatLng: args.initialLatLng,
    //       changeAddress: args.changeAddress,
    //       mapPreviewController: args.mapPreviewController,
    //     ),
    //   );
    case SearchAddressManualScreen.routeName:
      final args = routeSettings.arguments
          as Map<String, dynamic>; // Cast arguments to Map

      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => SearchAddressManualScreen(
          initialLatLng: args['initialLatLng'], // Access arguments using keys
          changeAddress: args['changeAddress'],
          // mapPreviewController: args['mapPreviewController'],
        ),
      );

    case AddressScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const AddressScreen(),
      );

    // case OrderScreen.routeName:
    //   return MaterialPageRoute(
    //     settings: routeSettings,
    //     builder: (_) => const OrderScreen(),
    //   );

    // case OrderHistoryScreen.routeName:
    //   return MaterialPageRoute(
    //     settings: routeSettings,
    //     builder: (_) => const OrderHistoryScreen(),
    //   );

    // case BannerScreen.routeName:
    //   return MaterialPageRoute(
    //     settings: routeSettings,
    //     builder: (_) => const BannerScreen(),
    //   );

    // case AddBannerScreen.routeName:
    //   return MaterialPageRoute(
    //     settings: routeSettings,
    //     builder: (_) => const AddBannerScreen(),
    //   );

    default:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const Scaffold(
          body: Center(
            child: Text('Screen does not exist!'),
          ),
        ),
      );
  }
}
