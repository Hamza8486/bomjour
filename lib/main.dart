import 'dart:io';
import 'package:bomjour/app_module/address/controller/address_controller.dart';
import 'package:bomjour/app_module/authentication/controller/auth_controller.dart';
import 'package:bomjour/app_module/bottom_tabs/add_occasions/controller/add_occasion_controller.dart';
import 'package:bomjour/app_module/bottom_tabs/dashboard/controller/dashboard_controller.dart';
import 'package:bomjour/app_module/bottom_tabs/explore/controller/explore_controller.dart';
import 'package:bomjour/app_module/bottom_tabs/occcasions/controller/occasions_controller.dart';
import 'package:bomjour/app_module/bottom_tabs/profile/component/wishlist/controller/wishlist_controller.dart';
import 'package:bomjour/app_module/cart_view/cart_controller/cart_controller.dart';
import 'package:bomjour/app_module/country_selection/controller/country_select_controller.dart';
import 'package:bomjour/app_module/filter_view/controller/filter_controller.dart';
import 'package:bomjour/app_module/on_boarding/controller/onboarding_controller.dart';
import 'package:bomjour/app_module/order_history/controller/order_controller.dart';
import 'package:bomjour/app_module/payment/controller/card_controller.dart';
import 'package:bomjour/app_module/prefrence/controller/prefrence_controller.dart';
import 'package:bomjour/app_module/product_detail_page/controller/prooduct_detail_controller.dart';
import 'package:bomjour/app_module/splash_view/splash_view.dart';
import 'package:bomjour/services/notification/notifications_services.dart';
import 'package:bomjour/utils/app_themes/app_colors.dart';
import 'package:bomjour/utils/dark_theme_provider/dark_theme.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'app_module/home/controller/home_controller.dart';
import 'services/FCM/fcm_configuration.dart';
import 'utils/app_constants/localization.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: FirebaseOptions(
        apiKey: 'AIzaSyB7s-m6WJMpf8TopRyhpWFzPwnZE4ynXug',
        appId: '1:863960907293:android:320e5bf22acb41acd1d0f4',
        messagingSenderId: '863960907293',
        projectId: 'bomjourconsumer',
      )
  );

  await FirebaseMessaging.instance.getInitialMessage();


  setupFlutterNotifications();
  await NotificationService().init();
  await NotificationService().requestIOSPermissions();

  HttpOverrides.global = MyHttpOverrides();
  Stripe.publishableKey = "pk_test_51O5uo8EEJkrYEEcUKdnreIUKlFbsjqoSWtcivmi36VgK6y6sl9eDPBRd5bjrJs7GQttGEaHxifHvG7LlOExueTt200DvfBy1D7";
  await dotenv.load(fileName: "assets/.env");

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeLocalizationProvider themeChangeProvider = ThemeLocalizationProvider();
  Future<void> getCurrentAppTheme() async {
    await themeChangeProvider
        .setdarkTheme(await themeChangeProvider.darkThemePreference.getTheme());
    String savedLanguage =
        await themeChangeProvider.darkThemePreference.getLanguage() ?? 'en';
    themeChangeProvider.setLanguage(savedLanguage);
  }

  @override
  void initState() {
    super.initState();
    getCurrentAppTheme();
  }



  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => themeChangeProvider),
        ChangeNotifierProvider(create: (_) => OnBoardingController()),
        ChangeNotifierProvider(create: (_) => CountrySelectionController()),
        ChangeNotifierProvider(create: (_) => AuthenticationController()),
        ChangeNotifierProvider(create: (_) => HomeController()),
        ChangeNotifierProvider(create: (_) => DashboardController()),
        ChangeNotifierProvider(create: (_) => ProductDetailController()),
        ChangeNotifierProvider(create: (_) => FilterController()),
        ChangeNotifierProvider(create: (_) => AddressController()),
        ChangeNotifierProvider(create: (_) => WishlistController()),
        ChangeNotifierProvider(create: (_) => CartController()),
        ChangeNotifierProvider(create: (_) => OrderController()),
        ChangeNotifierProvider(create: (_) => ExploreController()),
        ChangeNotifierProvider(create: (_) => OccasionsController()),
        ChangeNotifierProvider(create: (_) => AddOccasionController()),
        ChangeNotifierProvider(create: (_) => PreferenceController()),
        ChangeNotifierProvider(create: (_) => CardController()),
      ],
      child: Consumer<ThemeLocalizationProvider>(
        builder: (BuildContext context, themeValue, _) {
          return MaterialApp(
            title: 'Bomjour',
            localizationsDelegates: [
              AppLocalizationsDelegate(),
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: [
              const Locale('en', ''),
              const Locale('ar', ''),
            ],
            locale: themeValue.locale,
            theme: Styles.themeData(themeValue.darkTheme, context),
            debugShowCheckedModeBanner: false,
            home:  TokenMonitor((val) {
                return SplashView();
              }
              )
          );
        },
      ),
    );
  }
}
class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext? context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}