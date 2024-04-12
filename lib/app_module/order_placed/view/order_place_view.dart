import 'package:bomjour/app_module/bottom_tabs/profile/component/profile_component.dart';
import 'package:bomjour/app_module/cart_view/cart_controller/cart_controller.dart';
import 'package:bomjour/app_module/home/view/home_view.dart';
import 'package:bomjour/app_module/order_placed/view/order_status.dart';
import 'package:bomjour/utils/app_common_widgets/app_button.dart';
import 'package:bomjour/utils/app_common_widgets/app_text.dart';
import 'package:bomjour/utils/app_constants/localization.dart';
import 'package:bomjour/utils/app_themes/app_colors.dart';
import 'package:bomjour/utils/dark_theme_provider/dark_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_svg/svg.dart';

import 'dart:ui' as ui;

class ThanksView extends StatelessWidget {
   ThanksView({super.key,this.data});
  var data;

  @override
  Widget build(BuildContext context) {
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
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 43,
                          ),
                          Center(
                            child: AppText(
                              text: "${AppLocalizations.of(context).weReceived}",
                              size: 16,
                              textAlign: TextAlign.center,
                              color:
                                 Theme.of(context).primaryColor,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(
                            height: 66,
                          ),
                          SvgPicture.asset("assets/icons/tick.svg"),
                          SizedBox(
                            height: 90,
                          ),
                          rowData(context: context,title: AppLocalizations.of(context).orderSummary,subtitle: "ID: ${data.toString()}",
                          colon: false,
                          size: 16
                          ),
                          SizedBox(
                            height: 20,
                          ),
                      Divider(color: AppLightColors.otpLightColor,),
                          SizedBox(
                            height: 20,
                          ),
                          rowData(context: context,title: AppLocalizations.of(context).items,subtitle: cartController.totalQuantity.toString(),

                          ),
                          SizedBox(
                            height: 17,
                          ),
                          rowData(context: context,title: AppLocalizations.of(context).price,subtitle: "AED ${cartController.totalPrice.toStringAsFixed(0)}",

                          ),
                          SizedBox(
                            height: 17,
                          ),
                          rowData(context: context,title: AppLocalizations.of(context).delivery,subtitle: "AED 0",

                          ),
                          SizedBox(
                            height: 17,
                          ),
                          rowData(context: context,title: AppLocalizations.of(context).taxes,subtitle: "AED 0",

                          ),
                          SizedBox(
                            height: 17,
                          ),
                          rowData(context: context,title: AppLocalizations.of(context).Total,subtitle: "AED ${cartController.totalPrice.toStringAsFixed(0)}",
                            color: Theme.of(context).primaryColor

                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 12),
                  child: AppButton(
                      buttonName:

                       AppLocalizations.of(context).trackOrder,
                      buttonHeight: 52,


                      onTap:

                          (){
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) =>  OrderStatusView(data:data.toString() ,)),
                            );
                      }),
                ),





              ],
            ),
          ),
        ));
  }


}
Widget rowData({required BuildContext context,title,subtitle,Color ?color,double?size, bool colon=true}){
  return  Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      AppText(
        text:
        colon?
        "$title:": "$title",
        size:size?? 14,
        textAlign: TextAlign.center,
        color:
        Theme.of(context).primaryColor,
        fontWeight: FontWeight.w600,
      ),
      AppText(
        text: subtitle,
        size: 14,
        textAlign: TextAlign.center,
        color:
        color??
            AppLightColors.greyColorWish,
        fontWeight: FontWeight.w400,
      ),
    ],
  );
}




