import 'package:flutter/material.dart';

class AppConfig {
  BuildContext context;
  double height = 0;
  double width = 0;
  AppConfig(this.context) {
    MediaQueryData queryData = MediaQuery.of(context);
    height = queryData.size.height;
    width = queryData.size.width;
  }
}
