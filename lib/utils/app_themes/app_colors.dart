// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

class AppLightColors {
  static Color white_color = const Color(0xffFFFFFF);
  static Color light_color = const Color(0xffFFF3F5);
  static Color light__primary_color = const Color(0xffFFB0B6);
  static Color black_color = const Color(0xff2D3748);
  static Color light_black_color = const Color(0xff707070);
  static Color border_color = const Color(0xffA0AEC0);
  static Color label_color = const Color(0xff718096);
  static Color textField_back_color = const Color(0xffF1F2F6);
  static Color item_back_color = const Color(0xffF8F8F8);
  static Color dont_have_color = const Color(0xff9CA3AF);
  static Color grey_color = Colors.grey;
  static Color primary_color = const Color(0xFFF24646);
  static Color error_message_dark = const Color(0xfffeebec);
  static Color textField_back_dark = const Color(0xff171923);
  static Color textField_fill_dark = const Color(0xff3C3E46);
  static Color blue_color = const Color(0xff1565C0);
  static Color blue_light_colors = const Color(0xff78AAF4);
  static Color blue_light_color = const Color(0xffE3F2FD);
  static Color bottom_dark_back = const Color(0xff1A202C);
  static Color orangeColor = const Color(0xffDC8B0E);
  static Color UnRatedColor = const Color(0xffd8e1ee);
  static Color textColorCreated = const Color(0xff5A6981);
  static Color profileBackColor = const Color(0xffF7FAFC);
  static Color otpLightColor = const Color(0xffE2E8F0);
  static Color greenColor = const Color(0xff38813D);
  static Color dividerColor = const Color(0xffCBD5E0);
  static Color rewardBoxColor = const Color(0xffEDF2F7);
  static Color greyColorWish = const Color(0xff4A5568);
  static Color profileTabColor = const Color(0xff6F7F95);
  static Color transparent_color = Colors.transparent;


}



class Styles {

  static ThemeData themeData(bool isDarkTheme, BuildContext context) {


    return ThemeData(
      primarySwatch: Colors.red,

      primaryColor: isDarkTheme ? Color(0xffFFFFFF)  : Color(0xff2D3748) ,
      highlightColor: isDarkTheme ?Color(0xffFFFFFF) :Color(0xff2D3748) ,
      disabledColor:isDarkTheme ?Color(0xffA0AEC0) :Color(0xff707070) ,
      scaffoldBackgroundColor: isDarkTheme ? Color(0xff171923) : Colors.white,

      indicatorColor: isDarkTheme ? Color(0xff0E1D36) : Color(0xffCBDCF8),


      hintColor: isDarkTheme ? Color(0xff280C0B) : Color(0xffEECED3),


      hoverColor: isDarkTheme ? Color(0xff3A3A3B) : Color(0xff4285F4),

      focusColor: isDarkTheme ? Color(0xff0B2512) : Color(0xffA8DAB5),


      cardColor: isDarkTheme ? Color(0xFF151515) : Colors.white,
      canvasColor: isDarkTheme ? Colors.black : Colors.grey[50],
    //brightness: isDarkTheme ? Brightness.dark : Brightness.light,
      // buttonTheme: Theme.of(context).buttonTheme.copyWith(
      //     colorScheme: isDarkTheme ? ColorScheme.dark() : ColorScheme.light()),
      // appBarTheme: AppBarTheme(
      //   elevation: 0.0,
      // ),
    );

  }
}
