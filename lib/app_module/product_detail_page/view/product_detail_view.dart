import 'package:bomjour/app_module/cart_view/cart_controller/cart_controller.dart';
import 'package:bomjour/app_module/cart_view/component/cart_dialoge.dart';
import 'package:bomjour/app_module/cart_view/model/cart_model.dart';
import 'package:bomjour/app_module/product_detail_page/component/all_wrap.dart';
import 'package:bomjour/app_module/product_detail_page/component/available_wraps.dart';
import 'package:bomjour/app_module/product_detail_page/component/components.dart';
import 'package:bomjour/app_module/product_detail_page/component/add_occasion.dart';
import 'package:bomjour/app_module/product_detail_page/controller/prooduct_detail_controller.dart';
import 'package:bomjour/utils/app_common_widgets/app_button.dart';
import 'package:bomjour/utils/app_common_widgets/app_text.dart';
import 'package:bomjour/utils/app_common_widgets/helper_function.dart';
import 'package:bomjour/utils/app_constants/app_config.dart';
import 'package:bomjour/utils/app_constants/localization.dart';
import 'package:bomjour/utils/app_themes/app_colors.dart';
import 'package:bomjour/utils/dark_theme_provider/dark_theme.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';
import 'package:flutter_svg/svg.dart';
import 'dart:ui' as ui;

class ProductDetailView extends StatefulWidget {
  const ProductDetailView({super.key});

  @override
  State<ProductDetailView> createState() => _ProductDetailViewState();
}

class _ProductDetailViewState extends State<ProductDetailView> {
  int _current = 0;
  final CarouselController _controller = CarouselController();




  @override
  Widget build(BuildContext context) {
    final productDetailController = Provider.of<ProductDetailController>(context);
    final cartController = Provider.of<CartController>(context);
    final themeChange = Provider.of<ThemeLocalizationProvider>(context);
    return Directionality(
        textDirection:     themeChange.locale.languageCode  =="en"? ui.TextDirection.ltr: ui.TextDirection.rtl,
        child: Scaffold(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          body:
          productDetailController.productDetailLoader?

          Padding(
            padding:  EdgeInsets.symmetric(horizontal: AppConfig(context).width*0.04),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: AppConfig(context).height * 0.06,
                ),
                GestureDetector(
                    onTap: (){
                      Navigator.pop(context);
                    },
                    child: SvgPicture.asset('assets/icons/backs.svg',
                      color: Theme.of(context).primaryColor,
                    )),
                SizedBox(
                  height: AppConfig(context).height * 0.38,
                ),
                loader(),
              ],
            ),

          ):

