import 'package:bomjour/app_module/product_detail_page/model/product_detail_model.dart';
import 'package:bomjour/utils/app_common_widgets/app_text.dart';
import 'package:bomjour/utils/app_themes/app_colors.dart';
import 'package:bomjour/utils/dark_theme_provider/dark_theme.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:readmore/readmore.dart';
import 'package:provider/provider.dart';
import 'dart:ui' as ui;
import 'package:flutter_svg/svg.dart';

Widget buttonCart({removeTap, addTap, value, required BuildContext context}) {
  final themeChange = Provider.of<ThemeLocalizationProvider>(context);
  return Container(
    width: 146,
    height: 50,
    decoration: BoxDecoration(
        color: AppLightColors.rewardBoxColor,
        borderRadius: BorderRadius.circular(24)),
    child: Padding(
      padding: const EdgeInsets.all(6.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: removeTap,
            child: Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                  color:
                  themeChange.darkTheme?AppLightColors.black_color:
                  AppLightColors.white_color,
                  shape: BoxShape.circle,
                  border:
                      Border.all(color: AppLightColors.dividerColor, width: 3)),
              child: Icon(
                Icons.remove,
                color:
                themeChange.darkTheme?AppLightColors.white_color:
                AppLightColors.greyColorWish,

                size: 16,
              ),
            ),
          ),
          AppText(
            text: value.toString(),
            size: 16,
            color:AppLightColors.black_color,
            fontWeight: FontWeight.w500,
          ),
          GestureDetector(
            onTap: addTap,
            child: Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                  color:  themeChange.darkTheme?AppLightColors.black_color:
                  AppLightColors.white_color,
                  shape: BoxShape.circle,
                  border:
                      Border.all(color: AppLightColors.dividerColor, width: 3)),
              child: Icon(
                Icons.add,
                color:
                themeChange.darkTheme?AppLightColors.white_color:
                AppLightColors.greyColorWish,
                size: 16,
              ),
            ),
          )
        ],
      ),
    ),
  );
}

Widget readMoreText({title}) {
  return ReadMoreText(
    title,
    trimLines: 3,
    colorClickableText: Colors.pink,
    trimMode: TrimMode.Line,
    style: GoogleFonts.poppins(
        textStyle: TextStyle(
      color: AppLightColors.label_color,
      fontSize: 16,
      fontWeight: FontWeight.w400,
    )),
    trimCollapsedText: 'More Detail',
    trimExpandedText: 'Less Detail',
    lessStyle: GoogleFonts.poppins(
        textStyle: TextStyle(
      color: AppLightColors.primary_color,
      fontSize: 16,
      fontWeight: FontWeight.w600,
    )),
    moreStyle: GoogleFonts.poppins(
        textStyle: TextStyle(
      color: AppLightColors.primary_color,
      fontSize: 16,
      fontWeight: FontWeight.w600,
    )),
  );
}

