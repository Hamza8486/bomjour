import 'package:bomjour/app_module/bottom_tabs/explore/components/explore_components.dart';
import 'package:bomjour/utils/app_common_widgets/app_button.dart';
import 'package:bomjour/utils/app_common_widgets/app_text.dart';
import 'package:bomjour/utils/app_constants/localization.dart';
import 'package:bomjour/utils/app_themes/app_colors.dart';
import 'package:bomjour/utils/dark_theme_provider/dark_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_stack/flutter_image_stack.dart';
import 'package:flutter_svg/svg.dart';

import 'package:provider/provider.dart';

class ExploreDetailView extends StatelessWidget {
  const   ExploreDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    var localization = AppLocalizations.of(context);
    final themeChange = Provider.of<ThemeLocalizationProvider>(context);
    return Scaffold(

      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  exploreDetailTopBar(context: context,
                  favImage: "assets/icons/love.png",
                    favTap: (){},
                    inviteTap: (){},
                    bookmarkTap: (){},
                    bookMark: "assets/icons/bookmark.svg",
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: [
                        SizedBox(height: 16,),
                        Row(
                          children: [
                            SvgPicture.asset("assets/icons/date.svg",

                              height: 12,
                              width: 12,
                            ),
                            SizedBox(width: 10,),
                            AppText(
                              text:"17 May 2022",
                              size: 12,
                              color: Theme.of(context).primaryColor,
                              fontWeight: FontWeight.w400,
                            ),
                          ],
                        ),
                        SizedBox(height: 8,),
                        AppText(
                          text:"Birthday Celebration",
                          size: 24,
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.w500,
                        ),
                        SizedBox(height: 6,),
                        AppText(
                          text:"Sharjah, United Arab Emirates",
                          size: 14,
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.w500,
                        ),
                        SizedBox(height: 8,),
                        Row(
                          children: [
                            FlutterImageStack(
                              imageList: ["assets/images/dummy12.png",
                                "assets/images/dummy12.png",
                                "assets/images/dummy12.png",

                              ],
                              showTotalCount: true,
                              totalCount: 3,
                              imageSource: ImageSource.asset,
                              itemRadius: 30, // Radius of each images
                              itemCount: 3, // Maximum number of images to be shown in stack
                              itemBorderWidth: 1, // Border width around the images
                            ),
                            SizedBox(width: 6,),
                            AppText(
                              text:"110 ${localization.people}",
                              size: 12,
                              color: Theme.of(context).primaryColor,
                              fontWeight: FontWeight.w400,
                            ),
                          ],
                        ),
                        SizedBox(height: 16,),
                        AppText(
                          text:localization.description,
                          size: 14,
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.w600,
                        ),
                        SizedBox(height: 10,),
                        exploreDescription(des: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, ',
                        context: context
                        ),
                        SizedBox(height: 16,),
                        AppText(
                          text:localization.Activities,
                          size: 14,
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.w600,
                        ),
                        SizedBox(height: 10
                          ,),
                        ListView.builder(
                            itemCount: 5,
                            shrinkWrap: true,
                            primary: false,
                            padding: EdgeInsets.zero,
                            itemBuilder: (BuildContext context, int index) {
                              return Padding(
                                padding: const EdgeInsets.symmetric(vertical: 5),
                                child: SizedBox(
                                  height: 86,
                                  child: activityWidget(context: context,
                                  title: "Brunch with family",
                                    time: "2:00 pm",
                                    loc: "Casa De Tapas"
                                  ),
                                ),
                              );
                            }),
                      ],
                    ),
                  )

                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16,right: 16,top: 10,bottom: 16),
            child: AppButton(

                buttonHeight: 55,
                buttonName: localization.AddToOccasion,
                borderColor:
                AppLightColors.primary_color,
                textSize: 16,
                buttonColor:
    AppLightColors.primary_color,
                textColor: AppLightColors.white_color,



                onTap: () {

                }),
          ),
        ],
      ),
    );
  }
}
