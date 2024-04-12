import 'package:bomjour/app_module/bottom_tabs/add_occasions/component/select_occasion_type.dart';
import 'package:bomjour/app_module/bottom_tabs/dashboard/controller/dashboard_controller.dart';
import 'package:bomjour/app_module/bottom_tabs/dashboard/view/dashboard_view.dart';
import 'package:bomjour/app_module/bottom_tabs/explore/view/explore_view.dart';
import 'package:bomjour/app_module/bottom_tabs/occcasions/view/occasions_view.dart';
import 'package:bomjour/app_module/bottom_tabs/profile/view/profile_view.dart';
import 'package:bomjour/app_module/filter_view/controller/filter_controller.dart';
import 'package:bomjour/app_module/home/controller/home_controller.dart';
import 'package:bomjour/app_module/prefrence/controller/prefrence_controller.dart';
import 'package:bomjour/utils/app_common_widgets/app_text.dart';
import 'package:bomjour/utils/app_constants/app_config.dart';
import 'package:bomjour/utils/app_constants/app_images.dart';
import 'package:bomjour/utils/app_constants/localization.dart';
import 'package:bomjour/utils/app_themes/app_colors.dart';
import 'package:bomjour/utils/dark_theme_provider/dark_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_svg/svg.dart';

import 'dart:ui' as ui;



class HomeView extends StatefulWidget {
  HomeView({super.key,this.currentIndex=0});
  int currentIndex;


  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {

  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = Dashboard();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await Provider.of<HomeController>(context,listen: false).fetchData(context: context);
      await  Provider.of<DashboardController>(context, listen: false).fetchData();
      await  Provider.of<FilterController>(context, listen: false).getAllSpecial();
      await  Provider.of<FilterController>(context, listen: false).getAllOccasion();
      await  Provider.of<PreferenceController>(context, listen: false).fetchData();
    });

  }

  @override
  Widget build(BuildContext context) {
    final isKeyBoard = MediaQuery.of(context).viewInsets.bottom != 0;
    var localization = AppLocalizations.of(context);
    final themeChange = Provider.of<ThemeLocalizationProvider>(context);
    return Directionality(
      textDirection:     themeChange.locale.languageCode  =="en"? ui.TextDirection.ltr: ui.TextDirection.ltr,
      child: Scaffold(
        body: PageStorage(
          child: currentScreen,
          bucket: bucket,
        ),
        resizeToAvoidBottomInset: true,
        floatingActionButton: isKeyBoard
            ? const SizedBox.shrink()
            : GestureDetector(
          onTap: () {
            setState(() {
              showModalBottomSheet(
                  backgroundColor: Colors.transparent,
                  isScrollControlled: true,
                  isDismissible: true,
                  context: context,
                  builder: (context) =>   SelectOccasionType());

              widget.currentIndex = 2;
            });
          },
          child: Padding(
            padding:  EdgeInsets.only(top: 60,left:  themeChange.locale.languageCode  =="en"?20:0,
              right: themeChange.locale.languageCode  =="en"?0:25
            ),
            child: SvgPicture.asset(
              "assets/icons/logo.svg",
              width: 48,
              height: 36,
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: SizedBox(
          width: AppConfig(context).width,
          height: 65,
          child: BottomAppBar(
            padding: EdgeInsets.zero,
            clipBehavior: Clip.none,
            notchMargin: 0,
            surfaceTintColor: themeChange.darkTheme?AppLightColors.bottom_dark_back:
            Color(0xffFCFCFC),
            shadowColor: themeChange.darkTheme?AppLightColors.bottom_dark_back:
            Color(0xffFCFCFC),


            color:  themeChange.darkTheme?AppLightColors.bottom_dark_back:
            Color(0xffFCFCFC),



            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  GestureDetector(
                    onTap:
                        (){
                      setState(() {
                        currentScreen =
                            Dashboard(); // if user taps on this dashboard tab will be active
                        widget.currentIndex = 0;
                      });
                    },
                    child: Container(
                      color: Colors.transparent,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          SvgPicture.asset(
                            AppImages.home,
                            height: 24,
                            width: 34,
                            color: widget.currentIndex==0?AppLightColors.primary_color:Theme.of(context).primaryColor,
                          ),
                          SizedBox(height: 3,),
                          AppText(
                            text: localization.home,
                            size: 12,

                            fontWeight: FontWeight.w400,
                            color:
                            widget.currentIndex==0?  AppLightColors.primary_color:

                            Theme.of(context).disabledColor,


                          ),

                        ],
                      ),
                    ),
                  ),




                  GestureDetector(
                    onTap:
                        (){
                      setState(() {
                        currentScreen =
                            OccasionsView();
                        widget.currentIndex = 1;
                      });
                    },
                    child: Container(
                      color: Colors.transparent,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          SvgPicture.asset(
                            AppImages.oc,
                            color: widget.currentIndex==1?AppLightColors.primary_color:Theme.of(context).primaryColor,
                          ),
                          SizedBox(height: 3,),
                          AppText(
                            text: localization.occ,
                            size: 12,

                            fontWeight: FontWeight.w400,
                            color:
                            widget.currentIndex==1?  AppLightColors.primary_color:

                            Theme.of(context).disabledColor,


                          ),

                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap:
                        (){

                    },
                    child: Container(
                      color: Colors.transparent,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          SvgPicture.asset(
                            AppImages.oc,
                            color: Colors.transparent,
                          ),
                          SizedBox(height: 3,),
                          AppText(
                            text: "local",
                            size: 12,

                            fontWeight: FontWeight.w400,
                            color:
                            Colors.transparent,


                          ),

                        ],
                      ),
                    ),
                  ),
               GestureDetector(
                 onTap:
                     (){
                   setState(() {
                     currentScreen =
                         ExploreView(

                         );
                     widget.currentIndex = 3;
                   });
                 },
                 child: Container(
                   color: Colors.transparent,
                   child: Column(
                     mainAxisAlignment: MainAxisAlignment.center,
                     children: <Widget>[
                       SvgPicture.asset(
                         AppImages.explore,
                         color: widget.currentIndex==3?AppLightColors.primary_color:Theme.of(context).primaryColor,
                       ),
                       SizedBox(height: 3,),
                       AppText(
                         text: localization.explore,
                         size: 12,

                         fontWeight: FontWeight.w400,
                         color:
                         widget.currentIndex==3?  AppLightColors.primary_color:

                         Theme.of(context).disabledColor,


                       ),

                     ],
                   ),
                 ),
               ),
               GestureDetector(
                 onTap:
                     (){
                   setState(() {
                     currentScreen =
                         ProfileView(); // if user taps on this dashboard tab will be active
                     widget.currentIndex = 4;
                   });
                 },
                 child: Container(
                   color: Colors.transparent,
                   child: Column(
                     mainAxisAlignment: MainAxisAlignment.center,
                     children: <Widget>[
                       SvgPicture.asset(AppImages.menu,
                         color: widget.currentIndex==4?AppLightColors.primary_color:Theme.of(context).primaryColor,
                       ),
                       SizedBox(height: 3,),
                       AppText(
                         text: localization.menu,
                         size: 12,

                         fontWeight: FontWeight.w400,
                         color:
                         widget.currentIndex==4?  AppLightColors.primary_color:

                         Theme.of(context).disabledColor,


                       ),

                     ],
                   ),
                 ),
               )

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
