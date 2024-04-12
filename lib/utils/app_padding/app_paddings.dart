// ignore_for_file: prefer_const_constructors, must_be_immutable

import 'package:flutter/material.dart';

class AppPaddings {
  static const EdgeInsets defaultPadding = EdgeInsets.all(16);

  static EdgeInsets onlyPadding(
      {double top = 0.0,
      double bottom = 0.0,
      double left = 0.0,
      double right = 0.0}) {
    return EdgeInsets.only(top: top, bottom: bottom, left: left, right: right);
  }

  static EdgeInsets allSidesPadding({
    double padding = 0.0,
  }) {
    return EdgeInsets.all(padding);
  }

  static EdgeInsets onlyVerticalPadding({
    double padding = 0.0,
  }) {
    return EdgeInsets.symmetric(vertical: padding);
  }

  static EdgeInsets onlyHorizontalPadding({
    double padding = 0.0,
  }) {
    return EdgeInsets.symmetric(horizontal: padding);
  }

  static EdgeInsets symmetricPadding({
    double horizontalPadding = 0.0,
    double verticalPadding = 0.0,
  }) {
    return EdgeInsets.symmetric(
        horizontal: horizontalPadding, vertical: verticalPadding);
  }
}
