import 'package:bomjour/app_module/authentication/login/component/auth_component.dart';
import 'package:bomjour/app_module/bottom_tabs/add_occasions/component/add_contact_list.dart';
import 'package:bomjour/app_module/bottom_tabs/add_occasions/component/add_friend_group.dart';
import 'package:bomjour/app_module/bottom_tabs/add_occasions/component/select_relationship.dart';
import 'package:bomjour/app_module/bottom_tabs/add_occasions/controller/add_occasion_controller.dart';
import 'package:bomjour/app_module/bottom_tabs/profile/component/profile_component.dart';
import 'package:bomjour/app_module/filter_view/component/select_date.dart';
import 'package:bomjour/app_module/filter_view/controller/filter_controller.dart';
import 'package:bomjour/utils/app_common_widgets/app_button.dart';
import 'package:bomjour/utils/app_common_widgets/app_text.dart';
import 'package:bomjour/utils/app_constants/app_config.dart';
import 'package:bomjour/utils/app_constants/localization.dart';
import 'package:bomjour/utils/app_themes/app_colors.dart';
import 'package:bomjour/utils/dark_theme_provider/dark_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:ui' as ui;

class AddOccasion extends StatelessWidget {
   AddOccasion({super.key});



  List prefList = [
    "Travel",
    "Reading",
    "Food",
    "Red",
    "Music",
    "Beach",
    "Flowers",
  ];

  String selectPref="";

  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<ThemeLocalizationProvider>(context);
    var localization = AppLocalizations.of(context);
    final filterController = Provider.of<FilterController>(context);
    final occasionAddController = Provider.of<AddOccasionController>(context);

    return Directionality(
        textDirection:     themeChange.locale.languageCode  =="en"? ui.TextDirection.ltr: ui.TextDirection.rtl,
        child: Scaffold(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          body: Column(
            children: [
              appBarProfile(context: context,
                  title:"Birthday ${localization.Occasion}"
              ),

              Expanded(child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 10,),


                      authFieldWidget(
                        labelText: localization.occasion_for,
                        controller: occasionAddController.occasionFor,
                        showCur: false,
                        isRead: true,
                        textInputAction: TextInputAction.done,
                        context: context,
                        onTap: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) =>  AddContactList()),
                          );
                        },
                        borderColor: Theme.of(context)
                            .primaryColor
                            .withOpacity(0.1),
                      ),
                      SizedBox(height: 8,),
                      authFieldWidget(
                        labelText: localization.relationship
                        ,
                        controller:occasionAddController.relationCon,
                        showCur: false,
                        isRead: true,
                        textInputAction: TextInputAction.done,
                        context: context,
                        onTap: (){
                          filterController.getAllSpecial();
                          showModalBottomSheet(
                              backgroundColor: Colors.transparent,
                              isScrollControlled: true,
                              isDismissible: true,
                              context: context,
                              builder: (context) => SelectRelationShip());
                        },
                        borderColor: Theme.of(context)
                            .primaryColor
                            .withOpacity(0.1),
                      ),
                      SizedBox(height: 8,),
                      authFieldWidget(
                        labelText: localization.date1
                        ,
                        controller: occasionAddController.dateCon,
                        showCur: false,
                        isRead: true,
                        textInputAction: TextInputAction.done,
                        context: context,
                        onTap: (){
                          showModalBottomSheet(
                              backgroundColor: Colors.transparent,
                              isScrollControlled: true,
                              isDismissible: true,
                              context: context,
                              builder: (context) => SelectDatePicker());
                        },
                        borderColor: Theme.of(context)
                            .primaryColor
                            .withOpacity(0.1),
                      ),
                      SizedBox(height: 8,),
                      authFieldWidget(
                        labelText: localization.add_friends_or_groups,
                        controller: occasionAddController.addFriendGroupCon,
                        textInputAction: TextInputAction.done,
                        context: context,
                        showCur: false,
                        isRead: true,
                        onTap: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) =>  AddFriendGroupList()),
                          );
                        },
                        borderColor: Theme.of(context)
                            .primaryColor
                            .withOpacity(0.1),
                      ),
                      SizedBox(height:24 ,),
                      AppText(text: localization.occasion_preferences,
                        size: 20,
                        color: Theme.of(context).primaryColor,
                        textAlign: themeChange.locale.languageCode  =="en"?TextAlign.left:TextAlign.right,

                        fontWeight: FontWeight.w500,
                      ),
                      SizedBox(height:16 ,),
                      Wrap(
                        direction: Axis.horizontal,
                        spacing: 15.0,
                        runSpacing: 15.0,
                        children: List.generate(
                            prefList.length, (index) {
                          return GestureDetector(
                            onTap: () {

                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(40),
                                  color: selectPref ==
                                      prefList[index]
                                      ? AppLightColors.primary_color
                                      : Colors.transparent,
                                  border: Border.all(
                                      color: selectPref ==
                                          prefList[index]
                                          ? AppLightColors.primary_color
                                          : Theme.of(context)
                                          .disabledColor)),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal:
                                    AppConfig(context).width * 0.035,
                                    vertical:
                                    AppConfig(context).height * 0.01),
                                child: AppText(
                                    text: prefList[index],
                                    size: 14,
                                    fontWeight: FontWeight.w500,
                                    color: selectPref ==
                                        prefList[index]
                                        ? AppLightColors.white_color
                                        : Theme.of(context).primaryColor),
                              ),
                            ),
                          );
                        }),
                      ),
                    ],),
                ),
              )),
              Padding(
                padding: const EdgeInsets.only(left: 16,right: 16,bottom: 16,top: 10),
                child: AppButton(

                    buttonHeight: 55,
                    buttonName: localization.make_occasion,
                    borderColor:
                    themeChange.darkTheme?AppLightColors.white_color:
                    AppLightColors.label_color,
                    textSize: 16,
                    buttonColor:
                    themeChange.darkTheme?AppLightColors.textField_back_dark:
                    AppLightColors.white_color,
                    textColor: Theme.of(context).primaryColor,



                    onTap: () {

                    }),
              ),

            ],
          ),
        ));
  }
}

 


