import 'package:bomjour/app_module/cart_view/cart_controller/cart_controller.dart';
import 'package:bomjour/utils/app_common_widgets/app_text.dart';
import 'package:bomjour/utils/dark_theme_provider/dark_theme.dart';
import 'package:flutter/material.dart';
import 'package:bomjour/utils/app_themes/app_colors.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class CartItemList extends StatelessWidget {
  const CartItemList({super.key});

  @override
  Widget build(BuildContext context) {
    final cartController = Provider.of<CartController>(context);
    final themeChange = Provider.of<ThemeLocalizationProvider>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: ListView.builder(
          shrinkWrap: true,
          primary: false,

          padding:  EdgeInsets.zero,
          itemCount: cartController.cartAddList.length,
          itemBuilder: (BuildContext context, int index) {

            return Padding(
              padding:  EdgeInsets.symmetric(vertical: 12),
              child: Container(

                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color:
                    themeChange.darkTheme?AppLightColors.black_color:
                    AppLightColors.otpLightColor,width: 1)
                ),
                child: Row(

                  children: [
                    SizedBox(
                      height: 116,
                      width: 111,
                      child: ClipRRect(
                        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10),topLeft: Radius.circular(10)),
                        child: CachedNetworkImage(
                          placeholder: (context, url) => Center(
                            child: SpinKitThreeBounce(
                                size: 14,
                                color: AppLightColors.primary_color),
                          ),
                          imageUrl: cartController.cartAddList[index].productImage.toString(),
                          fit: BoxFit.cover,
                          errorWidget: (context, url, error) => ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                              "assets/images/cart.png",
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ),

                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 14,bottom: 14,left: 14,right: 14),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppText(
                              text: cartController.cartAddList[index].productName.toString(),
                              size: 16,
                              color: Theme.of(context).primaryColor,
                              fontWeight: FontWeight.w600,
                            ),
                            SizedBox(height: 6,),
                            AppText(
                              text: cartController.cartAddList[index].productWeight.toString(),
                              size: 14,

                              color: AppLightColors.label_color,
                              fontWeight: FontWeight.w400,
                            ),
                            SizedBox(height: 13,),
                            Row(
                              children: [
                                AppText(
                                  text: "AED ${cartController.cartAddList[index].productPrice.toString()}",
                                  size: 16,

                                  color: AppLightColors.primary_color,
                                  fontWeight: FontWeight.w700,
                                ),
                                SizedBox(width: 10,),
                                Container(
                                  width: 1,
                                  height: 20,
                                  color: AppLightColors.black_color.withOpacity(0.1),
                                ),
                                SizedBox(width: 10,),
                                AppText(
                                  text: "AED 0",
                                  size: 16,
                                  underLine: TextDecoration.lineThrough,
                                  color1: AppLightColors.label_color,
                                  color: AppLightColors.greyColorWish,
                                  fontWeight: FontWeight.w600,
                                ),

                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 116,
                      child: Padding(
                        padding:
                        themeChange.locale.languageCode  =="en"?
                        EdgeInsets.only(top:15,bottom: 15,right: 14): EdgeInsets.only(top: 14,bottom: 20,left: 14),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: (){
                                int currentQuantity = int.parse(cartController.cartAddList[index].quantity.toString());
                                cartController.cartAddList[index].quantity = (currentQuantity + 1).toString();
                                cartController.updateTotalPrice();
                                cartController.updateTotalQuantity();
                                print(cartController.cartAddList[index].quantity.toString());
                              },
                              child: Container(

                                  child: SvgPicture.asset("assets/icons/add1.svg")),
                            ),
                            AppText(
                              text: "${cartController.cartAddList[index].quantity.toString()}",
                              size: 16,
                              color: AppLightColors.greyColorWish,
                              fontWeight: FontWeight.w500,
                            ),

                            GestureDetector(
                                onTap: (){
                                  int currentQuantity = int.parse(cartController.cartAddList[index].quantity.toString());
                                  if (currentQuantity > 1) {
                                    cartController.cartAddList[index].quantity = (currentQuantity - 1).toString();
                                  } else {
                                    cartController.cartAddList.removeAt(index);
                                  }
                                  cartController.updateTotalQuantity();
                                  cartController.updateTotalPrice();
                                },
                                child: Container(
                              color: Colors.transparent,
                                width: 20,
                                height: 10,
                                child: SvgPicture.asset("assets/icons/removes.svg")))
                          ],
                        ),
                      ),
                    ),

                  ],
                ),
              ),
            );
          }
      ),
    );
  }
}
