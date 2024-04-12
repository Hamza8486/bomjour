import 'package:bomjour/app_module/bottom_tabs/profile/component/profile_component.dart';
import 'package:bomjour/app_module/bottom_tabs/profile/component/reward/tabs/all_reward.dart';
import 'package:bomjour/app_module/bottom_tabs/profile/component/reward/tabs/earned_reward.dart';
import 'package:bomjour/app_module/bottom_tabs/profile/component/reward/tabs/redeem_reward.dart';
import 'package:bomjour/utils/app_constants/localization.dart';
import 'package:bomjour/utils/app_themes/app_colors.dart';
import 'package:bomjour/utils/dark_theme_provider/dark_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:ui' as ui;


class Rewards extends StatefulWidget {
  const Rewards({super.key});

  @override
  State<Rewards> createState() => _RewardsState();
}

class _RewardsState extends State<Rewards> {
  String selected ="all";
  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<ThemeLocalizationProvider>(context);
    return Directionality(
        textDirection:     themeChange.locale.languageCode  =="en"? ui.TextDirection.ltr: ui.TextDirection.rtl,
        child: Scaffold(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          body: Column(
            children: [
              appBarProfile(context: context,
              title: AppLocalizations.of(context).myRewards
              ),

           Expanded(
             child: SingleChildScrollView(
               child: Padding(
                 padding: const EdgeInsets.symmetric(horizontal: 20),
                 child: Column(
                   children: [
                     SizedBox(height: 31,),
                     Row(

                       children: [
                         Expanded(
                           child: rewardWalletBox( context: context, title: AppLocalizations.of(context).wallet,price: "AED 768",image:"assets/icons/wallet.svg")



                         ),
                         SizedBox(width: 21,),
                         Expanded(
                           child: rewardWalletBox( context: context, title: AppLocalizations.of(context).rewards,price: "30 ${AppLocalizations.of(context).Points}",image:"assets/icons/rewards.svg"),
                         ),
                       ],
                     ),
                   SizedBox(height: 31,),
                     Container(
                       width: double.infinity,
                       height: 60,
                       decoration: BoxDecoration(
                       color:
                       themeChange.darkTheme?AppLightColors.textField_back_dark:
                       AppLightColors.rewardBoxColor,
                         borderRadius: BorderRadius.circular(100)
                     ),
                     child: Padding(
                       padding:  EdgeInsets.symmetric(horizontal: 16),
                       child: Row(
                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                         children: [
                           Expanded(
                             child: rewardSelectWidget(context: context,title: AppLocalizations.of(context).all,
                                 borderColor:
                                 themeChange.darkTheme?
                                 AppLightColors.black_color:Colors.transparent,
                                 color:
                                                    selected=="all"?
                                                    themeChange.darkTheme?AppLightColors.primary_color:
                                                    AppLightColors.white_color:
                                                    themeChange.darkTheme?AppLightColors.textField_back_dark:
                                                    Colors.transparent,onTap: (){
                               setState(() {
                                 selected="all";
                               });
                             }),
                           ),
                           SizedBox(width:   5,),
                           Expanded(
                             child: rewardSelectWidget(context: context,title: AppLocalizations.of(context).earned,


                                 color:
                             selected=="earn"?
                             themeChange.darkTheme?AppLightColors.primary_color:
                             AppLightColors.white_color:
                             themeChange.darkTheme?AppLightColors.textField_back_dark:
                             Colors.transparent,
                                 borderColor:
                                 themeChange.darkTheme?
                                 AppLightColors.black_color:Colors.transparent,



                                 onTap: (){
                               setState(() {
                                 selected="earn";
                               });
                             }),
                           ),
                           SizedBox(width:   5,),
                           Expanded(
                             child: rewardSelectWidget(context: context,title: AppLocalizations.of(context).Redeemed,

                                 color:
                             selected=="redeem"?
                             themeChange.darkTheme?AppLightColors.primary_color:
                             AppLightColors.white_color:
                             themeChange.darkTheme?AppLightColors.textField_back_dark:
                             Colors.transparent,
                                 borderColor:
                                 themeChange.darkTheme?
                                 AppLightColors.black_color:Colors.transparent,
                                 onTap: (){
                               setState(() {
                                 selected="redeem";
                               });
                             }),
                           ),



                         ],
                       ),
                     ),
                     ),

                     SizedBox(height: 15,),
                     selected=="all"?
                     AllReward():
                     selected=="earn"?
                     EarnedReward():RedeemReward()

                   ],
                 ),
               ),
             ),
           )

            ],
          ),
        ));
  }
}
