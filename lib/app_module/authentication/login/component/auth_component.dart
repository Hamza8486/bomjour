
import 'package:bomjour/utils/app_common_widgets/app_text.dart';
import 'package:bomjour/utils/app_common_widgets/app_text_field.dart';
import 'package:bomjour/utils/app_constants/app_config.dart';
import 'package:bomjour/utils/app_constants/app_images.dart';
import 'package:bomjour/utils/app_themes/app_colors.dart';
import 'package:bomjour/utils/dark_theme_provider/dark_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';


Widget authFieldWidget({required BuildContext context,String labelText = "",isSuffix=false,Widget? suffix,TextInputAction ? textInputAction,
  TextInputType ? textInputType,
  bool obsecure=false,
  bool isRead = false,
  bool isPrefix = false,
  Widget?child,
  bool showCur = true,
  bool isShowError=true,
  String?errorText,
  Color?borderColor,
  List<TextInputFormatter> ? listInputParam,
  String? Function(String?)? validator,
  Function(String?)? onChange,
  required TextEditingController controller,
  onTap

}){
  final themeChange = Provider.of<ThemeLocalizationProvider>(context);
  return Stack(
    children: [
      SizedBox(

        height: 68,
        child: Column(
          children: [
            Spacer(),

            Container(
              height: 56,
              decoration: BoxDecoration(
                  color:
                  themeChange.darkTheme?
                  AppLightColors.textField_back_dark:AppLightColors.textField_back_color,
                  border: Border.all(color:
                  borderColor??
                  Theme.of(context).primaryColor.withOpacity(0.1)),
                  borderRadius: BorderRadius.circular(10)


              ),
              child: appField(context: context,
                  border:AppLightColors.transparent_color,
                  isBorderLine: false,
                  listInputParam:listInputParam ,
                  isPrefix: isPrefix,
                  child1: child,
                  onTap: onTap,
                  onChange: onChange,
                  validator: validator,
                  obscure: obsecure,
                  isRead: isRead,
                  isCur: showCur,
                  isSuffix: isSuffix,
                  controller: controller,
                  child: suffix,
                  textInputAction: textInputAction??TextInputAction.next,
                  textInputType: textInputType?? TextInputType.name,



                  labelColor:
                  AppLightColors.label_color,
                  labelSize: 16,
                  labelFont: FontWeight.w400,
                  paddingALl: EdgeInsets.symmetric(vertical: 6,horizontal: 10),

                  fillColor: Colors.transparent,
                  label: labelText

              ),
            ),
          ],
        ),
      ),
      isShowError?SizedBox.shrink():
      Positioned(
          right: 25,
          top: 15,

          child: SvgPicture.asset("assets/icons/error.svg")),
      isShowError?SizedBox.shrink():
      Positioned(
          top: 0,
          right: 20,
          bottom: 40,
          child: Row(
            children: [
              Container(
                height: 32,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: AppLightColors.primary_color
                ),
                child:   Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 10),
                  child: Center(
                    child: AppText(
                      text: errorText.toString(),
                      size: 12,
                      fontWeight: FontWeight.w500,
                      color: AppLightColors.white_color,
                    ),
                  ),
                ),
              ),
            ],
          ))
    ],
  );
}

Widget toolTipWidget({  String title= "", required BuildContext context,
  final GlobalKey<TooltipState> ? toolTip
}){

  return Tooltip(
      key: toolTip,
      verticalOffset: 0,
      triggerMode: TooltipTriggerMode.tap,
      showDuration: const Duration(milliseconds: 1),
      preferBelow: false,
      textAlign: TextAlign.start,
      message: title,
      decoration: BoxDecoration(
        color: AppLightColors.primary_color,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(
                0, 3), // changes position of shadow
          ),
        ],
        borderRadius: BorderRadius.circular(10),
      ),
      margin: EdgeInsets.only(
          right: AppConfig(context).width * 0.06, top: 0),
      padding: EdgeInsets.symmetric(
        horizontal: 7,
      ),
      textStyle: GoogleFonts.poppins(
          textStyle: TextStyle(
              color: AppLightColors.white_color,
              fontSize: 12,
              fontWeight: FontWeight.w500,
              textBaseline: TextBaseline.alphabetic)),
      child: IconButton(onPressed: (){
        toolTip?.currentState?.ensureTooltipVisible();
      }, icon: Icon(
        Icons.info_outline,
        size: 24,
        color: AppLightColors.primary_color,
      )));
}


Widget errorMessage({title,required BuildContext context}){
  final themeChange = Provider.of<ThemeLocalizationProvider>(context);
  return   Padding(
    padding: EdgeInsets.only(top: AppConfig(context).height * 0.025),
    child: Container(
      width: AppConfig(context).width,
      decoration: BoxDecoration(
          color:
          themeChange.darkTheme? AppLightColors.error_message_dark:
          AppLightColors.primary_color.withOpacity(0.1),


          borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(

          children: [
            SvgPicture.asset(AppImages.fill_warn),
            SizedBox(
              width: 8,
            ),
            Expanded(
              child: AppText(
                text:title,
                size: 11,
                fontWeight: FontWeight.w600,
                color: AppLightColors.primary_color,
              ),
            )
          ],
        ),
      ),
    ),
  );
}

Widget richTextWidget({title,subtitle,onTap}){
  return     GestureDetector(
    onTap: onTap,
    child: Container(
      color: Colors.transparent,

      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AppText(
            text: "$title",
            size: 16,
            fontWeight: FontWeight.w500,
            color: AppLightColors.dont_have_color,
          ),
          SizedBox(width: 5,),
          AppText(
            text: subtitle,
            size: 16,
            fontWeight: FontWeight.w500,
            color: AppLightColors.primary_color,
          ),
        ],
      ),
    ),
  );
}

Widget backButton(context){

  return Align(
    alignment: Alignment.topLeft,
    child: GestureDetector(
      onTap: (){
        Navigator.pop(context);
      },
      child: Container(
          color: Colors.transparent,
          height: 25,
          width: 25,
          child: SvgPicture.asset(AppImages.backIcon,
            color: Theme.of(context).primaryColor,
          )),
    ),
  );
}