import 'package:bomjour/app_module/bottom_tabs/profile/component/profile_component.dart';
import 'package:bomjour/app_module/cart_view/cart_controller/cart_controller.dart';
import 'package:bomjour/app_module/home/view/home_view.dart';
import 'package:bomjour/utils/app_common_widgets/app_button.dart';
import 'package:bomjour/utils/app_common_widgets/app_text.dart';
import 'package:bomjour/utils/app_constants/localization.dart';
import 'package:bomjour/utils/app_themes/app_colors.dart';
import 'package:bomjour/utils/dark_theme_provider/dark_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';

import 'dart:ui' as ui;

class OrderStatusView extends StatelessWidget {
  OrderStatusView({super.key,this.data});
  var data;
  String getCurrentTime() {
    // Get the current time
    DateTime now = DateTime.now();

    // Format the time as "hh:mm a"
    String formattedTime = DateFormat('hh:mm a').format(now);

    return formattedTime;
  }
  String getCurrentDate() {
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('dd MMM yyyy').format(now);
    return formattedDate;
  }
  @override
  Widget build(BuildContext context) {
    getCurrentDate();
    final cartController = Provider.of<CartController>(context);
    final themeChange = Provider.of<ThemeLocalizationProvider>(context);
    return Directionality(
        textDirection:     themeChange.locale.languageCode  =="en"? ui.TextDirection.ltr: ui.TextDirection.rtl,
        child: PopScope(
          canPop: false,

          onPopInvoked: (val){
            cartController.updateQty(1);
            cartController.cartAddList.clear();
            cartController.clear();
            Navigator.push(
                context,
                MaterialPageRoute(builder: (context) =>  HomeView()));

          },
          child: Scaffold(
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                appBarProfile(context: context,
                    title: AppLocalizations.of(context).thankYou,
                    onTap: (){
                      cartController.cartAddList.clear();
                      cartController.clear();
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) =>  HomeView()),
                      );
                    }

                ),

                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 22,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Container(
                            height: 45,
                            decoration: BoxDecoration(
                            color: AppLightColors.primary_color,
                            borderRadius: BorderRadius.circular(7)
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(

                                  children: [
                                    SvgPicture.asset("assets/icons/verify.svg"),
                                    SizedBox(width: 10,),
                                    AppText(
                                      text: "${AppLocalizations.of(context).orderStatus}:",
                                      size: 14,
                                      textAlign: TextAlign.center,
                                      color:
                                      AppLightColors.white_color,
                                      fontWeight: FontWeight.w600,
                                    )
                                  ],
                                ),
                                AppText(
                                  text: "Pending",
                                  size: 14,
                                  textAlign: TextAlign.center,
                                  color:
                                  AppLightColors.white_color,
                                  fontWeight: FontWeight.w500,
                                )
                              ],
                            ),
                          ),
                          ),
                        ),
                        SizedBox(
                          height: 42,
                        ),
                       Container(decoration: BoxDecoration(
                         color: AppLightColors.white_color
                       ),
                       child: Column(
                         children: [
                           Padding(
                             padding: const EdgeInsets.symmetric(horizontal: 16),
                             child: Row(
                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
                               children: [
                                 AppText(
                                   text: "${AppLocalizations.of(context).date}: ${getCurrentDate()}",
                                   size: 14,
                                   textAlign: TextAlign.center,
                                   color:
                                   themeChange.darkTheme?
                                   AppLightColors.white_color:AppLightColors.greyColorWish,
                                   fontWeight: FontWeight.w600,
                                 ),
                                 AppText(
                                   text: "ID: ${data.toString()}",
                                   size: 14,
                                   textAlign: TextAlign.center,
                                   color:
                                   themeChange.darkTheme?
                                   AppLightColors.white_color:AppLightColors.greyColorWish,
                                   fontWeight: FontWeight.w600,
                                 )
                               ],
                             ),
                           ),
                           SizedBox(
                             height: 20,
                           ),
                           Divider(color: AppLightColors.otpLightColor,),
                           SizedBox(
                             height: 20,
                           ),
                           Padding(
                             padding: const EdgeInsets.symmetric(horizontal: 16),
                             child: Row(
                               children: [
                                 Container(
                                   height: 40,
                                   width: 40,
                                   decoration: BoxDecoration(
                                       shape: BoxShape.circle,
                                       color: AppLightColors.blue_light_colors
                                   ),
                                   child: Center(child: SvgPicture.asset("assets/icons/bag.svg")),
                                 ),
                                 SizedBox(width: 10,),
                                 Column(
                                   crossAxisAlignment: CrossAxisAlignment.start,
                                   children: [
                                     AppText(
                                       text: AppLocalizations.of(context).orderPlaced,
                                       size: 14,
                                       textAlign: TextAlign.center,
                                       color:
                                       AppLightColors.greyColorWish,
                                       fontWeight: FontWeight.w600,
                                     ),
                                     SizedBox(height: 4,),
                                     AppText(
                                       text: getCurrentTime(),
                                       size: 14,
                                       textAlign: TextAlign.center,
                                       color:
                                       AppLightColors.label_color,
                                       fontWeight: FontWeight.w500,
                                     )
                                   ],
                                 )
                               ],
                             ),
                           )
                         ],
                       ),
                       )


                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 12),
                  child: AppButton(
                      buttonName:

                      AppLocalizations.of(context).backToHome,
                      onTap:

                          (){
                            cartController.cartAddList.clear();
                            cartController.updateQty(1);
                            cartController.clear();
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) =>  HomeView()),
                            );
                      }),
                ),





              ],
            ),
          ),
        ));
  }


}





