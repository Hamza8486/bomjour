

import 'package:bomjour/utils/app_constants/app_config.dart';
import 'package:bomjour/utils/app_constants/localization.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:bomjour/utils/app_common_widgets/app_text.dart';
import 'package:bomjour/utils/app_themes/app_colors.dart';
import 'package:bomjour/utils/dark_theme_provider/dark_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'dart:ui' as ui;
import 'package:provider/provider.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';



Widget  profileBar({required BuildContext context, name,email,phoneNumber,image}){
  final themeChange = Provider.of<ThemeLocalizationProvider>(context);
  return    Container(
    margin: EdgeInsets.symmetric(horizontal: 16),
    height: 105,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      color:    themeChange.darkTheme?
      AppLightColors.primary_color:AppLightColors.primary_color,
    ),

    child: Padding(
      padding:  EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height:

            80,
            width: 80,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(200),

            ),
            child:         ClipRRect(
              borderRadius: BorderRadius.circular(200),
              child:CachedNetworkImage(
                placeholder: (context, url) =>   Center(
                  child: SpinKitThreeBounce(
                      size: 8,
                      color: AppLightColors.primary_color
                  ),
                ),

                imageUrl:image,
                fit: BoxFit.cover,

                errorWidget: (context, url, error) => ClipRRect(
                  borderRadius: BorderRadius.circular(200),
                  child: Image.asset(
                    "assets/images/person.png",
                    fit: BoxFit.cover,
                  ),
                ),
              ),




            ),
          ),
          SizedBox(width: 19,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppText(text: name,
                size: 16,
                color: AppLightColors.white_color,
                fontWeight: FontWeight.w600,
              ),
              SizedBox(height: 3,),
              AppText(text:email,
                size: 12,
                color: AppLightColors.white_color,
                fontWeight: FontWeight.w400,
              ),
              SizedBox(height: 5,),
              AppText(text: phoneNumber,
                size: 12,
                color: AppLightColors.white_color,
                fontWeight: FontWeight.w400,
              ),
            ],
          )
        ],
      ),
    ),
  );
}

Widget profileWidget({image,title,onTap,required BuildContext context,double?height}){
  final themeChange = Provider.of<ThemeLocalizationProvider>(context);
  return Directionality(
    textDirection:     themeChange.locale.languageCode  =="en"? ui.TextDirection.ltr: ui.TextDirection.rtl,
    child: Padding(
      padding:  EdgeInsets.only(top: height??25,right: 16,left: 16),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          color: Colors.transparent,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SvgPicture.asset(image,
                    height: 22,
                    width: 22,
                    color: AppLightColors.label_color,
                  ),
                  SizedBox(width: 15,),
                  AppText(text: title,
                    size: 16,
                    color:
                    themeChange.darkTheme?AppLightColors.white_color:
                    AppLightColors.textField_back_dark,
                    fontWeight: FontWeight.w400,
                  ),
                ],
              ),
              SvgPicture.asset("assets/icons/nexts.svg")
            ],
          ),
        ),
      ),
    ),
  );
}

Widget appBar({required BuildContext context, CrossAxisAlignment ? crossAxisAlignment}){
  var localization = AppLocalizations.of(context);
  final themeChange = Provider.of<ThemeLocalizationProvider>(context);
  return   Container(
    width: double.infinity,
    height: 103,

    color:
    themeChange.darkTheme?
    AppLightColors.textField_back_dark:AppLightColors.profileBackColor,
    child: Padding(
      padding:  EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment:crossAxisAlignment?? CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,

        children: [
          SizedBox(height: 47,),
          AppText(text: localization.menues,
            size: 16,
            color: Theme
                .of(context)
                .primaryColor,
            fontWeight: FontWeight.w600,
          ),
        ],
      ),
    ),
  );
}

Widget appBarProfile({required BuildContext context,String?title,Color?color,double? thickness  ,VoidCallback ? onTap,
String ? image
}){
  final themeChange = Provider.of<ThemeLocalizationProvider>(context);
  return   Directionality(
    textDirection: themeChange.locale.languageCode  =="en"? ui.TextDirection.ltr: ui.TextDirection.ltr,
    child: Column(
      children: [
        SizedBox(height: AppConfig(context).height*0.06,),
        Padding(
          padding:  EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                  onTap:onTap?? (){

                    Navigator.of(context).pop();
                  },
                  child: Container(

                      color: Colors.transparent,
                      child: SvgPicture.asset(
                        image??
                          "assets/icons/left.svg",
                      color: themeChange.darkTheme?AppLightColors.white_color:AppLightColors.black_color,
                      ))),
              AppText(text:title?? AppLocalizations.of(context).appear,
                size: 16,
                fontWeight: FontWeight.w600,
                color: Theme.of(context).primaryColor,
              ),
              Container()
            ],
          ),

        ),
        SizedBox(height: 13),
        themeChange.darkTheme?
        Divider(color:color??

            AppLightColors.black_color,height: 0,thickness:thickness ,)
            :
        Divider(color:color??

            AppLightColors.dividerColor,height: 0,thickness:thickness ,)
      ],
    ),
  );
}

