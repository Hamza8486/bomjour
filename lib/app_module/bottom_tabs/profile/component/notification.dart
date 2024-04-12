import 'package:bomjour/app_module/bottom_tabs/profile/component/profile_component.dart';
import 'package:bomjour/utils/app_common_widgets/app_text.dart';
import 'package:bomjour/utils/app_themes/app_colors.dart';
import 'package:bomjour/utils/dark_theme_provider/dark_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:ui' as ui;

class NotificationView extends StatelessWidget {
  const NotificationView({super.key});

  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<ThemeLocalizationProvider>(context);
    return Directionality(
        textDirection:     themeChange.locale.languageCode  =="en"? ui.TextDirection.ltr: ui.TextDirection.rtl,
        child: Scaffold(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          body: Column(
            children: [
              appBarProfile(context: context,
              title:"Notification",
                color: Colors.transparent
              ),

          Expanded(
            child: ListView.builder(
                padding:  EdgeInsets.only(top: 15),
                shrinkWrap: true,
                primary: false,
                itemCount: 15,
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding:  EdgeInsets.symmetric(horizontal: 16),
                        child: AppText(text: "Your order has been delivered.Click here to submit a review of #89760.",
                          size: 14,
                          fontWeight: FontWeight.w400,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                      SizedBox(height: 3,),
                      Padding(
                        padding:  EdgeInsets.symmetric(horizontal: 16),
                        child: AppText(text: "Four hours ago.",
                          size: 12,
                          fontWeight: FontWeight.w400,
                          color: AppLightColors.label_color,
                        ),
                      ),
                      SizedBox(height: 10),
                      Divider(color: AppLightColors.border_color.withOpacity(0.7),),
                      SizedBox(height: 10),
                    ],
                  );
                }
            )),


            ],
          ),
        ));
  }
}
