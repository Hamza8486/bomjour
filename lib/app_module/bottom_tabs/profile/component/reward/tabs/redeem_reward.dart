import 'package:bomjour/app_module/bottom_tabs/profile/component/profile_component.dart';
import 'package:bomjour/utils/app_themes/app_colors.dart';
import 'package:bomjour/utils/dark_theme_provider/dark_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RedeemReward extends StatelessWidget {
  const RedeemReward({super.key});

  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<ThemeLocalizationProvider>(context);
    return ListView.builder(
        padding:  EdgeInsets.zero,
        shrinkWrap: true,
        primary: false,
        itemCount: 16,
        itemBuilder: (BuildContext context, int index) {
          return rewardComponent(context:context,
              title: "Purchased Red Rose Flower Bundle",
              subtitle: "W",
              price: "- AED 50",
              titleBack:
              themeChange.darkTheme?AppLightColors.textField_back_dark:
              AppLightColors.light_color,
              titleColor: AppLightColors.primary_color,
              priceColor: AppLightColors.primary_color,
              date: "10 Sep 2023"
          );
        }
    );
  }
}
