import 'package:bomjour/app_module/bottom_tabs/dashboard/component/dashboard_component.dart';
import 'package:bomjour/app_module/bottom_tabs/explore/components/bookmarked_occasion.dart';
import 'package:bomjour/app_module/bottom_tabs/explore/components/explore_components.dart';
import 'package:bomjour/app_module/bottom_tabs/explore/components/explore_detail_view.dart';
import 'package:bomjour/app_module/bottom_tabs/explore/controller/explore_controller.dart';
import 'package:bomjour/app_module/filter_view/view/filter_view.dart';
import 'package:bomjour/utils/app_constants/localization.dart';
import 'package:bomjour/utils/app_themes/app_colors.dart';
import 'package:bomjour/utils/dark_theme_provider/dark_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:ui' as ui;



class ExploreView extends StatelessWidget {
  const   ExploreView({super.key});

  @override
  Widget build(BuildContext context) {
    final exploreController = Provider.of<ExploreController>(context);
    final themeChange = Provider.of<ThemeLocalizationProvider>(context);
    return Directionality(
        textDirection:     themeChange.locale.languageCode  =="en"? ui.TextDirection.ltr: ui.TextDirection.rtl,
        child: Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,


        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            exploreTopBar(bookMarkTap: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) =>  BookmarkedOccasion()),
              );
            },
            context: context,
              filterTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>  FilterView()),
                );
              },
              onChange: (val){}
            ),
            SizedBox(height: 16,),
            exploreCategory(context: context),
            SizedBox(height: 16,),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 8,),
                  rowData(
                      context: context,
                      title: AppLocalizations.of(context).recommended,
                      onTap: () {}),
                  SizedBox(height: 16,),
                  SizedBox(
                    height: 232,
                    child: ListView.builder(
                        itemCount: 3,
                        shrinkWrap: true,
                        primary: false,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext context, int index) {
                          return GestureDetector(
                            onTap: (){
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) =>  ExploreDetailView()),
                              );
                            },
                            child: Padding(
                              padding:
                              themeChange.locale.languageCode  !="en"?
                              EdgeInsets.only(left: 16,right: index==0?16:0):     EdgeInsets.only(left: index==0?16:0,right: 16),
                              child: recommendedWidget(image: "",
                                  context: context,
                                  title: "Birthday Celebration",
                                  userImage: "",
                                  userName: "Maggie Smith",
                                  view: "100",
                                  fav: "10",
                                  bookMarkImage: "assets/icons/bookmark.svg",
                                  onTapSave: (){}

                              ),
                            ),
                          );
                        }),
                  ),
                  SizedBox(height: 24,),
                  Divider(color:

                  AppLightColors.dividerColor,
                    height: 1
                    ,),
                  SizedBox(height: 16,),
                  ListView.builder(
                      itemCount: 3,
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
                            padding: EdgeInsets.only(left:16,right: 16,top: 10,bottom: 10),
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
                  SizedBox(height: 20,),
                ],
              ),
            ),
          )
          ],
        ),
      ),
    );
  }
}
