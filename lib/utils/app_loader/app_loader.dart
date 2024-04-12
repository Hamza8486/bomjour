// ignore_for_file: must_be_immutable
import 'package:bomjour/utils/app_themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class SpinKitView extends StatelessWidget {
  bool themeIsDark = true;
  SpinKitView({
    required this.themeIsDark,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      // height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      color: themeIsDark ? AppLightColors.primary_color : Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // SpinKitFadingFour(
          // SpinKitFoldingCube(
          // SpinKitHourGlass(
          SpinKitFadingCircle(
            size: 35,
            color: themeIsDark ? Colors.white : AppLightColors.primary_color,
          ),
        ],
      ),
    );
  }
}

void showLoadingIndicator(
    {required BuildContext context, bool isDark = false}) {
  showDialog(
    barrierDismissible: false,
    useRootNavigator: false,
    context: context,
    builder: (BuildContext context) {
      return Container(
        height: 50,
        width: 50,
        color: Colors.transparent,
        child: SpinKitThreeBounce(
          size: 35,
          color: isDark ? Colors.white : AppLightColors.primary_color,
        ),
      );
    },
  );
}

void hideOpenDialog({
  required BuildContext context,
}) {
  Navigator.of(context).pop();
}
