import 'package:bomjour/app_module/country_selection/controller/country_select_controller.dart';
import 'package:bomjour/app_module/filter_view/component/select_date.dart';
import 'package:bomjour/app_module/filter_view/component/select_occassion.dart';
import 'package:bomjour/app_module/filter_view/controller/filter_controller.dart';
import 'package:bomjour/utils/app_common_widgets/app_button.dart';
import 'package:bomjour/utils/app_common_widgets/app_text.dart';
import 'package:bomjour/utils/app_common_widgets/app_text_field.dart';
import 'package:bomjour/utils/app_constants/app_config.dart';
import 'package:bomjour/utils/app_constants/app_images.dart';
import 'package:bomjour/utils/app_constants/localization.dart';
import 'package:bomjour/utils/app_padding/app_paddings.dart';
import 'package:bomjour/utils/app_themes/app_colors.dart';
import 'package:bomjour/utils/dark_theme_provider/dark_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:flutter_svg/svg.dart';
import 'dart:ui' as ui;

class FilterView extends StatefulWidget {
  FilterView({super.key});

  @override
  State<FilterView> createState() => _FilterViewState();
}

class _FilterViewState extends State<FilterView> {
  var occController = TextEditingController();
  String selectGift = "";
  String selectLoc = "";
  String selectBudget = "";

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_){

      Provider.of<FilterController>(context, listen: false).getAllSpecial();
      Provider.of<FilterController>(context, listen: false).getAllOccasion();
      Provider.of<CountrySelectionController>(context, listen: false).getTopCityModelData();
      ;

    });



  }

  @override
  Widget build(BuildContext context) {
    final isKeyBoard = MediaQuery.of(context).viewInsets.bottom != 0;
    var localization = AppLocalizations.of(context);
    final themeChange = Provider.of<ThemeLocalizationProvider>(context);
    final filterController = Provider.of<FilterController>(context);
    final countryController = Provider.of<CountrySelectionController>(context);
    return Directionality(
      textDirection: themeChange.locale.languageCode == "en"
          ? ui.TextDirection.ltr
          : ui.TextDirection.rtl,
      child: Scaffold(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          body: Column(
            children: [
              SizedBox(
                height: AppConfig(context).height * 0.06,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: AppConfig(context).width * 0.04),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                    AppText(
                      text: localization.filters,
                      size: 16,
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.w600,
                    ),
                    Container()
                  ],
                ),
              ),
              SizedBox(
                height: AppConfig(context).height * 0.005,
              ),
              Divider(
                color: Theme.of(context).disabledColor.withOpacity(0.4),
              ),
              SizedBox(
                height: AppConfig(context).height * 0.005,
              ),
              Expanded(
                  child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: AppConfig(context).width * 0.04),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: AppConfig(context).height * 0.01,
                      ),
                      AppText(
                        text: localization.byPref,
                        size: 20,
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.w500,
                      ),
                      SizedBox(
                        height: AppConfig(context).height * 0.015,
                      ),
                      Container(
                        height: 40,
                        child: ListView.builder(
                            shrinkWrap: true,
                            primary: false,
                            scrollDirection: Axis.horizontal,
                            padding: EdgeInsets.zero,
                            itemCount: filterController.specializeList.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Padding(
                                  padding:
                                      themeChange.locale.languageCode == "en"
                                          ? AppPaddings.onlyPadding(
                                              left: index == 0
                                                  ? 0
                                                  : AppConfig(context).width *
                                                      0.025,
                                            )
                                          : AppPaddings.onlyPadding(
                                              right: index == 0
                                                  ? 0
                                                  : AppConfig(context).width *
                                                      0.025,
                                            ),
                                  child: GestureDetector(
                                    onTap: () {
                                      filterController.updateSpecial(
                                          filterController
                                              .specializeList[index].id
                                              .toString());
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(100),
                                          color:
                                              filterController.selectSpecial ==
                                                      filterController
                                                          .specializeList[index]
                                                          .id
                                                          .toString()
                                                  ? AppLightColors.primary_color
                                                  : Colors.transparent,
                                          border: Border.all(
                                              color: filterController
                                                          .selectSpecial ==
                                                      filterController
                                                          .specializeList[index]
                                                          .id
                                                          .toString()
                                                  ? AppLightColors.primary_color
                                                  : themeChange.darkTheme
                                                      ? AppLightColors
                                                          .black_color
                                                      : AppLightColors
                                                          .border_color)),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 16),
                                        child: Center(
                                          child: AppText(
                                            text: themeChange
                                                        .locale.languageCode ==
                                                    "en"
                                                ? filterController
                                                    .specializeList[index].name
                                                    .toString()
                                                : filterController
                                                    .specializeList[index]
                                                    .ar_name
                                                    .toString(),
                                            size: 14,
                                            fontWeight: FontWeight.w500,
                                            color: filterController
                                                        .selectSpecial ==
                                                    filterController
                                                        .specializeList[index]
                                                        .id
                                                        .toString()
                                                ? AppLightColors.white_color
                                                : Theme.of(context)
                                                    .primaryColor,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ));
                            }),
                      ),
                      SizedBox(
                        height: 32,
                      ),
                      AppText(
                        text: localization.byLoc,
                        size: 20,
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.w500,
                      ),
                      SizedBox(
                        height: AppConfig(context).height * 0.015,
                      ),
                      Container(
                        height: 40,
                        child: ListView.builder(
                            shrinkWrap: true,
                            primary: false,
                            scrollDirection: Axis.horizontal,
                            padding: EdgeInsets.zero,
                            itemCount: countryController.topCityList.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Padding(
                                  padding:
                                      themeChange.locale.languageCode == "en"
                                          ? AppPaddings.onlyPadding(
                                              left: index == 0
                                                  ? 0
                                                  : AppConfig(context).width *
                                                      0.025,
                                            )
                                          : AppPaddings.onlyPadding(
                                              right: index == 0
                                                  ? 0
                                                  : AppConfig(context).width *
                                                      0.025,
                                            ),
                                  child: GestureDetector(
                                    onTap: () {
                                      filterController.updateCity(
                                          countryController.topCityList[index].name
                                              .toString());
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(100),
                                          color: filterController.selectCity ==
                                              countryController.topCityList[index].name
                                                      .toString()
                                              ? AppLightColors.primary_color
                                              : Colors.transparent,
                                          border: Border.all(
                                              color: filterController
                                                          .selectCity ==
                                                  countryController.topCityList[index].name
                                                          .toString()
                                                  ? AppLightColors.primary_color
                                                  : themeChange.darkTheme
                                                      ? AppLightColors
                                                          .black_color
                                                      : AppLightColors
                                                          .border_color)),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 16),
                                        child: Center(
                                          child: AppText(
                                            text: themeChange
                                                        .locale.languageCode ==
                                                    "en"
                                                ? countryController.topCityList[index].name
                                                    .toString()
                                                : countryController.topCityList[index].arName
                                                    .toString(),
                                            size: 14,
                                            fontWeight: FontWeight.w500,
                                            color:
                                                filterController.selectCity ==
                                                    countryController.topCityList[index]
                                                            .name
                                                            .toString()
                                                    ? Colors.white
                                                    : Theme.of(context)
                                                        .primaryColor,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ));
                            }),
                      ),
                      SizedBox(
                        height: 32,
                      ),
                      AppText(
                        text: localization.byOcc,
                        size: 20,
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.w500,
                      ),
                      SizedBox(
                        height: AppConfig(context).height * 0.015,
                      ),
                      GestureDetector(
                        onTap: () {
                          showModalBottomSheet(
                              backgroundColor: Colors.transparent,
                              isScrollControlled: true,
                              isDismissible: true,
                              context: context,
                              builder: (context) => SelectOccasions());
                        },
                        child: Container(
                            height: 56,
                            decoration: BoxDecoration(
                                color: themeChange.darkTheme
                                    ? AppLightColors.textField_back_dark
                                    : AppLightColors.textField_back_color,
                                border: Border.all(
                                    color: themeChange.darkTheme
                                        ? AppLightColors.black_color
                                        : Colors.transparent),
                                borderRadius: BorderRadius.circular(10)),
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  AppText(
                                    text: filterController.selectOccasionName ==
                                            ""
                                        ? localization.selectOcc
                                        : filterController.selectOccasionName
                                            .toString(),
                                    size: 16,
                                    fontWeight:
                                    filterController.selectOccasionName.isNotEmpty?
                                    FontWeight.w500:FontWeight.w400,
                                    color: filterController.selectOccasionName.isNotEmpty?
                                    Theme.of(context).primaryColor
                                        : AppLightColors.label_color,
                                  ),
                                  SvgPicture.asset(
                                    themeChange.locale.languageCode == "en"
                                        ? "assets/icons/next.svg"
                                        : "assets/icons/left.svg",
                                    color: themeChange.darkTheme
                                        ? AppLightColors.white_color
                                        : AppLightColors.label_color,
                                  )
                                ],
                              ),
                            )),
                      ),
                      SizedBox(
                        height: 32,
                      ),
                      AppText(
                        text: localization.byDate,
                        size: 20,
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.w500,
                      ),
                      SizedBox(
                        height: AppConfig(context).height * 0.015,
                      ),
                      GestureDetector(
                        onTap: () {
                          showModalBottomSheet(
                              backgroundColor: Colors.transparent,
                              isScrollControlled: true,
                              isDismissible: true,
                              context: context,
                              builder: (context) => SelectDatePicker());
                        },
                        child: Container(
                            height: 56,
                            decoration: BoxDecoration(
                                color: themeChange.darkTheme
                                    ? AppLightColors.textField_back_dark
                                    : AppLightColors.textField_back_color,
                                border: Border.all(
                                    color: themeChange.darkTheme
                                        ? AppLightColors.black_color
                                        : Colors.transparent),
                                borderRadius: BorderRadius.circular(10)),
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  AppText(
                                    text:
                                    filterController.selectDate ==
                                        ""
                                        ?
                                    localization.selectDate:filterController.selectDate.toString(),
                                    size: 16,
                                    fontWeight:
                                    filterController.selectDate.isNotEmpty?
                                    FontWeight.w500:FontWeight.w400,
                                    color: filterController.selectDate.isNotEmpty?
                                         Theme.of(context).primaryColor
                                        : AppLightColors.label_color,
                                  ),
                                  SvgPicture.asset(
                                    "assets/icons/cal.svg",
                                    color: themeChange.darkTheme
                                        ? AppLightColors.white_color
                                        : AppLightColors.label_color,
                                  )
                                ],
                              ),
                            )),
                      ),
                      SizedBox(
                        height: 32,
                      ),
                      AppText(
                        text: localization.byBudg,
                        size: 20,
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.w500,
                      ),
                      SizedBox(
                        height: AppConfig(context).height * 0.015,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: appField(
                                context: context,
                              listInputParam: [
                                FilteringTextInputFormatter.deny(
                                  RegExp(r'^0'),
                                ),
                                FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),

                              ],
                                hint:"1 AED",
                                border:
                                themeChange.darkTheme
                                    ? AppLightColors.black_color
                                    :
                                AppLightColors.border_color,
                                textInputType: TextInputType.phone,

                                borderRadius: BorderRadius.circular(100),
                                controller: filterController.fromPrice,



                                isPrefix: false,

                                fillColor:
                                themeChange.darkTheme?
                                AppLightColors.textField_back_dark: AppLightColors.white_color,
                                textInputAction: TextInputAction.done,

                            ),
                          ),
                          SizedBox(width: 20,),
                          Expanded(
                            child: appField(
                              context: context,

                              hint:"10000.0 AED",
                              listInputParam: [
                                FilteringTextInputFormatter.deny(
                                  RegExp(r'^0'),
                                ),
                                FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),

                              ],

                              border:
                              themeChange.darkTheme
                                  ? AppLightColors.black_color
                                  :
                              AppLightColors.border_color,
                              textInputType: TextInputType.phone,
                              onChange: (val){

                              },


                              borderRadius: BorderRadius.circular(100),



                              isPrefix: false,
                              controller: filterController.toPrice,

                              fillColor:
                              themeChange.darkTheme?
                              AppLightColors.textField_back_dark: AppLightColors.white_color,
                              textInputAction: TextInputAction.done,

                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20,),
                    ],
                  ),
                ),
              )),
              isKeyBoard?SizedBox.shrink():
              Padding(
                padding: EdgeInsets.only(
                    bottom: 20,
                    left: AppConfig(context).width * 0.04,
                    right: AppConfig(context).width * 0.04),
                child: AppButton(
                    buttonName: localization.searchOcc,
                    onTap: () {
                      filterController.filterList.clear();
                      filterController.getFilterData(
                          catIId: filterController.selectCat,
                          productName: filterController.selectProduct,
                          fromPrice: filterController.fromPrice.text,
                          toPrice: filterController.toPrice.text,
                          occasionId: filterController.selectOccasionId,
                          specialId: filterController.selectSpecial,
                          countryName: filterController.selectCity,
                          date: filterController.selectDate);
                      Navigator.pop(context);
                    }),
              ),
            ],
          )),
    );
  }
}
