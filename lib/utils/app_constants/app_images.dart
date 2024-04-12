// ignore_for_file: constant_identifier_names



import 'package:bomjour/utils/app_common_widgets/app_text.dart';
import 'package:bomjour/utils/app_constants/app_config.dart';
import 'package:bomjour/utils/app_themes/app_colors.dart';
import 'package:flutter/material.dart';

class AppImages {
  //  Images

  ///onboarding
  static const String logo_image = 'assets/images/logo.svg';
  static const String dark_logo_image = 'assets/images/dark_logo.svg';
  static const String onboarding_1 = 'assets/images/onboarding1.png';
  static const String onboarding_2 = 'assets/images/onboarding2.png';
  static const String onboarding_3 = 'assets/images/onboarding3.png';


  static const String heart = 'assets/icons/heart.svg';
  static const String fb = 'assets/icons/fb.svg';
  static const String google = 'assets/icons/google.svg';
  static const String apple = 'assets/icons/apple.svg';
  static const String next = 'assets/icons/next_icon.svg';
  static const String border = 'assets/icons/border.svg';
  static const String search_icon = 'assets/icons/search.svg';
  static const String backIcon= 'assets/icons/back.svg';
  static const String warning= 'assets/icons/warning.svg';
  static const String fill_warn= 'assets/icons/fill_warn.svg';


  static const String home= 'assets/icons/home.svg';
  static const String explore= 'assets/icons/searchs.svg';
  static const String oc= 'assets/icons/oc.svg';
  static const String menu= 'assets/icons/menu.svg';


  static const String cart= 'assets/icons/cart.svg';
  static const String bell= 'assets/icons/bell.svg';
  static const String down= 'assets/icons/down.svg';
  static const String disLike= 'assets/icons/dislike.svg';
  static const String BACK= "assets/icons/cross.svg";
  static const String BACK1= "assets/icons/back1.svg";
  static const String filter= "assets/icons/filter.svg";

}







Widget bottomSheet({onCamera ,onGallery,required BuildContext context}) {
  return DraggableScrollableSheet(
    initialChildSize: 0.25,
    minChildSize: 0.25,
    maxChildSize: 0.25,
    builder: (_, controller) => Container(
      decoration: BoxDecoration(
        color: AppLightColors.white_color,
        borderRadius:  BorderRadius.only(
            topLeft: Radius.circular(10), topRight: Radius.circular(10)),
      ),
      child: Padding(
        padding:  EdgeInsets.only(top: 10),
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                InkWell(
                    onTap: onGallery,
                    child: iconCreation(
                        Icons.insert_photo, AppLightColors.primary_color, "Gallery")),
                SizedBox(width: AppConfig(context).width*0.2,),
                InkWell(
                    onTap: onCamera,
                    child: iconCreation(
                        Icons.camera_alt,AppLightColors.primary_color , "Camera")),
              ],
            ),
          ],
        ),
      ),
    ),
  );


}

Widget iconCreation(IconData icons, Color color, String text) {
  return Column(
    children: [
      CircleAvatar(
        radius: 24,
        backgroundColor: color,
        child: Icon(
          icons,
          // semanticLabel: "Help",
          size: 22,
          color: Colors.white,
        ),
      ),
      const SizedBox(
        height: 10,
      ),
      AppText(
          text: text,
          color: AppLightColors.primary_color,
          fontWeight: FontWeight.w500,
          size: 15)
    ],
  );
}

