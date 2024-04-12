import 'package:bomjour/app_module/bottom_tabs/profile/component/profile_component.dart';
import 'package:bomjour/utils/app_constants/localization.dart';
import 'package:bomjour/utils/app_themes/app_colors.dart';
import 'package:bomjour/utils/dark_theme_provider/dark_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:ui' as ui;

class LanguageView extends StatelessWidget {
  const LanguageView({super.key});

  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<ThemeLocalizationProvider>(context);
    return Directionality(
        textDirection:     themeChange.locale.languageCode  =="en"? ui.TextDirection.ltr: ui.TextDirection.rtl,
        child: Scaffold(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          body: Column(
            children: [
              appBarProfile(context: context,
                  title: AppLocalizations.of(context).language
              ),
              SizedBox(height: 25,),
              appearanceWidget(
                  onTap:
                  themeChange.locale.languageCode=="en"?(){}:
                      (){
                    themeChange.setLanguage(
                      themeChange.locale.languageCode == 'ar' ? 'en' : 'ar',
                    );
                  },
                  context: context,
                  title: AppLocalizations.of(context).english,
                  subtitle: AppLocalizations.of(context).engTitle,
                  image: "assets/icons/english.svg",
                  selectImage:
                  themeChange.locale.languageCode  =="en"?
                  "assets/icons/fill.svg": "assets/icons/unFill.svg"
              ),
              SizedBox(height: 20),
              Divider(color: AppLightColors.border_color,),
              SizedBox(height: 20),
              appearanceWidget(
                  onTap:
                  themeChange.locale.languageCode=="ar"?(){}:
                      (){
                    themeChange.setLanguage(
                      themeChange.locale.languageCode == 'ar' ? 'en' : 'ar',
                    );
                  },
                  context: context,
                  title: AppLocalizations.of(context).arabic,
                  subtitle: AppLocalizations.of(context).arabicTitle,
                  image: "assets/icons/arabic.svg",
                  selectImage:
                  themeChange.locale.languageCode=="ar"?
                  "assets/icons/fill.svg": "assets/icons/unFill.svg"
              ),

            ],
          ),
        ));
  }
}



