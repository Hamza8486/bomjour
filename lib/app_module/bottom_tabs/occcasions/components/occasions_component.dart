

import 'package:bomjour/app_module/bottom_tabs/occcasions/controller/occasions_controller.dart';
import 'package:bomjour/utils/app_common_widgets/app_text.dart';
import 'package:bomjour/utils/app_constants/app_config.dart';
import 'package:bomjour/utils/app_constants/app_images.dart';
import 'package:bomjour/utils/app_constants/localization.dart';
import 'package:bomjour/utils/app_themes/app_colors.dart';
import 'package:bomjour/utils/dark_theme_provider/dark_theme.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_image_stack/flutter_image_stack.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';


Widget occasionWidget({required BuildContext context,
  String image="",
  String name="",
  String title="",
  String date="",
  Widget?child


}){
  // final occasionsController = Provider.of<OccasionsController>(context);
  // var localization = AppLocalizations.of(context);

  final themeChange = Provider.of<ThemeLocalizationProvider>(context);

  return Container(
    margin: EdgeInsets.symmetric(
        horizontal: 16
    ),

    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      color: AppLightColors.primary_color,
    ),
    child: Container(
      decoration:  BoxDecoration(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(10),
          bottomRight: Radius.circular(10),
          topLeft: Radius.circular(3),
          bottomLeft: Radius.circular(3),
        ),

        color: themeChange.darkTheme?AppLightColors.textField_back_dark:
        AppLightColors.profileBackColor,
      ),
      margin: const EdgeInsets.fromLTRB(6, 0, 0, 0),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 16,
          horizontal: 16,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                SizedBox(
                  height:43,
                  width: 43,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(1000),
                    child: CachedNetworkImage(
                      placeholder: (context, url) => Center(
                        child: SpinKitThreeBounce(
                            size: 5,
                            color: AppLightColors.primary_color),
                      ),
                      imageUrl:image,
                      fit: BoxFit.cover,
                      errorWidget: (context, url, error) => ClipRRect(
                        borderRadius: BorderRadius.circular(1000),
                        child: Image.asset(
                          "assets/images/person.png",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(width:
                10,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppText(
                      text:name,
                      size: 14,
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.w500,
                    ),
                    AppText(
                      text:title,
                      size: 12,
                      color:
                      themeChange.darkTheme? AppLightColors.white_color:
                      AppLightColors.greyColorWish,
                      fontWeight: FontWeight.w400,
                    ),
                  ],
                )
              ],
            ),
            SizedBox(height: 8,),

            Row(
              children: [
                SvgPicture.asset("assets/icons/cal_occ.svg",
                color: themeChange.darkTheme? AppLightColors.white_color:AppLightColors.black_color,
                ),
                SizedBox(width: 7,),
                AppText(
                  text:date,
                  size: 12,
                  color:
                  themeChange.darkTheme? AppLightColors.white_color:
                  AppLightColors.black_color,
                  fontWeight: FontWeight.w400,
                ),

              ],
            ),
            SizedBox(height: 8,),
            child??
            FlutterImageStack(
              imageList: ["assets/images/dummy12.png",
                "assets/images/dummy12.png",
                "assets/images/dummy12.png",

              ],
              showTotalCount: true,
              extraCountTextStyle: TextStyle(color: Colors.white,fontSize: 12),
              totalCount:5,
              imageSource: ImageSource.asset,
              itemBorderColor: AppLightColors.primary_color,
              backgroundColor: AppLightColors.primary_color,
              itemRadius: 30, // Radius of each images
              itemCount: 3, // Maximum number of images to be shown in stack
              itemBorderWidth: 1, // Border width around the images
            ),
          ],
        ),
      ),
    ),
  );
}


Widget occasionTopBar({required BuildContext context,String date="",onTap}){
  var localization = AppLocalizations.of(context);
  final themeChange = Provider.of<ThemeLocalizationProvider>(context);
  return Container(width: double.infinity,
    height: 105,

    decoration: BoxDecoration(
        color:
        themeChange.darkTheme?AppLightColors.textField_back_dark:
        AppLightColors.textField_back_color,
        border: Border.all(color:   themeChange.darkTheme?AppLightColors.black_color:
        Colors.transparent, )
    ),
    child: Padding(
      padding: EdgeInsets.only(left: 16,right: 16,top:AppConfig(context).height*0.04),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AppText(
            text:localization
                .occ,
            size: 16,
            color: Theme.of(context).primaryColor,
            fontWeight: FontWeight.w600,
          ),
          Spacer(),
          GestureDetector(
            onTap: onTap,
            child: Container(
              color: Colors.transparent,
              child: Row(
                children: [
                  AppText(
                    text:date,
                    size: 14,
                    color: AppLightColors.primary_color,
                    fontWeight: FontWeight.w500,
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  SvgPicture.asset(AppImages.down,

                    color: AppLightColors.light__primary_color,
                  )
                ],
              ),
            ),
          ),



        ],
      ),
    ),

  );
}


Widget occasionsTab({required BuildContext context}){
  final occasionsController = Provider.of<OccasionsController>(context);
  var localization = AppLocalizations.of(context);
  final themeChange = Provider.of<ThemeLocalizationProvider>(context);
  return  Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16),
    child: Container(
      width: double.infinity,
      height: 60,
      decoration: BoxDecoration(
          color:
          themeChange.darkTheme?AppLightColors.textField_back_dark:
          AppLightColors.textField_back_color,
          borderRadius: BorderRadius.circular(30),
          border: Border.all(color:   themeChange.darkTheme?AppLightColors.black_color:
          Colors.transparent, )
      ),
      child: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: [
            Expanded(
              child: GestureDetector(
                onTap:(){
                  occasionsController.updateSelectedTab(0);
                },
                child: Container(
                  height:44,
                  decoration: BoxDecoration(
                    color:
                    occasionsController.selectTab==0?
                    AppLightColors.primary_color:Colors.transparent,
                    borderRadius: BorderRadius.circular(30),

                  ),
                  child:Center(
                    child: AppText(
                      text:localization.occ,
                      size: 14,
                      color:
                      occasionsController.selectTab==0?
                      AppLightColors.white_color:
                      themeChange.darkTheme? AppLightColors.white_color:
                      AppLightColors.textField_back_dark,
                      fontWeight:
                      occasionsController.selectTab==0?
                      FontWeight.w600:FontWeight.w500,
                    ),
                  ) ,
                ),
              ),
            ),
            Expanded(
              child: GestureDetector(
                onTap: (){
                  occasionsController.updateSelectedTab(1);
                },
                child: Container(
                  height:44,
                  decoration: BoxDecoration(
                    color:
                    occasionsController.selectTab==1?
                    AppLightColors.primary_color:Colors.transparent,
                    borderRadius: BorderRadius.circular(30),

                  ),
                  child:Center(
                    child: AppText(
                      text:localization.events,
                      size: 14,
                      color:
                      occasionsController.selectTab==1?
                      AppLightColors.white_color:
                      themeChange.darkTheme? AppLightColors.white_color:
                      AppLightColors.textField_back_dark,
                      fontWeight:
                      occasionsController.selectTab==1?
                      FontWeight.w600:FontWeight.w500,
                    ),
                  ) ,
                ),
              ),
            )
          ],
        ),
      ),
    ),
  );
}