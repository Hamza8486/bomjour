// ignore_for_file: file_names

import 'package:bomjour/utils/app_common_widgets/app_text.dart';
import 'package:bomjour/utils/app_constants/app_config.dart';
import 'package:bomjour/utils/app_themes/app_colors.dart';
import 'package:flutter/material.dart';


//  Custom App Button

class AppButton extends StatelessWidget {
  final String buttonName;
  final double textSize;
  final double ? buttonWidth;
  final double buttonHeight;
  final Color ? buttonColor;
  final Color ? textColor;
  final Color iconColor;
  final FontWeight fontWeight;
  final BorderRadius? buttonRadius;
  final IconData icon;
  final String iconImage;
  final bool isIcon;
  final bool isCenter;
  final double iconSize;
  final double paddingBtwn;
  final VoidCallback onTap;
  final double borderWidth;
  final Color borderColor;
  final Widget ? child;
  final String fontFamily;
  final bool isGradient;
  const AppButton({
    Key? key,
    required this.buttonName,
    this.buttonWidth ,
    this.buttonHeight = 56,
     this.buttonColor,
    this.buttonRadius,
    this.child,
     this.textColor = Colors.white,
    this.fontWeight = FontWeight.w600,

    this.iconColor = Colors.white,
    this.icon = Icons.home,
    this.iconImage = "",
    this.isGradient = false,
    this.isIcon = false,
    this.isCenter = false,
    this.iconSize = 30,
    this.paddingBtwn = 0,
    this.fontFamily = "",
    required this.onTap,
    this.textSize = 16,
    this.borderWidth = 0,
    this.borderColor = Colors.transparent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          height: buttonHeight,
          width:
          buttonWidth??
          AppConfig(context).width,
          decoration: BoxDecoration(
              color: isGradient ? null :
              buttonColor??
              AppLightColors.primary_color,
              // gradient: isGradient ? AppGradient.button_gradient : null,
              borderRadius: buttonRadius??BorderRadius.circular(30),
              border: Border.all(
                width: borderWidth,
                color: borderColor,
              )),
          child: Padding(
            padding: isCenter
                ? const EdgeInsets.symmetric(horizontal: 20)
                : EdgeInsets.only(left: paddingBtwn == 0 ? 0 : 15),
            child: Row(
              mainAxisAlignment: paddingBtwn == 0
                  ? MainAxisAlignment.center
                  : MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                isIcon
                    ?
                child??
                Image.asset(
                            iconImage,
                            height: iconSize,
                            color: iconColor,
                          )
                    : Container(),
                isCenter
                    ? const Spacer()
                    : SizedBox(
                        width: paddingBtwn == 0
                            ? isIcon
                                ? 10
                                : 0
                            : paddingBtwn,
                      ),
                Center(
                  child: AppText(
                      text: buttonName,
                      color: textColor??Colors.white,
                      fontFamily: fontFamily,
                      fontWeight: fontWeight,
                      size: textSize),
                ),
                isCenter ? const Spacer() : Container(),
                isCenter
                    ? isIcon
                        ? iconImage == ""
                            ? Icon(
                                icon,
                                color: iconColor,
                                size: iconSize,
                              )
                            : Image.asset(iconImage,
                                height: iconSize, color: Colors.transparent)
                        : Container()
                    : Container(),
              ],
            ),
          )),
    );
  }
}
