import 'package:bomjour/app_module/bottom_tabs/occcasions/components/event_list.dart';
import 'package:bomjour/app_module/bottom_tabs/occcasions/components/occasion_list.dart';
import 'package:bomjour/app_module/bottom_tabs/occcasions/components/occasions_component.dart';
import 'package:bomjour/app_module/bottom_tabs/occcasions/controller/occasions_controller.dart';
import 'package:bomjour/utils/dark_theme_provider/dark_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:ui' as ui;




class OccasionsView extends StatelessWidget {
  const   OccasionsView({super.key});

  @override
  Widget build(BuildContext context) {
    final occasionsController = Provider.of<OccasionsController>(context);

    final themeChange = Provider.of<ThemeLocalizationProvider>(context);
    return Directionality(
      textDirection:     themeChange.locale.languageCode  =="en"? ui.TextDirection.ltr: ui.TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,


        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            occasionTopBar(context: context,
            date: "4 Sep, 2023",
              onTap: (){}
            ),
            SizedBox(height: 16,),
            occasionsTab(context: context),
            SizedBox(height: 8,),
            Expanded(child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 8,),
                  occasionsController.selectTab==0?
                  OccasionList():EventList(),
                ],
              ),
            )),

          ],
        ),
      ),
    );
  }
}
