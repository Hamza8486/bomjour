import 'package:bomjour/app_module/address/component/address_list.dart';
import 'package:bomjour/app_module/address/controller/address_controller.dart';
import 'package:bomjour/app_module/address/view/address_view.dart';
import 'package:bomjour/app_module/bottom_tabs/profile/component/profile_component.dart';
import 'package:bomjour/app_module/cart_view/cart_controller/cart_controller.dart';
import 'package:bomjour/app_module/cart_view/component/cart_list.dart';
import 'package:bomjour/app_module/home/controller/home_controller.dart';
import 'package:bomjour/utils/app_common_widgets/app_button.dart';
import 'package:bomjour/utils/app_common_widgets/app_text.dart';
import 'package:bomjour/utils/app_common_widgets/helper_function.dart';
import 'package:bomjour/utils/app_constants/app_config.dart';
import 'package:bomjour/utils/app_constants/localization.dart';
import 'package:bomjour/utils/app_themes/app_colors.dart';
import 'package:bomjour/utils/dark_theme_provider/dark_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:flutter_svg/svg.dart';

import 'dart:ui' as ui;

class CartView extends StatefulWidget {
   CartView({super.key});

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {


  int index=0;

  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<ThemeLocalizationProvider>(context);
    final cartController = Provider.of<CartController>(context);
    final addressController = Provider.of<AddressController>(context);
    final homeController = Provider.of<HomeController>(context);
    return Directionality(
        textDirection:     themeChange.locale.languageCode  =="en"? ui.TextDirection.ltr: ui.TextDirection.rtl,
        child: PopScope(
        canPop:
        index==0?true:
        false,
          onPopInvoked: (val){
            index = (index - 1) % 3;
            setState(() {

            });

          },
          child: Scaffold(
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                appBarProfile(context: context,
                title: AppLocalizations.of(context).yourCart,
                    onTap: index == 0 ? () {
                      Navigator.pop(context);
                      print("object");
                    } : () {
                      setState(() {
                        index = (index - 1) % 3;
                      });
                    }

                ),
                SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SvgPicture.asset("assets/icons/carts.svg"),
                      AppText(
                        text: "${AppLocalizations.of(context).cart}",
                        size: 14,
                        color:
                        index==0?AppLightColors.primary_color:
                        AppLightColors.greyColorWish,
                        fontWeight: FontWeight.w500,
                      ),
                      SvgPicture.asset("assets/icons/line1.svg",
                      color: index==1?AppLightColors.primary_color:
                      AppLightColors.label_color,
                      ),
                      SvgPicture.asset("assets/icons/pin.svg"),
                      AppText(
                        text: "${AppLocalizations.of(context).address}",
                        size: 14,
                        color:  index==1?AppLightColors.primary_color:
                        AppLightColors.greyColorWish,
                        fontWeight: FontWeight.w500,
                      ),
                      SvgPicture.asset("assets/icons/line2.svg",
                        color: index==2 || index==3?AppLightColors.primary_color:
                        AppLightColors.label_color,
                      ),
                      SvgPicture.asset("assets/icons/payments.svg"),
                      AppText(
                        text: "${AppLocalizations.of(context).Payment}",
                        size: 14,
                        color:  index==2 ?AppLightColors.primary_color:
                        AppLightColors.greyColorWish,
                        fontWeight: FontWeight.w500,
                      ),

                    ],
                  ),
                ),

                SizedBox(
                  height: 15,
                ),
                Divider(color:

                AppLightColors.dividerColor,height: 0 ,),
                Expanded(child: SingleChildScrollView(
                  child:
                  cartController.cartAddList.isEmpty?Column(
                    children: [

                      SizedBox(
                        height: AppConfig(context).height * 0.38,
                      ),
                      Center(
                        child: AppText(
                          text:"Cart Empty!",
                          size: 16,
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ):

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      index==2? SizedBox.shrink():
                    SizedBox(
                      height: 24,
                    ),
                      index==2? SizedBox.shrink():
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child:
                      cartController.cartAddList.isEmpty?SizedBox.shrink():
                      AppText(
                        text:
                        index==2?
                        "${cartController.cartAddList.length.toString()} ${AppLocalizations.of(context).items}":"${cartController.cartAddList.length.toString()} ${AppLocalizations.of(context).itemInCart}",
                        size: 20,
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                      index==0?
                    CartItemList():
                      index==1?
                      AddressListView():
                      // index==2?
                      // PaymentList():
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 10,),
                      Container(
                        margin:  EdgeInsets.symmetric(horizontal: 16),
                        decoration: BoxDecoration(
                        color: AppLightColors.rewardBoxColor,
                        borderRadius: BorderRadius.circular(10)
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  AppText(
                                    text: cartController.addressName.toString(),
                                    size: 14,
                                    color:
                                    AppLightColors.greyColorWish,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  SizedBox(height: 3,),
                                  AppText(
                                    text: cartController.address,
                                    size: 14,
                                    color:
                                    AppLightColors.label_color,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(width: 10,),
                            SvgPicture.asset("assets/icons/next_icon.svg",

                            )
                          ],
                        ),
                      ),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child:
                        cartController.cartAddList.isEmpty?SizedBox.shrink():
                        AppText(
                          text:

                          "${cartController.cartAddList.length.toString()} ${AppLocalizations.of(context).items}",
                          size: 20,
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.w500,
                        ),
                      ),


                      CartItemList()
                    ],
                  )



                  ],),
                )),
                cartController.cartAddList.isEmpty?SizedBox.shrink():
                Container(
                 width: double.infinity,
                  decoration: BoxDecoration(
                    color:
                    index==2?
                    AppLightColors.rewardBoxColor:Colors.transparent
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 16),
                    child: Column(
                      children: [
                        SizedBox(height: 10,),

                       index==2?
                       Column(
                         children: [

                           Row(
                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                             children: [
                               AppText(
                                 text: AppLocalizations.of(context).subTotal,
                                 size: 16,
                                 color:
                                 AppLightColors.greyColorWish,
                                 fontWeight: FontWeight.w400,
                               ),
                               AppText(
                                 text: "AED ${cartController.totalPrice.toStringAsFixed(0)}",
                                 size: 16,
                                 color:
                                 AppLightColors.textField_back_dark,
                                 fontWeight: FontWeight.w400,
                               ),
                             ],
                           ),
                           SizedBox(height: 16,),
                           Row(
                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                             children: [
                               AppText(
                                 text: AppLocalizations.of(context).DeliveryFee,
                                 size: 16,
                                 color:
                                 AppLightColors.greyColorWish,
                                 fontWeight: FontWeight.w400,
                               ),
                               AppText(
                                 text: "AED 0",
                                 size: 16,
                                 color:
                                 AppLightColors.textField_back_dark,
                                 fontWeight: FontWeight.w400,
                               ),
                             ],
                           ),
                           SizedBox(height: 16,),

                           Divider(color:

                           AppLightColors.dividerColor,),
                           SizedBox(height: 16,),
                           Row(
                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                             children: [
                               AppText(
                                 text: AppLocalizations.of(context).Total,
                                 size: 16,
                                 color:
                                 Theme.of(context).primaryColor,
                                 fontWeight: FontWeight.w700,
                               ),
                               AppText(
                                 text: "AED ${cartController.totalPrice.toStringAsFixed(0)}",
                                 size: 16,
                                 color:
                                 Theme.of(context).primaryColor,
                                 fontWeight: FontWeight.w700,
                               ),
                             ],
                           ),
                         ],
                       ):


                        index==0?
                            SizedBox.shrink():
                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.center,
                        //   children: [
                        //     AppText(
                        //       text: "${AppLocalizations.of(context).addItem}",
                        //       size: 16,
                        //       color: AppLightColors.label_color,
                        //       fontWeight: FontWeight.w500,
                        //     ),
                        //     SizedBox(width: 5,),
                        //     AppText(
                        //       text: "${AppLocalizations.of(context).wishlist}",
                        //       size: 16,
                        //       color: AppLightColors.primary_color,
                        //       fontWeight: FontWeight.w600,
                        //     ),
                        //   ],
                        // )


                        AppButton(
                            buttonName: AppLocalizations.of(context).shareLinkAddress,
                            buttonHeight: 52,
                            borderColor:

                            AppLightColors.label_color,
                            isGradient: false,
                            buttonRadius: BorderRadius.circular(100),
                            buttonColor:
                            themeChange.darkTheme?AppLightColors.textField_back_dark:
                            AppLightColors.white_color,
                            textColor: AppLightColors.primary_color,


                            onTap:

                                (){
                                  addressController.getPropertyTypes();

                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => AddressView()),
                                  );
                            })

                        //    :
                        //
                        //
                        // AppText(
                        //   text:
                        //   "${AppLocalizations.of(context).addNewCard}",
                        //   size: 16,
                        //
                        //   color:
                        //   AppLightColors.label_color,
                        //   fontWeight: FontWeight.w400,
                        //
                        // ),
                        ,
                        SizedBox(height: 32,),
                        cartController.orderLoader
                            ? Center(
                            child: SpinKitThreeBounce(
                                size: 25, color: AppLightColors.primary_color))
                            :
                        AppButton(
                          buttonName: index == 2
                              ? AppLocalizations.of(context).confirmOrder
                              : AppLocalizations.of(context).Next,
                          buttonHeight: 52,
                          buttonColor: cartController.cartAddList.isEmpty
                              ? AppLightColors.primary_color.withOpacity(0.6)
                              : AppLightColors.primary_color,
                          onTap:
                               index == 1 && cartController.addressId==""
                              ? () {
                            flutterToast(msg: 'No address selected');
                          }
                              : index == 2
                              ? () {
                                 cartController.updateLoader(true);
                                 cartController.makePayment(amount: cartController.totalPrice.toStringAsFixed(0), currency: 'AED',
                                   cartItems: cartController.cartAddList.toList(),
                                   context: context,
                                   total: cartController.totalPrice.toStringAsFixed(0),
                                   orderStatus: "pending",
                                   addressId: cartController.addressId.toString(),
                                   billingId: "27",
                                   sameAddress: cartController.addressId.toString(),
                                   isPaid: "1",
                                   wrapId: cartController.wrapperId.toString(),
                                   cusId: homeController.id.toString(),
                                 );

                            // orderPlaceData(
                            //   cartItems: cartController.cartAddList.toList(),
                            //   context: context,
                            //   total: cartController.totalPrice.toStringAsFixed(0),
                            //   orderStatus: "pending",
                            //   addressId: cartController.addressId.toString(),
                            //   billingId: "27",
                            //   sameAddress: cartController.addressId.toString(),
                            //   isPaid: "1",
                            //   wrapId: cartController.wrapperId.toString(),
                            //   cusId: addressController.user?.data?.id.toString(),
                            // );
                          }
                              : () {
                            setState(() {
                              index = (index + 1) % 3;
                            });
                          },
                        )

                    ],
                    ),
                  ),
                ),




              ],
            ),
          ),
        ));
  }
}