Widget topBar(
    {required CarouselController carouselController,
    dynamic Function(int, CarouselPageChangedReason)? onPageChanged,
    bool isShowDiscount = false,
    String? discount,
    required List <Images>bannerList,
      required BuildContext context,
    int current = 0}) {
  final themeChange = Provider.of<ThemeLocalizationProvider>(context);
  return Stack(
    children: [
      CarouselSlider(
        carouselController: carouselController,
        options: CarouselOptions(
          aspectRatio: 16 / 9,
          pageSnapping: false,
          height: 333,
          viewportFraction: 1,
          initialPage: 0,
          enableInfiniteScroll: true,
          pauseAutoPlayInFiniteScroll: false,
          reverse: true,
          autoPlay: true,
          autoPlayInterval: const Duration(seconds: 3),
          autoPlayAnimationDuration: const Duration(milliseconds: 400),
          autoPlayCurve: Curves.fastOutSlowIn,
          enlargeCenterPage: true,
          scrollDirection: Axis.horizontal,
          onPageChanged: onPageChanged,
          enlargeStrategy: CenterPageEnlargeStrategy.height,
        ),
        items: bannerList
            .map((item) => GestureDetector(
                  onTap: () {},
                  child: Container(
                    child: Image.network(
                      item.productImage.toString(),
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                ))
            .toList(),
      ),
      Positioned(
          right: 0,
          left: 0,
          bottom: 15,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: bannerList.asMap().entries.map((entry) {
              return GestureDetector(
                onTap: () => carouselController.animateToPage(entry.key),
                child: Container(
                  width: 25.0,
                  height: 4.0,
                  margin: const EdgeInsets.symmetric(
                      vertical: 8.0, horizontal: 4.0),
                  decoration: BoxDecoration(
                      color: current == entry.key
                          ? AppLightColors.primary_color
                          :
                      themeChange.darkTheme?AppLightColors.black_color:
                      AppLightColors.white_color),
                ),
              );
            }).toList(),
          )),
      Positioned(
          left: 18,
          top: 50,
          child:GestureDetector(
              onTap: (){
                Navigator.pop(context);
              },
              child: SvgPicture.asset('assets/icons/backs.svg',
              color: Colors.white,
              )),),
      isShowDiscount
          ? Positioned(
          right: 18,
          top: 50,
              child: Row(
                children: [
                  Container(
                    width: 97,
                    height: 38,
                    decoration: BoxDecoration(
                        color: AppLightColors.primary_color,
                        borderRadius: BorderRadius.circular(8)),
                    child: Center(
                      child: AppText(
                        text: "${discount.toString()}% Off",
                        size: 15,
                        color:
                        themeChange.darkTheme?AppLightColors.black_color:
                        AppLightColors.white_color,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ))
          : SizedBox.shrink()
    ],
  );
}


Widget wrapComp({image,Color?color,onTap}){

  return GestureDetector(
    onTap:onTap ,
    child: Container(
      height: 110,
      width: 110,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color:color?? AppLightColors.primary_color,
          width: 1.5
          )
          // image: DecorationImage(
          //     image: NetworkImage(image) ,
          //     fit: BoxFit.cover
          // )
      ),

      child:  Stack(



        children: [
          SizedBox(
            height: 110,
            width: 110,
            child:  ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child:CachedNetworkImage(
                placeholder: (context, url) =>   Center(
                  child: SpinKitThreeBounce(
                      size: 16,
                      color: AppLightColors.primary_color
                  ),
                ),
                imageUrl:    image,
                fit: BoxFit.cover,

                errorWidget: (context, url, error) =>

                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        "assets/images/dummy1.png",
                        fit: BoxFit.cover,

                      ),
                    ),
              ),


            ),
          ),

          // Padding(
          //   padding:  EdgeInsets.all(10.0),
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.end,
          //     children: [
          //       Container(
          //
          //         height: 26,
          //         decoration: BoxDecoration(
          //             color: AppLightColors.primary_color,
          //             borderRadius: BorderRadius.circular(100)
          //         ),
          //         child: Padding(
          //           padding: const EdgeInsets.symmetric(horizontal: 8),
          //           child: Center(
          //             child: Row(
          //               mainAxisAlignment: MainAxisAlignment.center,
          //               children: [
          //                 Icon(Icons.add,size: 15,
          //                 color: Colors.white,
          //                 ),
          //                 AppText(
          //                   text:"43",
          //                   size: 14,
          //                   textAlign: TextAlign.center,
          //                   fontWeight: FontWeight.w500,
          //                   color: Colors.white,
          //                 ),
          //               ],
          //             ),
          //           ),
          //         ),
          //       ),
          //     ],
          //   ),
          // ),

        ],
      ),
    ),
  );
}


Widget backButton({required BuildContext context,Color?color}) {
  return GestureDetector(
    onTap:
            () {
          Navigator.pop(context);
        },
    child: Container(
      height: 49,
      width: 48,

      decoration: BoxDecoration(
          shape: BoxShape.circle, color:color??AppLightColors.border_color.withOpacity(0.1)),
      child: Padding(
        padding: EdgeInsets.only(bottom: 13,top: 13,right: 13,left: 10),
        child: SvgPicture.asset(
          "assets/icons/backs.svg",
          color: AppLightColors.primary_color,
        ),
      ),
    ),
  );
}