import 'package:bomjour/app_module/bottom_tabs/add_occasions/view/add_occasion.dart';
import 'package:bomjour/app_module/bottom_tabs/explore/components/explore_detail_view.dart';
import 'package:bomjour/app_module/bottom_tabs/occcasions/components/occasions_component.dart';
import 'package:bomjour/utils/app_common_widgets/app_text.dart';
import 'package:bomjour/utils/app_themes/app_colors.dart';
import 'package:bomjour/utils/dark_theme_provider/dark_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EventList extends StatelessWidget {
  const EventList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 5,
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        primary: false,
        itemBuilder: (BuildContext context, int index) {
          final themeChange = Provider.of<ThemeLocalizationProvider>(context);
          return GestureDetector(
            onTap: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) =>  ExploreDetailView()),
              );
            },
            child: occasionWidget(context: context,
                image: "",
                name: "Emily Johnson",
                title: "Birthday Celebration",
                date: "24 Jun, 2023",
              child: Row(
                children: [
                  GestureDetector(
                    onTap: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) =>  AddOccasion()),
                      );
                    },
                    child
                        : Container(
                      decoration: BoxDecoration(
                        border: Border.all(color:
                        themeChange.darkTheme?AppLightColors.black_color:
                        AppLightColors.otpLightColor,
                        width: 1.5
                        ),
                        borderRadius: BorderRadius.circular(30)
                      ),
                      child:  Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 8),
                        child: AppText(
                          text:"Make Occasion",
                          size: 16,
                          color:
                          themeChange.darkTheme?AppLightColors.white_color:
                          AppLightColors.black_color,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ),
          );
        });
  }
}
