
import 'package:bomjour/app_module/bottom_tabs/explore/controller/explore_controller.dart';
import 'package:bomjour/utils/app_common_widgets/app_text.dart';
import 'package:bomjour/utils/app_common_widgets/app_text_field.dart';
import 'package:bomjour/utils/app_constants/app_config.dart';
import 'package:bomjour/utils/app_constants/app_images.dart';
import 'package:bomjour/utils/app_constants/localization.dart';
import 'package:bomjour/utils/app_padding/app_paddings.dart';
import 'package:bomjour/utils/app_themes/app_colors.dart';
import 'package:bomjour/utils/dark_theme_provider/dark_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
 import 'package:provider/provider.dart';
 import 'package:flutter_svg/svg.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:readmore/readmore.dart';


Widget exploreTopBar({required BuildContext context,
  Function(String?)? onChange,
  VoidCallback? bookMarkTap,
  VoidCallback? filterTap,
  TextEditingController ?controller
}){
  var localization = AppLocalizations.of(context);
  final themeChange = Provider.of<ThemeLocalizationProvider>(context);
  return Container(width: double.infinity,
    height: 163,

    decoration: BoxDecoration(
      color:
      themeChange.darkTheme?AppLightColors.textField_back_dark:
      AppLightColors.textField_back_color,
      border: Border.all(color:   themeChange.darkTheme?AppLightColors.black_color:
      Colors.transparent, )
    ),
    child: Padding(
      padding: AppPaddings.onlyHorizontalPadding(padding: AppConfig(context).width*0.04),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: AppConfig(context).height*0.06,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6),
            child: Row(
              children: [
                AppText(
                  text:AppLocalizations.of(context)
                      .explore,
                  size: 16,
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.w600,
                ),
                Spacer(),
                GestureDetector(
                    onTap: bookMarkTap,
                    child: SvgPicture.asset("assets/icons/bookmark.svg",
                    color: Theme.of(context).primaryColor
                    )),
                SizedBox(width: 10,),
                GestureDetector(
                    onTap: filterTap,
                    child: SvgPicture.asset("assets/icons/filterIcon.svg",
                    color: Theme.of(context).primaryColor,
                    ))

              ],
            ),
          ),
          SizedBox(height: 16,),
          Row(
            children: [
              Expanded(
                child: appField(
                    context: context,


                    hint:localization
                        .searchEvents,
                    hintSize: 14,
                    controller: controller,
                    border:
                    themeChange.darkTheme?AppLightColors.black_color:
                    AppLightColors.border_color,
                    borderRadius: BorderRadius.circular(100),



                    isPrefix: true,
                    onChange: onChange,

                    hintColor:   AppLightColors.border_color,
                    fillColor:
                    themeChange.darkTheme?
                    AppLightColors.textField_back_dark: AppLightColors.white_color,
                    textInputAction: TextInputAction.done,
                    child1: Column(
                      crossAxisAlignment: CrossAxisAlignment
                      .center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(AppImages.search_icon,
                        height: 20,
                          width: 20,

                        ),
                      ],
                    )
                ),
              ),

            ],
          ),
        ],
      ),
    ),

  );

}


Widget exploreCategory({required BuildContext context}){
  final exploreController = Provider.of<ExploreController>(context);
  final themeChange = Provider.of<ThemeLocalizationProvider>(context);
  return SizedBox(
    height: 42,
    child: ListView.builder(
        itemCount: 5,
        shrinkWrap: true,
        primary: false,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: (){
              exploreController.updateSelectedId(index);
            },
            child: Padding(
              padding:
              themeChange.locale.languageCode  !="en"?
              EdgeInsets.only(left: 8,right: index==0?16:0): EdgeInsets.only(left: index==0?16:0,right: 8),
              child: Container(
                height: 42,

                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    border: Border.all(color: themeChange.darkTheme?AppLightColors.black_color:Colors.transparent ),
                    color:
                    exploreController.selectId==index?

                    AppLightColors.primary_color:
                    themeChange.darkTheme?AppLightColors.textField_back_dark:
                    AppLightColors.rewardBoxColor

                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Center(
                    child: AppText(
                      text:"All Events",
                      size: 15,
                      color: exploreController.selectId==index?

                      themeChange.darkTheme?AppLightColors.textField_back_dark:
                      AppLightColors.white_color:
                      themeChange.darkTheme?AppLightColors.white_color:
                      AppLightColors.black_color,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
          );
        }),
  );
}

Widget recommendedWidget({String image="",String title="",
  String userImage="",String userName="",String view="",
  String fav="",
  onTapSave,
  String bookMarkImage="",
  double?width,
  required BuildContext context

}){
  final themeChange = Provider.of<ThemeLocalizationProvider>(context);

  return SizedBox(
    height: 232,
    width:width?? 285,


    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            SizedBox(
              height: 174,
              width: width??285,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: CachedNetworkImage(
                  placeholder: (context, url) => Center(
                    child: SpinKitThreeBounce(
                        size: 16,
                        color: AppLightColors.primary_color),
                  ),
                  imageUrl:image,
                  fit: BoxFit.cover,
                  errorWidget: (context, url, error) => ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      "assets/images/dummy10.png",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
                top: 16,right: 16,
                child: exploreIconWidget(image: bookMarkImage,
                onTap: onTapSave
                ))
          ],
        ),
        SizedBox(height: 10,),
        AppText(
          text:title,
          size: 14,
          color:  Theme.of(context).primaryColor,
          fontWeight: FontWeight.w500,
        ),
        SizedBox(height: 6,),
        Row(
          children: [
            SizedBox(
              height: 20,
              width: 20,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: CachedNetworkImage(
                  placeholder: (context, url) => Center(
                    child: SpinKitThreeBounce(
                        size: 16,
                        color: AppLightColors.primary_color),
                  ),
                  imageUrl: userImage,
                  fit: BoxFit.cover,
                  errorWidget: (context, url, error) => ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      "assets/images/person.png",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(width: 10,),
            AppText(
              text:userName,
              size: 12,
              color:  Theme.of(context).primaryColor,
              fontWeight: FontWeight.w400,
            ),
            Spacer(),
            SvgPicture.asset("assets/icons/fav.svg",
            color:
            themeChange.darkTheme?AppLightColors.white_color:
            AppLightColors.label_color,
            ),
            SizedBox(width: 3,),
            AppText(
              text:fav,
              size: 12,
              color: themeChange.darkTheme?AppLightColors.white_color:
              AppLightColors.greyColorWish,
              fontWeight: FontWeight.w400,
            ),
            SizedBox(width: 10,),
            SvgPicture.asset("assets/icons/view.svg",
              color:
              themeChange.darkTheme?AppLightColors.white_color:
              AppLightColors.label_color,
            ),

            SizedBox(width: 3,),
            AppText(
              text:view,
              size: 12,
              color:
              themeChange.darkTheme?AppLightColors.white_color:
              AppLightColors.greyColorWish,
              fontWeight: FontWeight.w400,
            ),
          ],
        ),
      ],
    ),
  );
}

Widget exploreIconWidget({String image="",bool imageAsset=false, onTap }){

  return  GestureDetector(
    onTap: onTap,
    child: Container(
      height: 28,
      width: 28,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: AppLightColors.white_color.withOpacity(0.4)

      ),
      child:      Center(
        child:
        imageAsset?
        Image.asset(image,
          color: Colors.white,
          height: 16,
          width: 16,
        ): SvgPicture.asset(image,
          color: Colors.white,
          height: 16,
          width: 16,
        ),
      ),
    ),
  );
}

