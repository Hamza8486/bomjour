import 'package:bomjour/app_module/bottom_tabs/explore/components/explore_components.dart';
import 'package:bomjour/app_module/bottom_tabs/explore/components/explore_detail_view.dart';
import 'package:bomjour/app_module/bottom_tabs/profile/component/profile_component.dart';
import 'package:bomjour/utils/app_constants/localization.dart';
import 'package:bomjour/utils/dark_theme_provider/dark_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:ui' as ui;

class BookmarkedOccasion extends StatelessWidget {
  const BookmarkedOccasion({super.key});

  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<ThemeLocalizationProvider>(context);
    var localization = AppLocalizations.of(context);

    return Directionality(
        textDirection:     themeChange.locale.languageCode  =="en"? ui.TextDirection.ltr: ui.TextDirection.rtl,
        child: Scaffold(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          body: Column(
            children: [
              appBarProfile(context: context,title: localization.bookmarked_occasion),

              Expanded(
                child: ListView.builder(
                    itemCount: 10,
                    shrinkWrap: true,
                    padding: EdgeInsets.zero,
                    primary: false,
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) =>  ExploreDetailView()),
                          );
                        },
                        child: Padding(
                          padding: EdgeInsets.only(left:16,right: 16,top:
                          index==0?16:
                          10,bottom: 10),
                          child: recommendedWidget(image: "",
                              context:context,
                              title: "Birthday Celebration",
                              userImage: "",
                              userName: "Maggie Smith",
                              view: "100",
                              fav: "10",
                              bookMarkImage: "assets/icons/bookmark.svg",
                              onTapSave: (){},
                              width:double.infinity

                          ),
                        ),
                      );
                    }),
              ),

            ],
          ),
        ));
  }
}





