import 'package:bomjour/app_module/bottom_tabs/profile/component/profile_component.dart';
import 'package:bomjour/utils/app_constants/localization.dart';
import 'package:bomjour/utils/app_themes/app_colors.dart';
import 'package:bomjour/utils/dark_theme_provider/dark_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:ui' as ui;

class AppearanceView extends StatefulWidget {
   AppearanceView({super.key});

  @override
  State<AppearanceView> createState() => _AppearanceViewState();
}

class _AppearanceViewState extends State<AppearanceView> {
  String selected="";

  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<ThemeLocalizationProvider>(context);
    return Directionality(
        textDirection:     themeChange.locale.languageCode  =="en"? ui.TextDirection.ltr: ui.TextDirection.rtl,
        child: Scaffold(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          body: Column(
            children: [
              appBarProfile(context: context),
              SizedBox(height: 25,),
              appearanceWidget(
                  onTap:

                      (){
                    themeChange.setdarkTheme(false);
                    setState(() {
                      selected="default";

                    });
                  },
                  context: context,
                  title: AppLocalizations.of(context).defaultModel,
                  subtitle:AppLocalizations.of(context).defTitle,
                  image: "assets/icons/setting.svg",
                  selectImage:
                  selected=="default"?
                  "assets/icons/fill.svg": "assets/icons/unFill.svg"
              ),
              SizedBox(height: 20),
              Divider(color: AppLightColors.border_color,),
              SizedBox(height: 20),
              appearanceWidget(
                  onTap: (){

                    setState(() {
                      selected="";
                    });
                    themeChange.setdarkTheme(false);
                  },
                  context: context,
                  title: AppLocalizations.of(context).lightMode,
                  subtitle: AppLocalizations.of(context).lightTitle,
                  image: "assets/icons/light.svg",
                  selectImage:
                  selected=="default"?"assets/icons/unFill.svg":
                  themeChange.darkTheme==false?

                  "assets/icons/fill.svg": "assets/icons/unFill.svg"
              ),
              SizedBox(height: 20),
              Divider(color: AppLightColors.border_color,),
              SizedBox(height: 20),
              appearanceWidget(
                  onTap: (){
                    setState(() {
                      selected="";
                    });
                    themeChange.setdarkTheme(true);
                  },
                  context: context,
                  title:AppLocalizations.of(context).darkMode,
                  subtitle:AppLocalizations.of(context).darkTitle,
                  image: "assets/icons/dark.svg",
                  selectImage:
                  themeChange.darkTheme==true?
                  "assets/icons/fill.svg": "assets/icons/unFill.svg"
              ),
            ],
          ),
        ));
  }
}


