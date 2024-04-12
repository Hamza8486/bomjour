import 'package:bomjour/app_module/bottom_tabs/profile/component/profile_component.dart';
import 'package:bomjour/app_module/order_history/controller/order_controller.dart';
import 'package:bomjour/app_module/order_placed/view/order_place_view.dart';
import 'package:bomjour/utils/app_common_widgets/app_text.dart';
import 'package:bomjour/utils/app_constants/localization.dart';
import 'package:bomjour/utils/app_themes/app_colors.dart';
import 'package:bomjour/utils/dark_theme_provider/dark_theme.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'dart:ui' as ui;

class OrderDetail extends StatelessWidget {
   OrderDetail({super.key,this.data});
  var data;


  @override
  Widget build(BuildContext context) {
    DateTime dateTime = DateTime.parse(data.createdAt.toString());

    String formattedDate = DateFormat('dd MMMM yyyy').format(dateTime);
    String formattedTime = DateFormat('h:mm a').format(dateTime);
    final themeChange = Provider.of<ThemeLocalizationProvider>(context);
    return Directionality(
        textDirection:     themeChange.locale.languageCode  =="en"? ui.TextDirection.ltr: ui.TextDirection.rtl,
        child: Scaffold(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              appBarProfile(context: context,title: AppLocalizations.of(context).OrderDetails),
             Expanded(child: SingleChildScrollView(
               child: Padding(
                 padding: const EdgeInsets.symmetric(horizontal: 16),
                 child: Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     SizedBox(height: 24),
                     Row(
                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                       children: [
                         AppText(text:"#ID-${data.id.toString()}",
                           size: 14,
                           fontWeight: FontWeight.w700,
                           color: Theme.of(context).primaryColor,
                         ),
                         Container(
                           decoration: BoxDecoration(
                               color: Color(0xffFFF9E2),
                               borderRadius: BorderRadius.circular(100),
                               border: Border.all(color: Color(0xffFEC500))
                           ),
                           child:    Padding(
                             padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                             child: AppText(text:"On Hold",
                               size: 12,
                               fontWeight: FontWeight.w600,
                               color: Color(0xffFEC500),
                             ),
                           ),

                         )
                       ],
                     ),
                     SizedBox(height: 2),
                     Row(
                       children: [
                         AppText(text:"$formattedDate ",
                           size: 12,
                           fontWeight: FontWeight.w400,
                           color: AppLightColors.label_color,
                         ),
                         Container(
                           height: 3.5,
                           width: 3.5,
                           decoration: BoxDecoration(
                               color: AppLightColors.label_color,
                               shape: BoxShape.circle
                           ),),
                         AppText(text:" $formattedTime",
                           size: 12,
                           fontWeight: FontWeight.w400,
                           color: AppLightColors.label_color,
                         ),
                       ],
                     ),
                     SizedBox(height: 24),
                     themeChange.darkTheme?
                     Divider(color:

                     AppLightColors.black_color,height: 0 ,)
                         :
                     Divider(color:

                     AppLightColors.dividerColor,height: 0 ,),

                     SizedBox(height:

                     16),
                     ListView.builder(
                       padding: EdgeInsets.zero,
                       shrinkWrap: true,

                       primary: false,
                       itemCount: data.products?.length,
                       itemBuilder: (BuildContext context, int i) {
                         return Padding(
                           padding: const EdgeInsets.symmetric(vertical: 8),
                           child: Row(

                             children: [
                               Container(
                                 height: 72,
                                 width: 72,
                                 decoration: BoxDecoration(
                                   color: AppLightColors.item_back_color,
                                   borderRadius: BorderRadius.circular(5),
                                 ),
                                 child: Center(
                                   child: ClipRRect(
                                     borderRadius: BorderRadius.circular(10),
                                     child: Image.network(
                                       (data.products?[i].productImage).toString(),
                                       height: 46,
                                       width: 46,
                                     ),
                                   ),
                                 ),
                               ),
                               SizedBox(width: 10,),
                               Expanded(
                                 child: Column(
                                   crossAxisAlignment: CrossAxisAlignment.start,
                                   children: [
                                     Row(
                                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                       children: [
                                         AppText(text:data.products[i].productName.toString(),
                                           size: 16,
                                           fontWeight: FontWeight.w400,
                                           color: Theme.of(context).primaryColor,
                                         ),
                                         AppText(text:"x${data.products[i].quantity.toString()}",
                                           size: 13,
                                           fontWeight: FontWeight.w400,
                                           color: Theme.of(context).primaryColor,
                                         ),
                                       ],
                                     ),
                                     SizedBox(height: 8,),
                                     Row(
                                       mainAxisAlignment: MainAxisAlignment.end,
                                       children: [

                                         AppText(text:"Total ",
                                           size: 13,
                                           fontWeight: FontWeight.w400,
                                           color: AppLightColors.label_color,
                                         ),
                                         SizedBox(width: 4,),
                                         AppText(text:data.products[i].unitPrice.toString(),
                                           size: 14,
                                           fontWeight: FontWeight.w600,
                                           color: Theme.of(context).primaryColor,
                                         ),
                                       ],
                                     ),


                                   ],
                                 ),
                               )
                             ],
                           ),
                         );
                       },
                     ),
                     SizedBox(height: 24),
                     themeChange.darkTheme?
                     Divider(color:

                     AppLightColors.black_color,height: 0 ,)
                         :
                     Divider(color:

                     AppLightColors.dividerColor,height: 0 ,),
                     SizedBox(height: 24),
                     AppText(text: AppLocalizations.of(context).addTrack,
                       size: 18,
                       fontWeight: FontWeight.w600,
                       color: Theme.of(context).primaryColor,
                     ),
                     SizedBox(height: 13),
                     AppText(text: data.deliveryAddress,
                       size: 14,
                       fontWeight: FontWeight.w400,
                       color: AppLightColors.label_color,
                     ),

                     SizedBox(height: 24),
                     themeChange.darkTheme?
                     Divider(color:

                     AppLightColors.black_color,height: 0 ,)
                         :
                     Divider(color:

                     AppLightColors.dividerColor,height: 0 ,),
                     SizedBox(height: 24),
                     AppText(text: AppLocalizations.of(context).Payment,
                       size: 18,
                       fontWeight: FontWeight.w600,
                       color: Theme.of(context).primaryColor,
                     ),
                     SizedBox(height: 13),
                     Row(
                       children: [
                         Image.asset("assets/icons/visa1.png",
                         width: 56,
                           height: 32,
                         ),
                         SizedBox(width: 15),
                         AppText(text: "**** 7676",
                           size: 16,
                           fontWeight: FontWeight.w400,
                           color: Theme.of(context).primaryColor,
                         ),
                       ],
                     ),



                     SizedBox(height: 24),
                     themeChange.darkTheme?
                     Divider(color:

                     AppLightColors.black_color,height: 0 ,)
                         :
                     Divider(color:

                     AppLightColors.dividerColor,height: 0 ,),
                     SizedBox(height: 24),
                     AppText(text: AppLocalizations.of(context).Summary,
                       size: 18,
                       fontWeight: FontWeight.w600,
                       color: Theme.of(context).primaryColor,
                     ),
                     SizedBox(height: 24),
                     Row(
                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                       children: [
                         AppText(text: AppLocalizations.of(context).SubTotalProducts,
                           size: 14,
                           fontWeight: FontWeight.w400,
                           color:AppLightColors.label_color,
                         ),
                         AppText( text:"AED ${data.total.toString()}",
                           size: 14,
                           fontWeight: FontWeight.w400,
                           color:AppLightColors.label_color,
                         ),
                       ],
                     ),
                     SizedBox(height: 10),
                     Row(
                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                       children: [
                         AppText(text: AppLocalizations.of(context).deliveryFee,
                           size: 14,
                           fontWeight: FontWeight.w400,
                           color:AppLightColors.label_color,
                         ),
                         AppText(text: "0",
                           size: 14,
                           fontWeight: FontWeight.w400,
                           color:AppLightColors.label_color,
                         ),
                       ],
                     ),
                     SizedBox(height: 10),
                     Row(
                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                       children: [
                         AppText(text: AppLocalizations.of(context).Tax,
                           size: 14,
                           fontWeight: FontWeight.w400,
                           color:AppLightColors.label_color,
                         ),
                         AppText(text:"0",
                           size: 14,
                           fontWeight: FontWeight.w400,
                           color:AppLightColors.label_color,
                         ),
                       ],
                     ),
                     SizedBox(height: 21),
                     Row(
                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                       children: [
                         AppText(text: AppLocalizations.of(context).Total,
                           size: 16,
                           fontWeight: FontWeight.w600,
                           color:Theme.of(context).primaryColor,
                         ),
                         AppText(text:"AED ${data.total.toString()}",
                           size: 16,
                           fontWeight: FontWeight.w600,
                           color:Theme.of(context).primaryColor,
                         ),
                       ],
                     ),
                     SizedBox(height: 21),

                   ],
                 ),
               ),
             ))


            ],
          ),
        ));
  }
}




