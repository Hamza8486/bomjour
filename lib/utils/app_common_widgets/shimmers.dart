


import 'package:bomjour/utils/app_constants/app_config.dart';
import 'package:bomjour/utils/app_padding/app_paddings.dart';
import 'package:bomjour/utils/app_themes/app_colors.dart';
import 'package:bomjour/utils/dark_theme_provider/dark_theme.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:provider/provider.dart';


Widget catEffect({required BuildContext context}){

  final themeChange = Provider.of<ThemeLocalizationProvider>(context);
  return SizedBox(
    height: 95,
    child: ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: 7,
        shrinkWrap: true,
        primary: false,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding:
            themeChange.locale.languageCode == "en"?
            AppPaddings.onlyPadding(left:
            index==0? AppConfig(context).width*0.04:
            AppConfig(context).width*0.03,
            ):AppPaddings.onlyPadding(right:
            index==0? AppConfig(context).width*0.04:
            AppConfig(context).width*0.03,
            ),
            child:  Shimmer.fromColors(
              baseColor:
              themeChange.darkTheme?
              Colors.grey[400]!:Colors.grey[300]!,
              highlightColor: themeChange.darkTheme?
              Colors.grey[200]!:Colors.grey[100]!,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                        color: Colors.white,


                        shape: BoxShape.circle


                    ),
                  ),

                  SizedBox(height:9 ,),

                  Center(
                    child: Container(
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),    color: Colors.white,),
                      width: AppConfig(context).width*0.18,
                      height: 9.0,

                    ),
                  ),


                ],
              ),
            ),
          );
        }
    ),
  );




}

getShimmerAllLoading({required BuildContext context,double?width}) {
  final themeChange = Provider.of<ThemeLocalizationProvider>(context);
  return SizedBox(
    height: 330,
    child: ListView.builder(
        padding:  EdgeInsets.zero,
        itemCount: 7,
        shrinkWrap: true,
        primary: false,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          return  Shimmer.fromColors(
            baseColor:
            themeChange.darkTheme?
            Colors.grey[400]!:Colors.grey[300]!,
            highlightColor: themeChange.darkTheme?
            Colors.grey[300]!:Colors.grey[100]!,
            child:Padding(
              padding:   themeChange.locale.languageCode == "en"?
              AppPaddings.onlyPadding(left:
              index==0? AppConfig(context).width*0.04:
              AppConfig(context).width*0.02,
              ):AppPaddings.onlyPadding(right:
              index==0? AppConfig(context).width*0.04:
              AppConfig(context).width*0.02,
              ),
              child: SizedBox(
                width: 167,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,

                          borderRadius: BorderRadius.circular(10)),
                      height: 225,
                      width:167,

                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: width??100,
                          height: 10.0,
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(6),
                            color: Colors.white,
                          ),

                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          width:width?? 100,
                          height: 10.0,
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(6),
                            color: Colors.white,

                          ),

                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          width:width?? 50,
                          height: 10.0,
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(6),
                            color: Colors.white,
                          ),

                        ),

                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        }
    ),
  );





}




getShimmerBestEffect({required BuildContext context}) {
  final themeChange = Provider.of<ThemeLocalizationProvider>(context);
  return SizedBox(
    height: 190,
    child: ListView.builder(
        padding:  EdgeInsets.zero,
        itemCount: 7,
        shrinkWrap: true,
        primary: false,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          return  Shimmer.fromColors(
            baseColor:
            themeChange.darkTheme?
            Colors.grey[400]!:Colors.grey[300]!,
            highlightColor: themeChange.darkTheme?
            Colors.grey[300]!:Colors.grey[100]!,
            child:Padding(
              padding:   themeChange.locale.languageCode == "en"?
              AppPaddings.onlyPadding(left:
              index==0? AppConfig(context).width*0.04:
              AppConfig(context).width*0.02,
              ):AppPaddings.onlyPadding(right:
              index==0? AppConfig(context).width*0.04:
              AppConfig(context).width*0.03,
              ),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,

                    borderRadius: BorderRadius.circular(10)),
                height: 190,
                width: 120,

              ),
            ),
          );
        }
    ),
  );





}



getShimmerTrendingEffect({required BuildContext context}) {
  final themeChange = Provider.of<ThemeLocalizationProvider>(context);
  return SizedBox(
    height: 121,

    child: ListView.builder(
        padding:  EdgeInsets.zero,
        itemCount: 7,
        shrinkWrap: true,
        primary: false,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          return  Shimmer.fromColors(
            baseColor:
            themeChange.darkTheme?
            Colors.grey[400]!:Colors.grey[300]!,
            highlightColor: themeChange.darkTheme?
            Colors.grey[300]!:Colors.grey[100]!,
            child:Padding(
              padding:   themeChange.locale.languageCode == "en"?
              AppPaddings.onlyPadding(left:
              index==0? AppConfig(context).width*0.04:
              AppConfig(context).width*0.02,
              ):AppPaddings.onlyPadding(right:
              index==0? AppConfig(context).width*0.04:
              AppConfig(context).width*0.03,
              ),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,

                    borderRadius: BorderRadius.circular(10)),
                height: 121,
                width: 121,

              ),
            ),
          );
        }
    ),
  );





}



