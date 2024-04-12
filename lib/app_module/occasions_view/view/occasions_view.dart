import 'package:bomjour/app_module/bottom_tabs/add_occasions/view/add_occasion.dart';
import 'package:bomjour/app_module/bottom_tabs/dashboard/component/dashboard_component.dart';
import 'package:bomjour/app_module/filter_view/controller/filter_controller.dart';
import 'package:bomjour/utils/app_common_widgets/app_text.dart';
import 'package:bomjour/utils/app_constants/app_config.dart';
import 'package:bomjour/utils/app_constants/app_images.dart';
import 'package:bomjour/utils/app_constants/localization.dart';
import 'package:bomjour/utils/app_themes/app_colors.dart';
import 'package:bomjour/utils/dark_theme_provider/dark_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_svg/svg.dart';
import 'dart:ui' as ui;



class OccasionView extends StatefulWidget {
  OccasionView({super.key});

  @override
  State<OccasionView> createState() => _OccasionViewState();
}

class _OccasionViewState extends State<OccasionView> {
  @override
  Widget build(BuildContext context) {
    var localization = AppLocalizations.of(context);
    final filterController = Provider.of<FilterController>(context);
    final themeChange = Provider.of<ThemeLocalizationProvider>(context);
    return Directionality(
      textDirection:     themeChange.locale.languageCode  =="en"? ui.TextDirection.ltr: ui.TextDirection.rtl,
      child: Scaffold(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,

          body: Padding(
            padding:  EdgeInsets.symmetric(horizontal: AppConfig(context).width*0.04),
            child: Column(

              children: [
                SizedBox(height: AppConfig(context).height*0.06,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: (){
                        Navigator.pop(context);
                      },
                      child: SvgPicture.asset(AppImages.BACK,
                        color:  Theme
                            .of(context)
                            .primaryColor,),
                    ),
                    AppText(text: localization.occ_text,
                      size: 16,
                      color: Theme
                          .of(context)
                          .primaryColor,
                      fontWeight: FontWeight.w600,
                    ),
                    Container()
                  ],
                ),
                SizedBox(height: 12),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height:12),
                        rowData(context: context,
                            padding: 0,
                            title: localization.exp_for
                        ),
                        SizedBox(height: 16,),
                        Container(
                          width: double.infinity,

                          decoration: BoxDecoration(
                              color:
                              themeChange.darkTheme?AppLightColors.textField_back_dark:
                              AppLightColors.blue_light_color,
                              borderRadius: BorderRadius.circular(10),
                            border: Border.all(color:
                            themeChange.darkTheme?
                            AppLightColors.black_color:   AppLightColors.blue_light_color)

                          ),
                          child: Padding(
                            padding:  EdgeInsets.symmetric(vertical: 15,horizontal: 30),
                            child: Column(
                              children: [
                                AppText(text: localization.no_personal,
                                  size: 14,
                                  color:AppLightColors.blue_color,
                                  fontWeight: FontWeight.w600,
                                ),
                                SizedBox(height: AppConfig(context).height*0.008,),
                                AppText(text: localization.plan_surprise,
                                  size: 13,
                                  color:Theme.of(context).disabledColor,
                                  fontWeight: FontWeight.w400,
                                  textAlign: TextAlign.center,
                                ),
                                SizedBox(height: AppConfig(context).height*0.008,),
                                GestureDetector(
                                  onTap: (){
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) =>  AddOccasion()),
                                    );
                                  },
                                  child: AppText(text: localization.add_occ,
                                    size: 14,
                                    color:AppLightColors.primary_color,
                                    fontWeight: FontWeight.w500,
                                    color1: AppLightColors.primary_color,
                                    underLine: TextDecoration.underline,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),

                        SizedBox(height: 32),
                        rowData(context: context,
                            padding: 0,
                            title: localization.exp_occ
                        ),
                        SizedBox(height: 16,),
                        GridView.builder(

                            padding: EdgeInsets.zero,
                            shrinkWrap: true,
                            primary: false,
                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3,
                                childAspectRatio: 110/110,
                                crossAxisSpacing: 16,
                                mainAxisSpacing: 16),
                            itemCount:filterController.occasionList.length,
                            itemBuilder: (BuildContext ctx, index) {
                              return occasionCommonWidget(title:
                              themeChange.locale.languageCode  =="en"?
                              filterController.occasionList[index].name.toString():filterController.occasionList[index].ar_name.toString(),
                                  image: "assets/images/cake1.png"
                              );
                            })
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )

      ),
    );
  }
}
