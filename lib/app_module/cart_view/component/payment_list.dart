// import 'package:bomjour/utils/app_common_widgets/app_text.dart';
// import 'package:bomjour/utils/app_constants/localization.dart';
// import 'package:bomjour/utils/app_themes/app_colors.dart';
// import 'package:bomjour/utils/dark_theme_provider/dark_theme.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// class PaymentList extends StatefulWidget {
//   const PaymentList({super.key});
//
//   @override
//   State<PaymentList> createState() => _PaymentListState();
// }
//
// class _PaymentListState extends State<PaymentList> {
//   List paymentCardList = [{"image":"assets/icons/master.png"},
//     {"image":"assets/icons/visa.png"}
//   ];
//
//   int indexSelect=-1;
//   @override
//   Widget build(BuildContext context) {
//     final themeChange = Provider.of<ThemeLocalizationProvider>(context);
//     return   Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 16),
//       child: ListView.builder(
//           shrinkWrap: true,
//           primary: false,
//
//           padding:  EdgeInsets.zero,
//           itemCount: paymentCardList.length,
//           itemBuilder: (BuildContext context, int index) {
//             return Padding(
//               padding:  EdgeInsets.symmetric(vertical: 8),
//               child: Container(
//                 height: 82,
//                 width: double.infinity,
//                 decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(10),
//                     border: Border.all(color:
//                     indexSelect==index?AppLightColors.primary_color:
//
//                     themeChange.darkTheme?AppLightColors.black_color:
//                     AppLightColors.otpLightColor,width: 1)
//                 ),
//                 child: GestureDetector(
//                   onTap: (){
//                     setState(() {
//                       indexSelect=index;
//                     });
//                   },
//                   child: Container(
//                     child: Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 16),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//
//                         children: [
//
//                           Row(
//                             children: [
//                               Image.asset(paymentCardList[index]["image"],
//                                 height: 54,
//                                 width: 54,
//                               ),
//                               SizedBox(width: 14,),
//                               Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 mainAxisAlignment: MainAxisAlignment.center,
//
//                                 children: [
//                                   index==0?
//                                   AppText(
//                                     text: AppLocalizations.of(context).paymentCard,
//                                     size: 14,
//                                     color: Theme.of(context).primaryColor,
//                                     fontWeight: FontWeight.w600,
//                                   ): AppText(
//                                     text: AppLocalizations.of(context).VisaCard,
//                                     size: 14,
//                                     color: Theme.of(context).primaryColor,
//                                     fontWeight: FontWeight.w600,
//                                   ),
//                                   SizedBox(height: 3,),
//                                   AppText(
//                                     text: "4355  4666  5676  455",
//                                     size: 12,
//                                     color:AppLightColors.label_color,
//                                     fontWeight: FontWeight.w600,
//                                   ),
//                                 ],
//                               ),
//                             ],
//                           ),
//                           indexSelect==index?
//                           Image.asset("assets/icons/check.png",
//                             height: 24,
//                             width: 24,
//                           ):  Image.asset("assets/icons/uncheck.png",
//                             height: 24,
//                             width: 24,
//                           )
//
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             );
//           }
//       ),
//     );
//   }
// }
