
import 'package:bomjour/app_module/bottom_tabs/profile/component/profile_component.dart';
import 'package:bomjour/app_module/prefrence/controller/prefrence_controller.dart';
import 'package:bomjour/services/api_manager.dart';
import 'package:bomjour/utils/app_common_widgets/app_button.dart';
import 'package:bomjour/utils/app_common_widgets/app_text.dart';
import 'package:bomjour/utils/app_common_widgets/helper_function.dart';
import 'package:bomjour/utils/app_constants/app_config.dart';
import 'package:bomjour/utils/app_themes/app_colors.dart';
import 'package:bomjour/utils/dark_theme_provider/dark_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'dart:ui' as ui;

import '../../../utils/app_constants/localization.dart';


class PreferenceView extends StatelessWidget {
  const PreferenceView({super.key});

  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<ThemeLocalizationProvider>(context);
    final preferenceController = Provider.of<PreferenceController>(context);

    return Directionality(
      textDirection: themeChange.locale.languageCode == "en"
          ? ui.TextDirection.ltr
          : ui.TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,

          body:  Column(
            children: [
              appBarProfile(
                  context: context,
                  title: AppLocalizations.of(context).prefrence,
                  thickness: 2),
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 0),
                    child:
                   preferenceController.preferenceMyLoader?
                   Column(
                     children: [
                       SizedBox(height: AppConfig(context).height*0.4,),
                       Center(
                         child: SpinKitThreeBounce(
                             size: 25, color: AppLightColors.primary_color),
                       ),
                     ],
                   ):

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        SizedBox(
                          height: 22,
                        ),
                        AppText(
                          text:AppLocalizations.of(context)
                              .select_pref,
                          size: 20,
                          color:  Theme.of(context).primaryColor,
                          fontWeight: FontWeight.w500,
                        ),
                        SizedBox(
                          height: AppConfig(context).height * 0.003,
                        ),
                        AppText(
                          text:AppLocalizations.of(context)
                              .select_min_pref,
                          size: 15,
                          color:  Theme.of(context).disabledColor,
                          fontWeight: FontWeight.w400,
                        ),
                        SizedBox(
                          height: 22,
                        ),

                          Wrap(
                            direction: Axis.horizontal,
                            spacing: 20.0,
                            runSpacing: 15.0,

                            children: List.generate(preferenceController.preferenceList.length, (index) {
                              return GestureDetector(
                                onTap: () {
                                  preferenceController.updateIdsValue(preferenceController.preferenceList[index].id.toString());

                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      color:preferenceController.selectID.contains(preferenceController.preferenceList[index].id.toString())
                                          ? AppLightColors.primary_color
                                          : null,
                                      borderRadius: BorderRadius.circular(40),
                                      border: Border.all(
                                          color:
                                          preferenceController.selectID.contains(preferenceController.preferenceList[index].id.toString())
                                              ? AppLightColors.primary_color
                                              : Theme.of(context).disabledColor)),
                                  padding:EdgeInsets.symmetric(
                                      horizontal: AppConfig(context).width * 0.02, vertical: AppConfig(context).height * 0.01) ,
                                  child: AppText(
                                      text: preferenceController.preferenceList[index].name.toString(),
                                      size: 14,
                                      fontWeight: FontWeight.w500,
                                      color:
                                      preferenceController.selectID.contains(preferenceController.preferenceList[index].id.toString())
                                          ? AppLightColors.white_color
                                          : Theme.of(context).primaryColor),
                                ),
                              );
                            }),
                          ),

                      ],
                    ),
                  ),
                ),
              ),


              Padding(
                padding: EdgeInsets.symmetric(horizontal: AppConfig(context).width * 0.04,vertical: AppConfig(context).height * 0.01),
                child:
                preferenceController.addPrefLoader?
                Center(
                  child: SpinKitThreeBounce(
                      size: 25, color: AppLightColors.primary_color),
                ):

                AppButton(
                    buttonName: AppLocalizations.of(context)
                        .Save, onTap: () {
                      if(preferenceController.selectID.isEmpty){
                        flutterToast(msg: "Add preferences");
                      }
                      else{
                        preferenceController.updateAddPrefLoader(true);
                        ApiManger().addPreferenceView(selectedIds: preferenceController.selectID.map((id) => id.toString()).toList(), context: context);
                      }




                }),
              )
            ],
          ),

        ),
    );
  }
}



