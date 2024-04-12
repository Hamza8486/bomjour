import 'package:bomjour/app_module/authentication/login_type/login_type_view.dart';
import 'package:bomjour/app_module/country_selection/controller/country_select_controller.dart';
import 'package:bomjour/utils/app_common_widgets/app_text.dart';
import 'package:bomjour/utils/app_common_widgets/app_text_field.dart';
import 'package:bomjour/utils/app_constants/app_config.dart';
import 'package:bomjour/utils/app_constants/app_images.dart';
import 'package:bomjour/utils/app_constants/localization.dart';
import 'package:bomjour/utils/app_themes/app_colors.dart';
import 'package:bomjour/utils/dark_theme_provider/dark_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'dart:ui' as ui;


class SearchCity extends StatelessWidget {
   SearchCity({super.key,this.name});
  var name;

  @override
  Widget build(BuildContext context) {
    final isKeyBoard = MediaQuery.of(context).viewInsets.bottom != 0;
    final themeChange = Provider.of<ThemeLocalizationProvider>(context);
    final countrySelectionController =
    Provider.of<CountrySelectionController>(context);
    return Directionality(
      textDirection: themeChange.locale.languageCode == "en"
          ? ui.TextDirection.ltr
          : ui.TextDirection.rtl,
      child: DraggableScrollableSheet(
        initialChildSize: isKeyBoard ? 0.8 : 0.5,
        minChildSize: isKeyBoard ? 0.8 : 0.5,
        maxChildSize: isKeyBoard ? 0.8 : 0.5,
        builder: (_, controller) => Container(
          decoration: BoxDecoration(
            color: Theme.of(context).scaffoldBackgroundColor,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10)),
          ),
          child: Padding(
            padding: EdgeInsets.only(top: 10),
            child: Column(
              children: [
                SizedBox(
                  height: AppConfig(context).height * 0.01,
                ),
                SvgPicture.asset(AppImages.border),
                SizedBox(
                  height: AppConfig(context).height * 0.035,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: AppText(
                    text:
                    "${AppLocalizations.of(context).search_city_of}\t$name",
                    size: 18,
                    color: Theme.of(context).primaryColor,
                    textAlign: themeChange.locale.languageCode == "en"
                        ? TextAlign.left
                        : TextAlign.right,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(
                  height: 22,
                ),
                Container(
                  width: double.infinity,
                  height: 76,
                  color: themeChange.darkTheme
                      ? AppLightColors.textField_back_dark
                      : AppLightColors.profileBackColor,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Center(
                      child: appField(
                          context: context,
                          hint: AppLocalizations.of(context).search_city,
                          border: AppLightColors.border_color,
                          borderRadius: BorderRadius.circular(100),
                          onChange: (val){
                            countrySelectionController.updateSearchQuery(val.toString());
                          },
                          isPrefix: true,
                          fillColor: themeChange.darkTheme
                              ? AppLightColors.textField_back_dark
                              : AppLightColors.white_color,
                          textInputAction: TextInputAction.done,

                          child1: Padding(
                            padding: const EdgeInsets.only(
                                left: 16, right: 16, bottom: 3, top: 5),
                            child: SvgPicture.asset(
                              AppImages.search_icon,
                              color: AppLightColors.border_color,
                            ),
                          )),
                    ),
                  ),
                ),
                SizedBox(
                  height: AppConfig(context).height * 0.03,
                ),
                Expanded(
                  child:
                  countrySelectionController.cityIdLoader
                      ? Center(
                    child: CircularProgressIndicator(
                      color: AppLightColors.primary_color,
                    ),
                  )
                      : countrySelectionController.getCityIdList.isEmpty
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
                      itemCount: countrySelectionController.getCityIdList.length,
                      shrinkWrap: true,
                      primary: false,
                      padding: EdgeInsets.zero,
                      itemBuilder:
                          (BuildContext context, int index) {
                            bool matchesSearch = countrySelectionController.getCityIdList[index].name.toString().toLowerCase().contains(countrySelectionController.searchQuery.toString().toLowerCase());
                        return
                          matchesSearch?
                          GestureDetector(
                          onTap: () {
                            countrySelectionController.updateCityId(countrySelectionController.getCityIdList[index].id.toString());
                            Navigator.pop(context);
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => LoginTypeView()),
                            );

                          },
                          child: Container(
                            margin: EdgeInsets.symmetric(
                                horizontal: 16),
                            color: Colors.transparent,
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment
                                      .spaceBetween,
                                  children: [
                                    AppText(
                                      text: themeChange.locale
                                          .languageCode ==
                                          "en"
                                          ? countrySelectionController.getCityIdList[index].name.toString()
                                          : countrySelectionController.getCityIdList[index]
                                          .arName.toString(),
                                      size: 16,
                                      color:
                                      countrySelectionController.selectCityId==countrySelectionController.getCityIdList[index].id.toString()?
                                          AppLightColors.primary_color:
                                      Theme.of(context)
                                          .primaryColor,
                                      textAlign: themeChange.locale
                                          .languageCode ==
                                          "en"
                                          ? TextAlign.left
                                          : TextAlign.right,
                                      fontWeight: FontWeight.w500,
                                    ),
                                    countrySelectionController.selectCityId==countrySelectionController.getCityIdList[index].id.toString()?
                                    Icon(
                                      Icons.check,
                                      size: 16,
                                      color: AppLightColors
                                          .primary_color,
                                    ):SizedBox.shrink()

                                  ],
                                ),
                                SizedBox(
                                  height:
                                  AppConfig(context).height *
                                      0.013,
                                ),
                                Divider(
                                  color: AppLightColors.border_color
                                      .withOpacity(0.5),
                                ),
                                SizedBox(
                                  height:
                                  AppConfig(context).height *
                                      0.013,
                                ),
                              ],
                            ),
                          ),
                        ):
                          SizedBox.shrink()
                        ;
                      }),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}


