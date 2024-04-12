import 'package:bomjour/app_module/authentication/login/login_view.dart';
import 'package:bomjour/utils/app_common_widgets/app_button.dart';
import 'package:bomjour/utils/app_common_widgets/app_text.dart';
import 'package:bomjour/utils/app_constants/app_config.dart';
import 'package:bomjour/utils/app_constants/app_images.dart';
import 'package:bomjour/utils/app_constants/localization.dart';
import 'package:bomjour/utils/app_padding/app_paddings.dart';
import 'package:bomjour/utils/app_themes/app_colors.dart';
import 'package:bomjour/utils/dark_theme_provider/dark_theme.dart';
import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'dart:ui' as ui;


class AccountCreatedView extends StatelessWidget {
  const AccountCreatedView({super.key});

  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<ThemeLocalizationProvider>(context);
    var localization = AppLocalizations.of(context);
    return
      Directionality(
        textDirection:     themeChange.locale.languageCode  =="en"? ui.TextDirection.ltr: ui.TextDirection.rtl,
        child: WillPopScope(
          onWillPop: () async {
            return false;
          },
          child: Scaffold(
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,

              body: Padding(
                padding: AppPaddings.onlyHorizontalPadding(
                    padding: AppConfig(context).width * 0.04),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(AppImages.heart),
                    SizedBox(height:AppConfig(context).height*0.02 ,),
                    Center(
                      child: AppText(
                        text:AppLocalizations.of(context)
                            .accountHasBeen,
                        size: 29,
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),

                    AppText(
                      text:AppLocalizations.of(context)
                          .createdSucessfully,
                      size: 29,
                      color:  Theme.of(context).primaryColor,
                      fontWeight: FontWeight.w600,
                    ),
                    SizedBox(
                      height: AppConfig(context).height * 0.012,
                    ),
                    Center(
                      child: AppText(
                        text:AppLocalizations.of(context)
                            .des,
                        size: 16,
                        textAlign: TextAlign.center,
                        color:  AppLightColors.textColorCreated,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(
                      height: AppConfig(context).height * 0.04,
                    ),
                    AppButton(
                        buttonName: AppLocalizations.of(context)
                            .explores, onTap: () {
                      Navigator.of(context, rootNavigator: false).pushReplacement(
                        MaterialPageRoute(builder: (context) => LoginView()),
                      );
                    })


                  ],
                ),
              )

          ),
        ),
      );
  }
}




