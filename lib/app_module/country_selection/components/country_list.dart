import 'package:bomjour/app_module/country_selection/components/search_city.dart';
import 'package:bomjour/app_module/country_selection/controller/country_select_controller.dart';
import 'package:bomjour/utils/app_common_widgets/app_text.dart';
import 'package:bomjour/utils/app_constants/app_config.dart';
import 'package:bomjour/utils/app_constants/app_images.dart';
import 'package:bomjour/utils/app_constants/localization.dart';
import 'package:bomjour/utils/app_themes/app_colors.dart';
import 'package:bomjour/utils/dark_theme_provider/dark_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:ui' as ui;
import 'package:provider/provider.dart';

class CountryListView extends StatelessWidget {


  CountryListView({super.key});

  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<ThemeLocalizationProvider>(context);
    final countrySelectionController =
    Provider.of<CountrySelectionController>(context);

    return   Directionality(
        textDirection:     themeChange.locale.languageCode  =="en"? ui.TextDirection.ltr: ui.TextDirection.rtl,
        child:
        countrySelectionController.countryLoader
            ? Center(
          child: CircularProgressIndicator(
            color: AppLightColors.primary_color,
          ),
        )
            : countrySelectionController.countryList.isEmpty
            ? Center(
          child: AppText(
            text: AppLocalizations.of(context).noRecordFound,
            size: 20,
            color: Theme.of(context).primaryColor,
            fontWeight: FontWeight.w500,
          ),
        )
            :
        ListView.builder(
            itemCount: countrySelectionController.countryList.length,
            shrinkWrap: true,
            primary: false,
            padding: EdgeInsets.zero,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: (){
                  countrySelectionController.updateCityId("");
                  countrySelectionController.updateSearchQuery("");
                  countrySelectionController.getCityByIdModel(id:countrySelectionController.countryList[index].id.toString() );
                  showModalBottomSheet(
                      backgroundColor: Colors.transparent,
                      isScrollControlled: true,
                      isDismissible: true,
                      context: context,
                      builder: (context) =>   SearchCity(name:  themeChange.locale.languageCode  =="en"?countrySelectionController.countryList[index].countryName.toString():(countrySelectionController.countryList[index].countryNameAr!="")?countrySelectionController.countryList[index].countryNameAr:countrySelectionController.countryList[index].countryName,));
                },
                child: Container(
                  color: Colors.transparent,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          AppText(text:
                          themeChange.locale.languageCode  =="en"?
                          countrySelectionController.countryList[index].countryName.toString():countrySelectionController.countryList[index].countryNameAr.toString(),
                            size: 16,
                            textAlign: themeChange.locale.languageCode  =="en"?TextAlign.left:TextAlign.right,
                            color:Theme.of(context).primaryColor,
                            fontWeight: FontWeight.w400,
                          ),
                          (themeChange.locale.languageCode  =="en")?SvgPicture.asset(AppImages.next,
                            color:Theme.of(context).primaryColor ,
                          ):Icon(
                            Icons.arrow_forward_ios, color:Theme.of(context).primaryColor ,
                            size: 19,
                          )
                        ],
                      ),
                      SizedBox(height:AppConfig(context).height*0.01 ,),
                      Divider(color: AppLightColors.border_color.withOpacity(0.5),),
                      SizedBox(height:AppConfig(context).height*0.01 ,),

                    ],
                  ),
                ),
              );
            }));
  }
}
