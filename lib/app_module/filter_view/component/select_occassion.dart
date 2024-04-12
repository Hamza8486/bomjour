import 'package:bomjour/app_module/filter_view/controller/filter_controller.dart';
import 'package:bomjour/utils/app_common_widgets/app_button.dart';
import 'package:bomjour/utils/app_common_widgets/app_text.dart';
import 'package:bomjour/utils/app_common_widgets/app_text_field.dart';
import 'package:bomjour/utils/app_constants/app_config.dart';
import 'package:bomjour/utils/app_constants/app_images.dart';
import 'package:bomjour/utils/app_themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:provider/provider.dart';
import 'dart:ui' as ui;

import '../../../utils/app_constants/localization.dart';
import '../../../utils/dark_theme_provider/dark_theme.dart';


class SelectOccasions extends StatefulWidget {


  SelectOccasions({super.key});


  @override
  State<SelectOccasions> createState() => _SelectOccasionsState();
}

class _SelectOccasionsState extends State<SelectOccasions> {

  String searchQuery = '';

  @override
  Widget build(BuildContext context) {
    final isKeyBoard = MediaQuery.of(context).viewInsets.bottom != 0;
    final themeChange = Provider.of<ThemeLocalizationProvider>(context);
    final filterController = Provider.of<FilterController>(context);

    return  Directionality(
      textDirection:     themeChange.locale.languageCode  =="en"? ui.TextDirection.ltr: ui.TextDirection.rtl,
      child: DraggableScrollableSheet(
        initialChildSize: isKeyBoard?0.8:0.5,
        minChildSize: isKeyBoard?0.8:0.5,
        maxChildSize: isKeyBoard?0.8:0.5,
        builder: (_, controller) => Container(
          decoration: BoxDecoration(
            color: Theme.of(context).scaffoldBackgroundColor,
            borderRadius:  BorderRadius.only(
                topLeft: Radius.circular(32), topRight: Radius.circular(32)),
          ),
          child: Padding(
            padding:  EdgeInsets.only(top: 10),
            child: Padding(
              padding:  EdgeInsets.symmetric(horizontal: AppConfig(context).width*0.04),
              child: Column(
                children: [
                  SizedBox(height:AppConfig(context).height*0.01 ,),
                  SvgPicture.asset(AppImages.border),
                  SizedBox(height:AppConfig(context).height*0.03 ,),
                  AppText(text: AppLocalizations.of(context).selectOcc,
                    size: 18,
                    color: Theme.of(context).primaryColor,
                    textAlign: themeChange.locale.languageCode  =="en"?TextAlign.left:TextAlign.right,

                    fontWeight: FontWeight.w600,
                  ),
                  SizedBox(height:AppConfig(context).height*0.03 ,),
                  appField(
                      context: context,
                      hint:AppLocalizations.of(context).searchOcc,
                      border:
                      AppLightColors.border_color,
                      borderRadius: BorderRadius.circular(100),
                      onChange: (val){
                        setState(() {
                          searchQuery = val.toString();
                        });
                      },



                      isPrefix: true,
                      fillColor:
                      themeChange.darkTheme?
                      AppLightColors.textField_back_dark: Colors.white,
                      textInputAction: TextInputAction.done,

                      child1: Padding(
                        padding: const EdgeInsets.only(left: 16,right: 16,bottom: 3,top: 5),
                        child: SvgPicture.asset(AppImages.search_icon,
                          color: AppLightColors.border_color,

                        ),
                      )
                  ),
                  SizedBox(height:AppConfig(context).height*0.033 ,),
                  Expanded(
                      child: ListView.builder(
                        itemCount: filterController.occasionList.length,
                        shrinkWrap: true,
                        primary: false,
                        padding: EdgeInsets.zero,
                        itemBuilder: (BuildContext context, int index) {
                          bool matchesSearch = filterController.occasionList[index].name
                              .toLowerCase()
                              .contains(searchQuery.toLowerCase());

                          return matchesSearch
                              ? GestureDetector(
                            onTap: () {
                              filterController.updateOccId(
                                  filterController.occasionList[index].id.toString());
                              filterController.updateOccName(
                                  themeChange.locale.languageCode == "en"
                                      ? filterController.occasionList[index].name.toString()
                                      : filterController.occasionList[index].ar_name.toString());
                            },
                            child: Container(
                              color: Colors.transparent,
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      AppText(
                                        text: themeChange.locale.languageCode == "en"
                                            ? filterController.occasionList[index].name.toString()
                                            : filterController.occasionList[index].ar_name.toString(),
                                        size: 16,
                                        color:
                                        filterController.selectOccasionId ==
                                            filterController.occasionList[index].id.toString()?AppLightColors.primary_color:
                                        Theme.of(context).primaryColor,
                                        textAlign: themeChange.locale.languageCode == "en"
                                            ? TextAlign.left
                                            : TextAlign.right,
                                        fontWeight: FontWeight.w500,
                                      ),
                                      filterController.selectOccasionId ==
                                          filterController.occasionList[index].id.toString()
                                          ? Icon(
                                        Icons.check,
                                        size: 16,
                                        color: AppLightColors.primary_color,
                                      )
                                          : SizedBox.shrink()
                                    ],
                                  ),
                                  SizedBox(height: AppConfig(context).height * 0.013),
                                  Divider(
                                    color: AppLightColors.border_color.withOpacity(0.5),
                                  ),
                                  SizedBox(height: AppConfig(context).height * 0.013),
                                ],
                              ),
                            ),
                          )
                              : SizedBox.shrink(); // Return an empty container if it doesn't match the search query
                        },
                      )
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: AppButton(
                        buttonName:AppLocalizations.of(context).select,
                        buttonRadius: BorderRadius.circular(24),

                        onTap: () {
                          Navigator.pop(context);
                        }),
                  ),

                ],
              ),
            ),
          ),
        ),
      ),
    );


  }
}

