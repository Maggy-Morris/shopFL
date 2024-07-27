import 'package:anwer_shop/providers/offers_provider.dart';
import 'package:anwer_shop/providers/online_store_provider.dart';
import 'package:easy_localization/easy_localization.dart' hide TextDirection;
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:anwer_shop/constants/colors.dart';
import 'package:anwer_shop/firebase_options.dart';
import 'package:anwer_shop/providers/location_provider.dart';
import 'package:anwer_shop/providers/register_shop_provider.dart';
import 'package:anwer_shop/providers/authentication_provider.dart';
import 'package:anwer_shop/providers/internet_provider.dart';
import 'package:anwer_shop/router.dart';
import 'package:anwer_shop/splash_screen/screens/splash_screen.dart';
import 'package:provider/provider.dart';

import 'providers/adds_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
  runApp(
    EasyLocalization(
        supportedLocales: const [Locale('en'), Locale('ar')],
        path:
            'assets/translations', // <-- change the path of the translation files
        fallbackLocale: const Locale('ar'),
        child: const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AuthenticationProvider()),
        ChangeNotifierProvider(create: (context) => InternetProvider()),
        ChangeNotifierProvider(create: (context) => RegisterShopProvider()),
        ChangeNotifierProvider(create: (context) => LocationProvider()),
        ChangeNotifierProvider(create: (context) => RegisterAddsProvider()),
        ChangeNotifierProvider(create: (context) => RegisterOfferProvider()),
        ChangeNotifierProvider(
            create: (context) => RegisterOnlineStoreProvider()),
      ],
      child: Builder(
        builder: (context) {
          // Determine the direction based on the locale
          TextDirection direction = context.locale.languageCode == 'ar'
              ? TextDirection.ltr
              : TextDirection.rtl;

          return Directionality(
            textDirection: direction,
            child: MaterialApp(
              localizationsDelegates: context.localizationDelegates,
              supportedLocales: context.supportedLocales,
              locale: context.locale,
              debugShowCheckedModeBanner: false,
              title: 'AnwerShop',
              theme: ThemeData(
                useMaterial3: true,
                colorScheme: scheme,
                scaffoldBackgroundColor: Colors.white,
                dialogBackgroundColor: Colors.white,
                appBarTheme: const AppBarTheme(
                  elevation: 0,
                ),
                unselectedWidgetColor: scheme.primary,
              ),
              onGenerateRoute: (settings) => generateRoute(settings),
              home: const SplashScreen(),
            ),
          );
        },
      ),
    );
  }
}
