import 'dart:async';

import 'package:bomjour/app_module/bottom_tabs/dashboard/component/search_result.dart';
import 'package:bomjour/app_module/country_selection/controller/country_select_controller.dart';
import 'package:bomjour/app_module/filter_view/controller/filter_controller.dart';
import 'package:bomjour/utils/app_common_widgets/app_text.dart';
import 'package:bomjour/utils/app_common_widgets/app_text_field.dart';
import 'package:bomjour/utils/app_common_widgets/helper_function.dart';
import 'package:bomjour/utils/app_constants/app_config.dart';
import 'package:bomjour/utils/app_constants/app_images.dart';
import 'package:bomjour/utils/app_constants/localization.dart';
import 'package:bomjour/utils/app_padding/app_paddings.dart';
import 'package:bomjour/utils/app_themes/app_colors.dart';
import 'package:bomjour/utils/dark_theme_provider/dark_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_svg/svg.dart';
import 'dart:ui' as ui;



class SearchView extends StatefulWidget {
  SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  Timer? _debounce;
  String value="";
  TextEditingController query = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var localization = AppLocalizations.of(context);
    final filterController = Provider.of<FilterController>(context);
    final countrySelectionController = Provider.of<CountrySelectionController>(context);
    final themeChange = Provider.of<ThemeLocalizationProvider>(context);
    return Directionality(
      textDirection:     themeChange.locale.languageCode  =="en"? ui.TextDirection.ltr: ui.TextDirection.rtl,
        child: Scaffold(
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,

            body: Column(
              children: [

                Container(width: double.infinity,
                  height: 122,
                  color:
                  themeChange.darkTheme?AppLightColors.textField_back_dark:
                  AppLightColors.textField_back_color,
                  child: Padding(
                    padding: AppPaddings.onlyHorizontalPadding(padding: AppConfig(context).width*0.04),
                    child: Column(
                      children: [
                        SizedBox(height: AppConfig(context).height*0.06,),
                        Row(
                          children: [
                            Expanded(
                              child: appField(
                                  context: context,
                                  controller: query,
                                  hint:localization
                                      .searchGift,
                                  border:
                                  themeChange.darkTheme?AppLightColors.white_color:
                                  AppLightColors.border_color,
                                  borderRadius: BorderRadius.circular(100),



                                  isPrefix: true,
                                  onChange: (val){
                                    if (_debounce != null && _debounce!.isActive) {
                                      _debounce!.cancel();
                                      print("This null data");
                                    }

                                    _debounce = Timer(const Duration(milliseconds: 500), () {
                                      setState(() {
                                         value="search";
                                        filterController.getSearchData(search: val.toString());
                                      });

                                      // Your existing logic for making API calls
                                      // ...
                                    });

                                  },
                                  hintColor:     themeChange.darkTheme?AppLightColors.white_color: AppLightColors.border_color,
                                  fillColor:
                                  themeChange.darkTheme?
                                  AppLightColors.textField_back_dark: AppLightColors.white_color,
                                  textInputAction: TextInputAction.done,
                                  child1: Padding(
                                    padding: const EdgeInsets.only(left: 16,right: 16,bottom: 3,top: 5),
                                    child: SvgPicture.asset(AppImages.search_icon,
                                      color:
                                      themeChange.darkTheme?AppLightColors.white_color:
                                      AppLightColors.border_color,

                                    ),
                                  )
                              ),
                            ),
                            SizedBox(width: 10,),
                            GestureDetector(
                              onTap: (){
                                Navigator.pop(context);
                                setState(() {
                                  query.clear();
                                });
                              },
                              child: AppText(text: localization.cancel,
                                size: 14,
                                color: Theme
                                    .of(context)
                                    .primaryColor,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                ),
                Expanded(child:


                SingleChildScrollView(
                  child: Padding(
                    padding:  EdgeInsets.symmetric(horizontal: AppConfig(context).width*0.04),
                    child:
                    filterController.searchLoader? loader(height: AppConfig(context).height*0.35)

                    :
                    value.isEmpty?SizedBox.shrink():
                    filterController.searchList.isEmpty?
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: AppConfig(context).height * 0.35,
                        ),

                        Center(
                          child: AppText(
                            text:"No Data!",
                            size: 16,
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ):

                    Column(
                      children: [
                        ListView.builder(
                            itemCount: filterController.searchList.length,
                            shrinkWrap: true,

                            primary: false,
                            padding:    const EdgeInsets.only(top: 24),
                            itemBuilder: (BuildContext context, int index) {
                              return GestureDetector(
                                onTap: (){
                                  filterController.filterList.clear();
                                  filterController.clearFilter();
                                  countrySelectionController.getTopCityModelData();
                                  filterController.getAllOccasion();
                                  filterController.getAllSpecial();
                                  filterController.updateProduct(filterController.searchList[index].productName.toString());
                                  filterController.getFilterData(productName:filterController.searchList[index].productName.toString() );
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) =>  SearchResult(name:filterController.searchList[index].productName.toString() )));
                                },
                                child: Container(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(vertical: 10),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        AppText(text: filterController.searchList[index].productName.toString(),
                                          size: 16,
                                          color: Theme
                                              .of(context)
                                              .primaryColor,
                                          fontWeight: FontWeight.w400,
                                        ),
                                        SizedBox(height: 10,),
                                        Divider(color: Theme.of(context).disabledColor.withOpacity(0.2),)
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            }),
                        filterController.catList.isEmpty?SizedBox.shrink():
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 15,),
                            AppText(
                              text:localization.categories,
                              size: 16,
                              color: AppLightColors.label_color,
                              fontWeight: FontWeight.w600,
                            ),
                            ListView.builder(
                                itemCount: filterController.catList.length,
                                shrinkWrap: true,

                                primary: false,
                                padding:    const EdgeInsets.only(top: 24),
                                itemBuilder: (BuildContext context, int index) {
                                  return GestureDetector(
                                    onTap: (){
                                      filterController.filterList.clear();
                                      filterController.clearFilter();
                                      filterController.getAllOccasion();
                                      countrySelectionController.getTopCityModelData();
                                      filterController.getAllSpecial();
                                      filterController.updateCat(filterController.catList[index].id.toString());
                                      filterController.getFilterData(catIId:filterController.catList[index].id.toString() );
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(builder: (context) =>  SearchResult(name:filterController.catList[index].name.toString() ,)));
                                    },
                                    child: Container(
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(vertical: 10),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            AppText(text: filterController.catList[index].name.toString(),
                                              size: 16,
                                              color: Theme
                                                  .of(context)
                                                  .primaryColor,
                                              fontWeight: FontWeight.w400,
                                            ),
                                            SizedBox(height: 10,),
                                            Divider(color: Theme.of(context).disabledColor.withOpacity(0.2),)
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                }),
                          ],
                        ),
                      ],
                    ),
                  ),
                ))

              ],
            )

        ),
      );
  }
}
