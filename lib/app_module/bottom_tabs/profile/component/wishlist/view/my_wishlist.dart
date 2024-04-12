import 'package:bomjour/app_module/bottom_tabs/profile/component/wishlist/component/add_wishlist.dart';
import 'package:bomjour/app_module/bottom_tabs/profile/component/profile_component.dart';
import 'package:bomjour/utils/app_common_widgets/app_text.dart';
import 'package:bomjour/utils/app_constants/app_config.dart';
import 'package:bomjour/utils/app_constants/localization.dart';
import 'package:bomjour/utils/app_themes/app_colors.dart';
import 'package:bomjour/utils/dark_theme_provider/dark_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:flutter_svg/svg.dart';

import 'dart:ui' as ui;

class MyWishlistView extends StatelessWidget {
  const MyWishlistView({super.key});

  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<ThemeLocalizationProvider>(context);
    return Directionality(
        textDirection: themeChange.locale.languageCode == "en"
            ? ui.TextDirection.ltr
            : ui.TextDirection.rtl,
        child: Scaffold(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          body: Column(
            children: [
              appBarProfile(
                context: context,
                title: AppLocalizations.of(context).myWish,
                thickness: 2
              ),

              Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        GestureDetector(
                          onTap:(){
                  Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>  NewWishlist()),
                  );
                  },
                          child: Container(
                            width: AppConfig(context).width,
                            height: 70,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 16),
                              child: Row(
                                children: [
                                  SvgPicture.asset("assets/icons/add_circle.svg"),
                                  SizedBox(width: 10,),
                                  AppText(
                                    text:
                                    AppLocalizations.of(context).newWishlist,
                                    size: 16,
                                    fontWeight: FontWeight.w500,
                                    color:
                                    themeChange.darkTheme?AppLightColors.greyColorWish:
                                    AppLightColors.black_color,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Divider(color:
                        themeChange.darkTheme?AppLightColors.black_color:
                        AppLightColors.dividerColor,height: 0,),
                        ListView.builder(
                            padding: EdgeInsets.only(top: 10),
                            shrinkWrap: true,
                            primary: false,
                            itemCount: 10,
                            itemBuilder: (BuildContext context, int index) {
                              return Padding(
                                padding: const EdgeInsets.symmetric(vertical: 10),
                                child: Column(
                                  children: [
                                    Padding(
                                      padding:  EdgeInsets.symmetric(horizontal: 16),
                                      child: SizedBox(
                                        height:78,
                                        child: Row(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                              height: 78,
                                              width: 78,
                                              child: ClipRRect(
                                                borderRadius: BorderRadius.circular(10),
                                                child:CachedNetworkImage(
                                                  placeholder: (context, url) =>   Center(
                                                    child: SpinKitThreeBounce(
                                                        size: 16,
                                                        color: AppLightColors.primary_color
                                                    ),
                                                  ),
                                                  imageUrl:    "",
                                                  fit: BoxFit.cover,

                                                  errorWidget: (context, url, error) =>

                                                      ClipRRect(
                                                        borderRadius: BorderRadius.circular(10),
                                                        child: Image.asset(
                                                          "assets/images/dummy5.png",
                                                          fit: BoxFit.cover,

                                                        ),
                                                      ),
                                                ),


                                              ),
                                            ),
                                            SizedBox(width: 10,),
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  AppText(
                                                    text:
                                                        "For Zainab’s ${AppLocalizations.of(context).birthday}",
                                                    size: 16,
                                                    fontWeight: FontWeight.w500,
                                                    color: Theme.of(context).primaryColor,
                                                  ),
                                                  SizedBox(
                                                    height: 3,
                                                  ),
                                                  AppText(
                                                    text:  AppLocalizations.of(context).public,
                                                    size: 12,
                                                    fontWeight: FontWeight.w400,
                                                    color: AppLightColors.greenColor,
                                                  ),
                                                  Spacer(),
                                                  AppText(
                                                    text: "16 ${AppLocalizations.of(context).peopleJoined}",
                                                    size: 11,
                                                    fontWeight: FontWeight.w400,
                                                    color:   themeChange.darkTheme?AppLightColors.greyColorWish:
                                                    AppLightColors.textField_back_dark,
                                                  ),

                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 18,),
                                    Divider(color:
                                    themeChange.darkTheme?AppLightColors.black_color:
                                    AppLightColors.dividerColor,height: 0,),
                                  ],
                                ),
                              );
                            }),
                      ],
                    ),
                  )),
            ],
          ),
        ));
  }
}