Widget exploreDetailTopBar({required BuildContext context,
inviteTap,
  bookmarkTap,
  favTap,
  String favImage="",
  String bookMark="",
}){
  return Container(width: double.infinity,
    height: 246,
    decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage("assets/images/dummy10.png"),
            fit: BoxFit.cover


        )
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: AppConfig(context).height*0.06,),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              GestureDetector(
                  onTap: (){
                    Navigator.pop(context);
                  },
                  child: SvgPicture.asset('assets/icons/backs.svg',
                    color: Colors.white,
                  )),
              Spacer(),
              exploreIconWidget(image: "assets/icons/invite.svg",
              onTap: inviteTap
              ),

              SizedBox(width: 15,),
              exploreIconWidget(image: favImage,
                  onTap: favTap,
                imageAsset: true
              ),

              SizedBox(width: 15,),
              exploreIconWidget(image: bookMark,
                  onTap: bookmarkTap,

              ),

            ],
          ),
        ),


      ],
    ),

  );
}


Widget activityWidget({required BuildContext context,String time="",
  String loc="",
  String title=""

}){
  final themeChange = Provider.of<ThemeLocalizationProvider>(context);
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      AppText(
        text:time,
        size: 12,
        color: Theme.of(context).primaryColor,
        fontWeight: FontWeight.w400,
      ),
      SizedBox(width:
      10,),
      Expanded(child: Container(
        decoration: BoxDecoration(
            color:
            themeChange.darkTheme?AppLightColors.textField_back_dark:
            AppLightColors.profileBackColor,
            border: Border.all(color:themeChange.darkTheme?AppLightColors.black_color
                :
            AppLightColors.transparent_color, ),
            borderRadius: BorderRadius.circular(10)
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppText(
                text:title,
                size: 14,
                color: Theme.of(context).primaryColor,
                fontWeight: FontWeight.w400,
              ),
              SizedBox(height: 4,),
              Row(

                children: [
                  SvgPicture.asset("assets/icons/pinLine.svg",
                  color: themeChange.darkTheme?AppLightColors.white_color:AppLightColors.textField_back_dark,
                  ),
                  SizedBox(width: 5,),
                  Expanded(
                    child: Align(
                      alignment:
                      themeChange.locale.languageCode == "en"?
                      Alignment.topLeft: Alignment.topRight,
                      child: AppText(
                        text:loc,
                        size: 12,
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),))
    ],
  );
}

Widget exploreDescription({String des="",required BuildContext context}){
  final themeChange = Provider.of<ThemeLocalizationProvider>(context);
   return   ReadMoreText(
     des,
     trimLines: 2,
     colorClickableText: Colors.pink,
     trimMode: TrimMode.Line,
     style: GoogleFonts.poppins(
         textStyle: TextStyle(
           color:
           themeChange.darkTheme?AppLightColors.white_color:
           AppLightColors.label_color,
           fontSize: 12,
           fontWeight: FontWeight.w400,
         )),
     trimCollapsedText: 'Read more...',
     trimExpandedText: 'Read less.',
     lessStyle: GoogleFonts.poppins(
         textStyle: TextStyle(
           color: AppLightColors.primary_color,
           fontSize: 12,
           fontWeight: FontWeight.w600,
         )),
     moreStyle: GoogleFonts.poppins(
         textStyle: TextStyle(
           color:

           AppLightColors.primary_color,
           fontSize: 12,
           fontWeight: FontWeight.w600,
         )),
   );
}