Widget appearanceWidget({required BuildContext context,image,selectImage,title,onTap,subtitle}){
  final themeChange = Provider.of<ThemeLocalizationProvider>(context);
  return  Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16),
    child: GestureDetector(
      onTap: onTap,
      child: Container(
        color: Colors.transparent,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Row(
                children: [
                  SvgPicture.asset(image),
                  SizedBox(width: 16,),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppText(text: title,
                          color: Theme.of(context).primaryColor,
                          size: 16,
                          fontWeight: FontWeight.w600,
                        ),
                        AppText(text: subtitle,
                          color: AppLightColors.label_color,
                          size: 16,
                          textAlign:
                          themeChange.locale.languageCode  =="en"?
                          TextAlign.left:TextAlign.right,
                          fontWeight: FontWeight.w400,
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            SvgPicture.asset(selectImage),
          ],
        ),
      ),
    ),
  );
}

Widget rewardComponent({required BuildContext context,title,price,date,subtitle,Color? priceColor, Color?titleColor, Color ? titleBack}){
  final themeChange = Provider.of<ThemeLocalizationProvider>(context);
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 15),
    child: Row(

      children: [
        Container(
          height: 56,
          width: 56,
          decoration:
          themeChange.darkTheme?
          BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: AppLightColors.black_color),
              color

                  :titleBack??

                  AppLightColors.textField_back_dark
          ):BoxDecoration(
              shape: BoxShape.circle,
              color

                  :titleBack??

                  AppLightColors.light_color
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Container(
                  height: 38,
                  width: 38,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color:titleColor?? AppLightColors.primary_color
                  ),
                  child: Center(
                    child: AppText(text: subtitle,
                      size: 16,
                      fontWeight: FontWeight.w600,
                      color: AppLightColors.white_color,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(width: 10,),
        Expanded(
          child: Column(

            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              AppText(text: title,
                size: 14,
                maxline: 1,
                fontWeight: FontWeight.w500,
                color: Theme.of(context).primaryColor,
              ),
              SizedBox(height: 8,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppText(text: price,
                    size: 14,
                    maxline: 1,
                    fontWeight: FontWeight.w500,
                    color: priceColor??AppLightColors.primary_color,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 30),
                    child: AppText(text: date,
                      size: 14,
                      maxline: 1,
                      fontWeight: FontWeight.w400,
                      color: AppLightColors.label_color,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

Widget rewardWalletBox({required BuildContext context,title,image,price}){
  final themeChange = Provider.of<ThemeLocalizationProvider>(context);
  return Container(height: 126,


    decoration: BoxDecoration(
        color:
        themeChange.darkTheme?AppLightColors.textField_back_dark:
        AppLightColors.rewardBoxColor,
        border: Border.all(color:
        themeChange.darkTheme?AppLightColors.black_color:
        AppLightColors.rewardBoxColor,
        ),
        borderRadius: BorderRadius.circular(10)
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(height: 16,),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color:themeChange.darkTheme?
                  AppLightColors.textField_back_dark:Color(0xfffff3f5) ,
                  border: Border.all(color:
                  themeChange.darkTheme?
                  AppLightColors.black_color:Color(0xfffff3f5))
                ),
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: SvgPicture.asset(image),
                )),
            SizedBox(width: 10,),
            AppText(text: title,
              size: 14,
              fontWeight: FontWeight.w600,
              color: AppLightColors.primary_color,
            ),

          ],
        ),
        Spacer(),
        Container(
          width:AppConfig(context).width,
          height: 58,

          decoration: BoxDecoration(
              color: AppLightColors.primary_color,
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10)
              )
          ),

          child:Center(
            child: AppText(text: price,
              size: 18,
              fontWeight: FontWeight.w700,
              color: AppLightColors.white_color,
            ),
          ) ,
        ),

      ],),
  );
}

Widget rewardSelectWidget({required BuildContext context,onTap,color,title,double?width,Color?borderColor}){
  return GestureDetector(
    onTap: onTap,
    child: Container(
      height: 44,

      decoration: BoxDecoration(
          color:color,
          border: Border.all(color: borderColor??Colors.transparent),
          borderRadius: BorderRadius.circular(100)
      ),
      child:Center(
        child: AppText(text: title,
          size: 14,
          fontWeight: FontWeight.w500,
          color: Theme.of(context).primaryColor,
        ),
      ) ,
    ),
  );
}