getShimmerCustomizeEffect({required BuildContext context}) {
  final themeChange = Provider.of<ThemeLocalizationProvider>(context);
  return SizedBox(
    height: 216,

    child: ListView.builder(
        padding:  EdgeInsets.zero,
        itemCount: 7,
        shrinkWrap: true,
        primary: false,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          return  Shimmer.fromColors(
            baseColor:
            themeChange.darkTheme?
            Colors.grey[400]!:Colors.grey[300]!,
            highlightColor: themeChange.darkTheme?
            Colors.grey[300]!:Colors.grey[100]!,
            child:Padding(
              padding:   themeChange.locale.languageCode == "en"?
              AppPaddings.onlyPadding(left:
              index==0? AppConfig(context).width*0.04:
              AppConfig(context).width*0.02,
              ):AppPaddings.onlyPadding(right:
              index==0? AppConfig(context).width*0.04:
              AppConfig(context).width*0.03,
              ),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,

                    borderRadius: BorderRadius.circular(10)),
                height: 216,
                width: 320,

              ),
            ),
          );
        }
    ),
  );





}


getShimmerAddressEffect({required BuildContext context}) {
  final themeChange = Provider.of<ThemeLocalizationProvider>(context);
  return ListView.builder(
      padding:  EdgeInsets.zero,
      itemCount: 7,
      shrinkWrap: true,
      primary: false,
      itemBuilder: (BuildContext context, int index) {
        return

          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 16),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: AppLightColors.dividerColor)
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 10,right: 10,bottom: 15,top: 5),
                child: Shimmer.fromColors(
                  baseColor:
                  themeChange.darkTheme?
                  Colors.grey[400]!:Colors.grey[300]!,
                  highlightColor: themeChange.darkTheme?
                  Colors.grey[300]!:Colors.grey[100]!,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            const SizedBox(
                              height: 10,
                            ),
                            Container(
                              width: double.infinity,
                              height: 14.0,
                              color: Colors.white,
                            ),
                            const SizedBox(
                              height: 13,
                            ),
                            Container(
                              width: double.infinity,
                              height: 14.0,
                              color: Colors.white,
                            ),
                            const SizedBox(
                              height: 13,
                            ),
                            Container(
                              width: double.infinity,
                              height: 14.0,
                              color: Colors.white,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
      }
  );





}


Widget giftShopEffect({required BuildContext context}){

  final themeChange = Provider.of<ThemeLocalizationProvider>(context);
  return SizedBox(
    height: 135,
    child: ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: 7,
        shrinkWrap: true,
        primary: false,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding:
            themeChange.locale.languageCode == "en"?
            AppPaddings.onlyPadding(left:
            index==0? AppConfig(context).width*0.04:
            AppConfig(context).width*0.03,
            ):AppPaddings.onlyPadding(right:
            index==0? AppConfig(context).width*0.04:
            AppConfig(context).width*0.03,
            ),
            child:  Shimmer.fromColors(
              baseColor:
              themeChange.darkTheme?
              Colors.grey[400]!:Colors.grey[300]!,
              highlightColor: themeChange.darkTheme?
              Colors.grey[200]!:Colors.grey[100]!,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 100,
                    width: 164,
                    decoration: BoxDecoration(
                        color: Colors.white,


                      borderRadius: BorderRadius.circular(10),


                    ),
                  ),

                  SizedBox(height:9 ,),

                  Center(
                    child: Container(
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),    color: Colors.white,),
                      width: 150,
                      height: 9.0,

                    ),
                  ),


                ],
              ),
            ),
          );
        }
    ),
  );




}


getShimmerWishListEffect({required BuildContext context}) {
  final themeChange = Provider.of<ThemeLocalizationProvider>(context);
  return ListView.builder(
      padding:  EdgeInsets.only(top: 10),

      itemCount: 7,
      shrinkWrap: true,
      primary: false,
      itemBuilder: (BuildContext context, int index) {
        return

          Shimmer.fromColors(
            baseColor:
            themeChange.darkTheme?
            Colors.grey[400]!:Colors.grey[300]!,
            highlightColor: themeChange.darkTheme?
            Colors.grey[300]!:Colors.grey[100]!,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Column(
                children: [
                  SizedBox(
                    height: 125,
                    child: Padding(
                      padding:  EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),    color: Colors.white,),
                            height: 125,
                            width: 96,

                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                const SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  width: double.infinity,
                                  height: 16.0,
                                  color: Colors.white,
                                ),
                                const SizedBox(
                                  height: 13,
                                ),
                                Container(
                                  width: double.infinity,
                                  height: 16.0,
                                  color: Colors.white,
                                ),
                                const SizedBox(
                                  height: 13,
                                ),

                                Container(
                                  width: double.infinity,
                                  height: 16.0,
                                  color: Colors.white,
                                ),
                                const SizedBox(
                                  height: 13,
                                ),

                                Container(
                                  width: double.infinity,
                                  height: 16.0,
                                  color: Colors.white,
                                ),

                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 18,),
                  Divider(color: AppLightColors.dividerColor,height: 0,),
                ],
              ),
            ),
          );
      }
  );





}