          productDetailController.productDetailList==null?
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: AppConfig(context).height * 0.06,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: backButton(context: context),
              ),
              SizedBox(
                height: AppConfig(context).height * 0.38,
              ),
              Center(
                child: AppText(
                  text:"No Data!",
                  size: 16,
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ):
          Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      topBar(carouselController: _controller,
                      context: context,
                        bannerList: (productDetailController.productDetailList?.images)??[],
                        isShowDiscount: true,
                        discount: "20",
                        current: _current,
                        onPageChanged: (index, reason) {
                          setState(() {
                            _current = index;
                          });
                        },
                      ),

                      SizedBox(height: 24,),
                     Padding(
                       padding: const EdgeInsets.symmetric(horizontal: 16),
                       child: Column(
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: [
                           AppText(
                             text:(productDetailController.productDetailList?.productName).toString(),
                             size: 22,
                             color:Theme.of(context).primaryColor,
                             // color1: AppLightColors.primary_color,
                             // underLine: TextDecoration.underline,
                             fontWeight: FontWeight.w600,
                           ),
                           // SizedBox(height: 4,),
                           // AppText(
                           //   text:(productDetailController.productDetailList?.productOtherInfo).toString(),
                           //   size: 22,
                           //   color: Theme.of(context).primaryColor,
                           //
                           //   fontWeight: FontWeight.w600,
                           // ),
                           SizedBox(height: 2,),
                           Row(
                             children: [
                               RatingBar.builder(
                                 initialRating: 4.5,


                                 minRating: 1,
                                 unratedColor: AppLightColors.UnRatedColor,
                                 itemSize: 16,
                                 direction: Axis.horizontal,
                                 allowHalfRating: true,
                                 itemCount: 5,
                                 itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                                 itemBuilder: (context, _) => Icon(
                                   Icons.star,
                                   color: AppLightColors.orangeColor,
                                 ),
                                 onRatingUpdate: (rating) {
                                   print(rating);
                                 },
                               ),
                               SizedBox(height: 13,),
                               AppText(
                                 text:"4.5",
                                 size: 14,
                                 color: Theme.of(context).primaryColor,

                                 fontWeight: FontWeight.w600,
                               ),

                             ],
                           ),
                           SizedBox(height: 6,),
                           Row(
                             children: [

                               AppText(
                                 text:"${productDetailController.productDetailList?.productPrice.toString()} AED",
                                 size: 16,
                                 color: AppLightColors.primary_color,

                                 fontWeight: FontWeight.w600,
                               ),
                               SizedBox(width: 10,),
                               AppText(
                                 text:"154 AED",
                                 size: 16,
                                 color: AppLightColors.label_color,
                                 underLine: TextDecoration.lineThrough,
                                 color1: AppLightColors.label_color,

                                 fontWeight: FontWeight.w400,
                               ),
                             ],
                           ),
                           SizedBox(height: 10,),
                           buttonCart(context: context,value: cartController.qty.toString(),removeTap:
                           cartController.qty > 1
                               ?
                               (){
                                 cartController.updateDecQty();
                           }:(){},addTap: (){
                             cartController.updateAddQty();
                           }),
                           SizedBox(height: 22,),
                           Row(
                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                             children: [
                               AppText(
                                 text:AppLocalizations.of(context).AvailableWraps,
                                 size: 16,
                                 color: Theme.of(context).primaryColor,
                                 fontWeight: FontWeight.w500,
                               ),
                               GestureDetector(
                                 onTap: (){
                                   Navigator.push(
                                     context,
                                     MaterialPageRoute(builder: (context) =>  AllWrap()),
                                   );
                                 },
                                 child: AppText(
                                   text:AppLocalizations.of(context).seeAll,
                                   size: 14,
                                   color: AppLightColors.primary_color,
                                   fontWeight: FontWeight.w400,
                                 ),
                               ),
                             ],
                           ),
                           SizedBox(height: 16,),
                           AvailableWraps(),
                           SizedBox(height: 16,),
                           AppText(
                             text:AppLocalizations.of(context).productDetail,
                             size: 16,
                             color: Theme.of(context).primaryColor,
                             fontWeight: FontWeight.w500,
                           ),
                           SizedBox(height: 10,),

                          readMoreText(title: (productDetailController.productDetailList?.productDescription).toString(),)

                         ],
                       ),
                     )
                    ],
                  ),
                ),
              ),
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: 16,vertical: 13),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AppButton(

                        buttonHeight: 55,
                        buttonWidth: 173,
                        buttonName: AppLocalizations.of(context).AddToOccasion,
                        borderColor:
                        themeChange.darkTheme?AppLightColors.white_color:
                        AppLightColors.label_color,
                        textSize: 16,
                        buttonColor:
                        themeChange.darkTheme?AppLightColors.textField_back_dark:
                        AppLightColors.white_color,
                        textColor: Theme.of(context).primaryColor,



                        onTap: () {
                          showModalBottomSheet(
                              backgroundColor: Colors.transparent,
                              isScrollControlled: true,
                              isDismissible: true,
                              context: context,
                              builder: (context) =>   AddOccasion());
                        }),
                    SizedBox(width: 20,),
                    AppButton(
                      buttonHeight: 55,
                      buttonWidth:
                      themeChange.locale.languageCode  =="en"?
                      130: 173,
                      textSize: 16,
                      buttonName: AppLocalizations.of(context).AddToCart,
                      onTap: () {
                        productDetailController.similarProductLit.clear();
                        productDetailController.getSimilarData(context: context,id: (productDetailController.productDetailList?.id).toString());
                        String productId = (productDetailController.productDetailList?.id).toString();
                        bool isProductAlreadyInCart = cartController.cartAddList.any(
                              (element) => element.productId == productId,
                        );

                        if (isProductAlreadyInCart) {
                          cartController.cartAddList.removeWhere((element) => element.productId == productId);
                          cartController.cartAddList.add(
                            AddProductModel(
                              productName: (productDetailController.productDetailList?.productName).toString(),
                              productDiscount: "",
                              productId: productId,
                              productImage: (productDetailController.productDetailList?.images?.first.productImage).toString(),
                              productPrice: (productDetailController.productDetailList?.productPrice).toString(),
                              productPriceId: (productDetailController.productDetailList?.priceId).toString(),
                              quantity: cartController.qty.toString(),
                              type: "product",
                              busId: (productDetailController.productDetailList?.busId).toString(),
                              productWeight:"450g",
                            ),
                          );
                          cartController.updateTotalPrice();
                          cartController.updateTotalQuantity();
                          flutterToast(msg: "${(productDetailController.productDetailList?.productName).toString()} updated in cart");
                        } else {
                          cartController.cartAddList.add(
                            AddProductModel(
                              productName: (productDetailController.productDetailList?.productName).toString(),
                              productDiscount: "",
                              productId: productId,
                              productImage: (productDetailController.productDetailList?.images?.first.productImage).toString(),
                              productPrice: (productDetailController.productDetailList?.productPrice).toString(),
                              productPriceId: (productDetailController.productDetailList?.priceId).toString(),
                              quantity: cartController.qty.toString(),
                              type: "product",
                              busId: (productDetailController.productDetailList?.busId).toString(),
                              productWeight:"450g",
                            ),
                          );
                          cartController.updateTotalPrice();
                          cartController.updateTotalQuantity();
                          flutterToast(msg: "${(productDetailController.productDetailList?.productName).toString()} added to cart");
                        }

                        showModalBottomSheet(
                          backgroundColor: Colors.transparent,
                          isScrollControlled: true,
                          isDismissible: true,
                          context: context,
                          builder: (context) => CartDialogue(productName: (productDetailController.productDetailList?.productName).toString()),
                        );
                      },
                    ),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}



