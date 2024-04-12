import 'package:bomjour/utils/app_common_widgets/app_button.dart';
import 'package:bomjour/utils/app_common_widgets/app_text.dart';
import 'package:bomjour/utils/app_constants/app_config.dart';
import 'package:bomjour/utils/app_constants/localization.dart';
import 'package:bomjour/utils/app_padding/app_paddings.dart';
import 'package:bomjour/utils/app_themes/app_colors.dart';
import 'package:bomjour/utils/dark_theme_provider/dark_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:ui' as ui;


class PasswordResetSuccessfully extends StatelessWidget {
  const PasswordResetSuccessfully({super.key});

  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<ThemeLocalizationProvider>(context);
    return
      Directionality(
        textDirection:     themeChange.locale.languageCode  =="en"? ui.TextDirection.ltr: ui.TextDirection.rtl,
        child: Scaffold(
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,

            body: Padding(
              padding: AppPaddings.onlyHorizontalPadding(
                  padding: AppConfig(context).width * 0.04),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [

                  SizedBox(height:80 ,),
                  Padding(
                    padding:  EdgeInsets.only(left:
                    themeChange.locale.languageCode  =="en"?0:
                    30),
                    child: AppText(
                      text:AppLocalizations.of(context)
                          .passCreated,
                      size: 32,
                      textAlign:
                      themeChange.locale.languageCode  =="en"?
                      TextAlign.left:TextAlign.right,
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height:16 ,),
                  AppText(
                    text:AppLocalizations.of(context)
                        .passDes,
                    size: 16,
                    textAlign:
                    themeChange.locale.languageCode  =="en"?
                    TextAlign.left: TextAlign.right,
                    color:  AppLightColors.textColorCreated,
                    fontWeight: FontWeight.w400,
                  ),
                  SizedBox(height:32 ,),
                  AppButton(
                      buttonName: AppLocalizations.of(context)
                          .signin, onTap: () {

                  })


                ],
              ),
            )

        ),
      );
  }
}


