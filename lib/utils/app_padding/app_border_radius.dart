// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

class AppBorderRadius {
  static BorderRadius allSidesBorderRadius({double radius = 5.0}) {
    return BorderRadius.all(Radius.circular(radius));
  }

  static BorderRadius topSideBorderRadius({double radius = 5.0}) {
    return BorderRadius.only(
        topLeft: Radius.circular(radius), topRight: Radius.circular(radius));
  }

  static BorderRadius bottomSideBorderRadius({double radius = 5.0}) {
    return BorderRadius.only(
        bottomLeft: Radius.circular(radius),
        bottomRight: Radius.circular(radius));
  }

  static BorderRadius onlySideBorderRadius(
      {double bottomLeftRadius = 0.0,
      double bottomRightRadius = 0.0,
      double topLeftRadius = 0.0,
      double topRightRadius = 0.0}) {
    return BorderRadius.only(
        bottomLeft: Radius.circular(bottomLeftRadius),
        bottomRight: Radius.circular(bottomRightRadius),
        topLeft: Radius.circular(topLeftRadius),
        topRight: Radius.circular(topRightRadius));
  }
}
