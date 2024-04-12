import 'package:bomjour/app_module/cart_view/cart_controller/cart_controller.dart';
import 'package:bomjour/app_module/cart_view/model/cart_model.dart';
import 'package:bomjour/app_module/cart_view/view/cart_view.dart';
import 'package:bomjour/app_module/product_detail_page/controller/prooduct_detail_controller.dart';
import 'package:bomjour/utils/app_common_widgets/app_button.dart';
import 'package:bomjour/utils/app_common_widgets/app_text.dart';
import 'package:bomjour/utils/app_common_widgets/helper_function.dart';
import 'package:bomjour/utils/app_constants/localization.dart';
import 'package:bomjour/utils/app_themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:provider/provider.dart';
import 'dart:ui' as ui;

import '../../../utils/dark_theme_provider/dark_theme.dart';




class CartDialogue extends StatelessWidget {
   CartDialogue({super.key,this.productName=""});
   String productName;

  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<ThemeLocalizationProvider>(context);
    final productDetailController = Provider.of<ProductDetailController>(context);
    final cartController = Provider.of<CartController>(context);

    return Directionality(
        textDirection: themeChange.locale.languageCode == "en"
            ? ui.TextDirection.ltr
            : ui.TextDirection.rtl,
        child: DraggableScrollableSheet(
          initialChildSize:0.6,
          minChildSize:0.6,
          maxChildSize:0.6,
          builder: (_, controller) => Container(
            decoration: BoxDecoration(
                color:
                themeChange.darkTheme?AppLightColors.textField_back_dark:
                AppLightColors.otpLightColor,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10)),
            ),
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color:
                    themeChange.darkTheme?AppLightColors.textField_back_dark:
                    AppLightColors.white_color
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 16),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                SvgPicture.asset('assets/icons/true.svg'),
                                SizedBox(width:10 ,),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    AppText(
                                      text:
                                productName==""?"":
                                      productName.toString(),
                                      size: 14,
                                      color: Theme.of(context).primaryColor,

                                      fontWeight: FontWeight.w600,
                                    ),
                                    SizedBox(height: 3,),
                                    AppText(
                                      text:
                                      AppLocalizations.of(context).addToCart,
                                      size: 13,
                                      color: AppLightColors.label_color,

                                      fontWeight: FontWeight.w400,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                AppText(
                                  text:
                                  AppLocalizations.of(context).CartTotal,
                                  size: 13,
                                  color: AppLightColors.label_color,

                                  fontWeight: FontWeight.w400,
                                ),
                                SizedBox(height: 3,),
                                AppText(
                                  text:
                                  "AED ${cartController.totalPrice.toStringAsFixed(0)}",
                                  size: 14,
                                  color: Theme.of(context).primaryColor,

                                  fontWeight: FontWeight.w600,
                                ),

                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: 24,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: AppButton(

                                  buttonName: AppLocalizations.of(context).ContinueShopping,
                                  buttonHeight: 42,
                                  borderColor:

                                  AppLightColors.primary_color,
                                  textSize: 14,
                                  borderWidth: 1.2,
                                  fontWeight: FontWeight.w500,
                                  buttonColor:
                                  themeChange.darkTheme?AppLightColors.textField_back_dark:
                                  AppLightColors.white_color,
                                  textColor: AppLightColors.primary_color,



                                  onTap: () {
                                    Navigator.pop(context);

                                  }),
                            ),
                            SizedBox(width: 15,),
                            Expanded(
                              child: AppButton(
                                  buttonHeight: 42,

                                  textSize: 14,
                                  fontWeight: FontWeight.w500,
                                  buttonName: AppLocalizations.of(context).checkout,



                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) =>  CartView()),
                                    );
                                  }),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 16,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      AppText(
                        text:
                  AppLocalizations.of(context).boughtTogether,
                        size: 14,
                        color: Theme.of(context).primaryColor,

                        fontWeight: FontWeight.w600,
                      ),
                      SizedBox(height: 14,),
                      Container(
                        width: double.infinity,

                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                        color:
                        themeChange.darkTheme?AppLightColors.textField_back_dark:
                        AppLightColors.white_color
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [

                            SizedBox(
                              height:185,
                              child:
                              productDetailController.similarLoader
                                  ? Center(
                                  child: SpinKitThreeBounce(
                                      size: 25, color: AppLightColors.primary_color))
                                  :
                              productDetailController.similarProductLit.isEmpty?
                              Center(
                                child: AppText(
                                  text:
                                  "No Data",
                                  size: 14,
                                  color: Theme.of(context).primaryColor,

                                  fontWeight: FontWeight.w600,
                                ),
                              ):
                              ListView.builder(
                                  padding:  EdgeInsets.zero,
                                  shrinkWrap: true,
                                  primary: false,
                                  scrollDirection: Axis.horizontal,
                                  itemCount: productDetailController.similarProductLit.length
                                  ,
                                  itemBuilder: (BuildContext context, int index) {
                                    bool isLastItem = index == productDetailController.similarProductLit.length - 1;
                                    String productId = productDetailController.similarProductLit[index].productId.toString();
                                    bool isProductInCart = cartController.cartAddList.any((element) => element.productId == productId);

                                    return    Padding(
                                      padding: const EdgeInsets.only(left: 20),
                                      child: GestureDetector(
                                        onTap: (){
                                          if(isProductInCart){
                                            cartController.cartAddList.removeWhere((element) => element.productId == productId);
                                            cartController.updateTotalPrice();
                                            cartController.updateTotalQuantity();
                                            flutterToast(msg: "${productDetailController.similarProductLit[index].productName} removed from cart");
                                          }
                                          else{
                                            String productId = (productDetailController.similarProductLit[index].productId).toString();
                                            bool isProductAlreadyInCart = cartController.cartAddList.any(
                                                  (element) => element.productId == productId,
                                            );

                                            if (isProductAlreadyInCart) {
                                              cartController.cartAddList.removeWhere((element) => element.productId == productId);
                                              cartController.cartAddList.add(
                                                AddProductModel(
                                                  productName: (productDetailController.similarProductLit[index].productName).toString(),
                                                  productDiscount: "",
                                                  productId: productId,
                                                  productImage: (productDetailController.similarProductLit[index].productImage).toString(),
                                                  productPrice: (productDetailController.similarProductLit[index].productPrice).toString(),
                                                  productPriceId: (productDetailController.similarProductLit[index].priceId).toString(),
                                                  quantity: cartController.qty.toString(),
                                                  type: "product",
                                                  busId: (productDetailController.similarProductLit[index].businessId).toString(),
                                                  productWeight:"450g",
                                                ),
                                              );
                                              cartController.updateTotalPrice();
                                              cartController.updateTotalQuantity();
                                              flutterToast(msg: "${(productDetailController.similarProductLit[index].productName).toString()} updated in cart");
                                            } else {
                                              cartController.cartAddList.add(
                                                AddProductModel(
                                                  productName: (productDetailController.similarProductLit[index].productName).toString(),
                                                  productDiscount: "",
                                                  productId: productId,
                                                  productImage: (productDetailController.similarProductLit[index].productImage).toString(),
                                                  productPrice: (productDetailController.similarProductLit[index].productPrice).toString(),
                                                  productPriceId: (productDetailController.similarProductLit[index].priceId).toString(),
                                                  quantity: cartController.qty.toString(),
                                                  type: "product",
                                                  busId: (productDetailController.similarProductLit[index].businessId).toString(),
                                                  productWeight:"450g",
                                                ),
                                              );
                                              cartController.updateTotalPrice();
                                              cartController.updateTotalQuantity();
                                              flutterToast(msg: "${(productDetailController.similarProductLit[index].productName).toString()} added to cart");
                                            }
                                          }

                                        },
                                        child: Container(
                                          color: Colors.transparent,
                                          child: Row(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(
                                                width: 140 ,

                                                child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Stack(
                                                      children: [
                                                        ClipRRect(
                                                          borderRadius:BorderRadius.circular(10),
                                                          child: Image.network(productDetailController.similarProductLit[index].productImage.toString(),
                                                            height: 120,
                                                            width: 120,
                                                              fit: BoxFit.cover
                                                          ),
                                                        ),
                                                        Positioned(
                                                          right: 8,
                                                          top: 8,

                                                          child: Container(
                                                            height: 23,
                                                            width: 23,
                                                            decoration: BoxDecoration(
                                                              borderRadius: BorderRadius.circular(8),
                                                              border: Border.all(color: AppLightColors.primary_color,
                                                              width: 2,

                                                              ),
                                                              color:
                                                              isProductInCart ? AppLightColors.primary_color:
                                                              Colors.transparent,

                                                            ),
                                                            child: Center(child: Icon(Icons.check,
                                                            size: 16,
                                                              color:
                                                              isProductInCart ?Colors.white:
                                                              Colors.transparent,
                                                            )),
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                    SizedBox(height: 8,),
                                                    AppText(
                                                      text: productDetailController.similarProductLit[index].productName.toString(),
                                                      size: 13,
                                                      maxline: 2,
                                                      textAlign: TextAlign.start,
                                                      fontWeight: FontWeight.w500,
                                                      color:
                                                      themeChange.darkTheme?AppLightColors.white_color:
                                                      AppLightColors.greyColorWish,
                                                    ),
                                                    SizedBox(height:5 ,),
                                                    Row(
                                                      children: [
                                                        AppText(
                                                          text: "${ productDetailController.similarProductLit[index].productPrice.toString()} AED",
                                                          size: 12,
                                                          fontWeight: FontWeight.w600,
                                                          color: AppLightColors.primary_color,
                                                        ),

                                                        // SizedBox(width: 15,),
                                                        //
                                                        // AppText(
                                                        //   text: "34 AED",
                                                        //   underLine: TextDecoration.lineThrough,
                                                        //   size: 12,
                                                        //   fontWeight: FontWeight.w400,
                                                        //   color: Theme.of(context).disabledColor,
                                                        // ),
                                                      ],
                                                    )
                                                  ],
                                                ),
                                              ),
                                              if (!isLastItem)
                                              Padding(
                                                padding: const EdgeInsets.only(top: 50),
                                                child: SvgPicture.asset("assets/icons/plus.svg",
                                                color: AppLightColors.black_color,
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  }
                              ),
                            )

                          ],
                        ),
                      ),
                      ),


                    ],
                  ),
                ),
                productDetailController.similarProductLit.isEmpty?SizedBox.shrink():
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16,horizontal: 16),
                  child: AppButton(

                      buttonName:  "Buy ${productDetailController.similarProductLit.length.toString()} Item Together",
                      borderColor:

                      AppLightColors.primary_color,
                      textSize: 16,
                      fontWeight: FontWeight.w600,
                      buttonColor:
                      themeChange.darkTheme?AppLightColors.textField_back_dark:
                      AppLightColors.white_color,
                      textColor: AppLightColors.primary_color,



                      onTap: () {
                        Navigator.pop(context);

                      }),
                )

              ],
            ),
          ),
        )
    );
  }
}

