// ignore_for_file: prefer_const_constructors, must_be_immutable
// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

//  Custom App Text

class AppText extends StatelessWidget {
  AppText({
    super.key,
    required this.text,
    this.size = 20,
    this.underLine = TextDecoration.none,
    this.textAlign = TextAlign.left,
    this.fontWeight = FontWeight.w400,
    this.fontFamily = "",
    this.maxline,
    this.isGoogleFont = true,
    this.overflow = TextOverflow.visible,
    this.color = Colors.black,
    this.style,
    this.height,
    this.color1,
  });

  String text;
  double size;
  TextDecoration underLine;
  TextAlign textAlign;
  FontWeight fontWeight;
  String fontFamily;
  int? maxline;
  bool isGoogleFont;
  TextOverflow? overflow;
  Color color;
  double?height;
  Color? color1;
  TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,

      maxLines: maxline,

      style: style ??
          (isGoogleFont
              ? GoogleFonts.poppins(
                  fontSize: size,
                  decoration: underLine,
                  decorationColor: color1,
                  height:height?? 0,

                  fontWeight: fontWeight,
                  color: color,
                )
              : TextStyle(
                  fontSize: size,
                  decoration: underLine,
                  overflow: overflow,

                  fontWeight: fontWeight,
                  color: color,
                  fontFamily: fontFamily)),
    );
  }
}

//  Custom App Hyper Text

class HyperTxt extends StatelessWidget {
  String text = '';
  double? size;
  Color? color;
  TextAlign? align = TextAlign.center;
  bool? bold = false;
  Function? onTap;
  HyperTxt({
    Key? key,
    required this.onTap,
    required this.text,
    this.bold,
    this.align,
    this.size,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Text(
        text,
        overflow: TextOverflow.fade,
        textAlign: align,
        style: TextStyle(
          color: color,
          fontSize: size,
          fontWeight: bold == true ? FontWeight.w800 : FontWeight.w200,
        ),
      ),
    );
  }
}

//  Custom App Print Function

void printLog(value) {
  print(value.toString());
}
