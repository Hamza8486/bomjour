import 'dart:async';
import 'dart:developer';

import 'package:bomjour/app_module/bottom_tabs/dashboard/controller/dashboard_controller.dart';
import 'package:bomjour/app_module/country_selection/controller/country_select_controller.dart';
import 'package:bomjour/app_module/home/view/home_view.dart';
import 'package:bomjour/app_module/on_boarding/controller/onboarding_controller.dart';
import 'package:bomjour/app_module/on_boarding/view/onboarding_view.dart';
import 'package:bomjour/utils/app_common_widgets/helper_function.dart';
import 'package:bomjour/utils/app_constants/app_images.dart';
import 'package:bomjour/utils/dark_theme_provider/dark_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';


class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  String userTokens = "";


  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await  Provider.of<OnBoardingController>(context, listen: false).fetchDataIfNeeded();
      await  Provider.of<CountrySelectionController>(context, listen: false).fetchData();
      await  Provider.of<DashboardController>(context, listen: false).fetchData();
    });
    HelperFunctions.getFromPreference("email").then((value) {
      setState(() {
        userTokens = value;
      });

      log(userTokens);
    });
    moveToNext();

  }

  void moveToNext() {
    Timer(const Duration(seconds: 3), () {
      if (userTokens !="") {

        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => HomeView()),
              (route) => false,
        );
      }


      else {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => OnBoardingView()),
        );

      }
    });
  }



  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<ThemeLocalizationProvider>(context);

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: WillPopScope(
        onWillPop: () async {
          return false;
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
                child: SvgPicture.asset(
                  themeChange.darkTheme
                      ? AppImages.dark_logo_image
                      : AppImages.logo_image,
                ))
          ],
        ),
      ),
    );
  }
}
