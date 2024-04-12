
import 'package:bomjour/utils/app_common_widgets/app_button.dart';
import 'package:bomjour/utils/app_common_widgets/app_text.dart';
import 'package:bomjour/utils/app_constants/app_images.dart';
import 'package:bomjour/utils/app_themes/app_colors.dart';
import 'package:bomjour/utils/dark_theme_provider/dark_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


import 'package:provider/provider.dart';
import 'dart:ui' as ui;
class CreateOccasionPopup extends StatelessWidget {
  const CreateOccasionPopup({super.key});

  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<ThemeLocalizationProvider>(context);

    return  Directionality(
      textDirection:     themeChange.locale.languageCode  =="en"? ui.TextDirection.ltr: ui.TextDirection.rtl,
      child: DraggableScrollableSheet(
        initialChildSize:0.31,
        minChildSize: 0.31,
        maxChildSize:0.31,
        builder: (_, controller) => Container(
          decoration: BoxDecoration(
            color: AppLightColors.otpLightColor,
          ),
          child: Padding(
            padding:  EdgeInsets.only(top: 12,left: 12,right: 12,bottom: 12),
            child: Column(
              children: [

                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: SvgPicture.asset(
                        AppImages.BACK,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),

                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 45),
                  child: Center(
                    child: AppText(
                      text: "Do you want to create an Occasions for your Husband",
                      size: 18,
                      height: 1.6,
                      textAlign: TextAlign.center,
                      color: Theme.of(context).primaryColor,

                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                SizedBox(height: 8,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 2),
                  child: Center(
                    child: AppText(
                      text: "Plan surprise celebrations. Collaborate on gifts, share messages, and make any distance feel closer.",
                      size: 14,
                      textAlign: TextAlign.center,
                      color: AppLightColors.light_black_color,

                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                SizedBox(height: 16,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: AppButton(
                      buttonWidth: double.infinity,
                      borderColor: AppLightColors.primary_color,
                      buttonColor: AppLightColors.white_color,

                      borderWidth: 1,
                      textColor: AppLightColors.primary_color,
                      buttonRadius: BorderRadius.circular(30),
                      buttonName: "Let’s Create an Occasion", onTap: (){}),
                )



              ],
            ),
          ),
        ),
      ),
    );


  }
}



