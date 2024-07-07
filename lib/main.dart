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


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
  runApp(const MyApp());
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
        



      ],
      child: MaterialApp(
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
  }
}
