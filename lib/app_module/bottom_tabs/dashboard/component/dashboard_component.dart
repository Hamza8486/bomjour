
import 'package:bomjour/utils/app_common_widgets/app_text.dart';
import 'package:bomjour/utils/app_constants/app_config.dart';
import 'package:bomjour/utils/app_constants/app_images.dart';
import 'package:bomjour/utils/app_constants/localization.dart';
import 'package:bomjour/utils/app_padding/app_paddings.dart';
import 'package:bomjour/utils/app_themes/app_colors.dart';
import 'package:bomjour/utils/dark_theme_provider/dark_theme.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

 import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

Widget rowData({required BuildContext context,String title  ="",onTap,double?padding}){

  return   Padding(
    padding: AppPaddings.symmetricPadding(horizontalPadding: padding??AppConfig(context).width*0.04,
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        AppText(
          text:title,
          size: 20,
          fontWeight: FontWeight.w500,
          color: Theme.of(context).primaryColor,
        ),
        GestureDetector(
          onTap: onTap,
          child: Container(
            color: Colors.transparent,
            child: AppText(
              text: AppLocalizations.of(context).viewAll,
              size: 10,
              fontWeight: FontWeight.w400,
              color:AppLightColors.primary_color,
            ),
          ),
        ),

      ],
    ),
  );
}

Widget giftCommonWidget({required BuildContext context,String ?image,bool sale=false,bool discount=false,
  Widget?like,
  double?width,
String ?title, String? price, String ? discountPrice, String ? rating
}){
  final themeChange = Provider.of<ThemeLocalizationProvider>(context);
  return  Column(

    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Container(
        height: 225,
        width:width?? 167,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
                image:
                CachedNetworkImageProvider(
                  image.toString(),

                ) ,
                fit: BoxFit.cover
            )
        ),

        child:  Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            Padding(
              padding:
        themeChange.locale.languageCode == "en"?
              EdgeInsets.only(top: 8,right:

              8): EdgeInsets.only(top: 8,left:

  8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,

                children: [
                  sale?
                  Container(
                    width:60,
                    decoration: BoxDecoration(
                        color: AppLightColors.primary_color

                    ),
                    child: Center(
                      child: AppText(
                        text: "SALE",
                        size: 11,
                        maxline: 2,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                  ):SizedBox.shrink(),
                  like??
                  SvgPicture.asset(AppImages.disLike)
                ],
              ),
            ),
          ],
        ),
      ),
      SizedBox(height:AppConfig(context).height*0.01 ,),
      AppText(
        text: title.toString(),
        size: 13,
        maxline: 2,
        textAlign: TextAlign.start,
        fontWeight: FontWeight.w500,
        color: Theme.of(context).primaryColor,
      ),
      SizedBox(height:AppConfig(context).height*0.005 ,),
      Row(
        children: [
          AppText(
            text: discountPrice.toString(),
            size: 12,
            fontWeight: FontWeight.w600,
            color: AppLightColors.primary_color,
          ),
          discount?
          SizedBox(width: 15,):SizedBox.shrink(),
          discount?
          AppText(
            text: price.toString(),
            underLine: TextDecoration.lineThrough,
            size: 12,
            fontWeight: FontWeight.w400,
            color: Theme.of(context).disabledColor,
          ):SizedBox.shrink(),
        ],
      ),
      SizedBox(height:AppConfig(context).height*0.005 ,),
      Row(
        children: [
          SvgPicture.asset("assets/icons/star.svg"),

          SizedBox(width: 8,),

          AppText(
            text: rating.toString(),
            size: 12,
            fontWeight: FontWeight.w700,
            color: Theme.of(context).primaryColor,
          ),
        ],
      ),
    ],
  );
}

Widget occasionCommonWidget({String ? image,String ? title,bool isNetwork=false}){
  return Container(
    height: 121,
    width: 121,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image:
        isNetwork==false?
        DecorationImage(
            image:AssetImage(image.toString()) ,
            fit: BoxFit.cover
        ): DecorationImage(
            image:
            NetworkImage(image.toString()),
            fit: BoxFit.cover
        )
    ),

    child:  Padding(
      padding:  EdgeInsets.only(bottom: 9),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.end,

        children: [
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: 6),
            child: Center(
              child: AppText(
                text: title.toString(),
                size: 14,
                textAlign: TextAlign.center,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
          ),

        ],
      ),
    ),
  );

}