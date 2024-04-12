import 'package:bomjour/app_module/bottom_tabs/profile/component/profile_component.dart';
import 'package:bomjour/app_module/bottom_tabs/profile/component/wishlist/controller/wishlist_controller.dart';
import 'package:bomjour/app_module/home/controller/home_controller.dart';
import 'package:bomjour/app_module/product_detail_page/controller/prooduct_detail_controller.dart';
import 'package:bomjour/app_module/product_detail_page/view/product_detail_view.dart';
import 'package:bomjour/services/api_manager.dart';
import 'package:bomjour/utils/app_common_widgets/app_text.dart';
import 'package:bomjour/utils/app_common_widgets/helper_function.dart';
import 'package:bomjour/utils/app_common_widgets/shimmers.dart';
import 'package:bomjour/utils/app_constants/app_config.dart';
import 'package:bomjour/utils/app_constants/localization.dart';
import 'package:bomjour/utils/app_themes/app_colors.dart';
import 'package:bomjour/utils/dark_theme_provider/dark_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:flutter_svg/svg.dart';

import 'dart:ui' as ui;

class NewWishlist extends StatelessWidget {
  const NewWishlist({super.key});

  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<ThemeLocalizationProvider>(context);
    final wishListController = Provider.of<WishlistController>(context);
    final productDetailController = Provider.of<ProductDetailController>(context);
    final homeController = Provider.of<HomeController>(context);
    return Directionality(
        textDirection: themeChange.locale.languageCode == "en"
            ? ui.TextDirection.ltr
            : ui.TextDirection.rtl,
        child: Scaffold(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          body: Column(
            children: [
              appBarProfile(
                  context: context,
                  title: AppLocalizations.of(context).myWish,
                  thickness: 2
              ),

              Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          width: AppConfig(context).width,
                          decoration: BoxDecoration(
                            color:
                            themeChange.darkTheme?AppLightColors.textField_back_dark:
                            AppLightColors.rewardBoxColor
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 24),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                AppText(
                                  text:
                                  "Omer’s ${AppLocalizations.of(context).birthday}",
                                  size: 20,
                                  fontWeight: FontWeight.w500,
                                  color: Theme.of(context).primaryColor,
                                ),
                                SizedBox(height: 5,),
                                Row(
                                  children: [
                                    AppText(
                                      text:  AppLocalizations.of(context).public,
                                      size: 14,
                                      fontWeight: FontWeight.w600,
                                      color: AppLightColors.greenColor,
                                    ),
                                 SizedBox(width: 10,),
                                    AppText(
                                      text: "16 ${AppLocalizations.of(context).peopleJoined}",
                                      size: 11,
                                      fontWeight: FontWeight.w400,
                                      color:   themeChange.darkTheme?AppLightColors.greyColorWish:
                                      AppLightColors.textField_back_dark,
                                    ),
                                  ],
                                ),
                                SizedBox(height: 16,),
                                Row(
                                  children: [
                                    Container(
                                      height: 40,
                                      width: 152,
                                      decoration: BoxDecoration(
                                      color: AppLightColors.primary_color,
                                        borderRadius: BorderRadius.circular(100)
                                    ),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        SvgPicture.asset("assets/icons/plus.svg"),
                                        SizedBox(width: 6,),
                                        AppText(
                                          text:  AppLocalizations.of(context).addFriend,
                                          size: 14,
                                          fontWeight: FontWeight.w500,
                                          color:   AppLightColors.white_color,
                                        ),
                                      ],
                                    ),
                                    ),
                                    SizedBox(width: 15,),
                                    Container(
                                      height: 40,
                                      width: 152,
                                      decoration: BoxDecoration(
                                        border: Border.all(color:
                                        themeChange.darkTheme?AppLightColors.white_color:
                                        AppLightColors.textField_back_dark,),
                                          borderRadius: BorderRadius.circular(100)
                                      ),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          SvgPicture.asset("assets/icons/file.svg"),
                                          SizedBox(width: 6,),
                                          AppText(
                                            text:  AppLocalizations.of(context).shareLink,
                                            size: 14,
                                            fontWeight: FontWeight.w500,
                                            color:
                                            themeChange.darkTheme?AppLightColors.white_color:
                                            AppLightColors.greyColorWish,
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),


                              ],
                            ),
                          ),
                        ),
                        Divider(color: AppLightColors.dividerColor,height: 0,),

                        wishListController.wishLoader?
                             getShimmerWishListEffect(context:context):
                        wishListController.wishListData.isEmpty
                            ? Column(
                          children: [
                            SizedBox(
                              height: AppConfig(context).height * 0.28,
                            ),
                            Center(
                              child: AppText(
                                text: "No Data!",
                                size: 16,
                                color: Theme.of(context).primaryColor,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        )
                            :
                        ListView.builder(
                            padding: EdgeInsets.only(top: 17),
                            shrinkWrap: true,
                            primary: false,
                            itemCount: wishListController.wishListData.length,
                            itemBuilder: (BuildContext context, int index) {
                              return GestureDetector(
                                onTap: (){

                                  productDetailController.originalWrapperData.clear();
                                  productDetailController.getWrapperData();
                                  productDetailController.productDetailList=null;
                                  productDetailController.getProductDetailData(id: wishListController.wishListData[index].productId.toString(),context: context);
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) =>  ProductDetailView()),
                                  );
                                },
                                child: Container(
                                  color: Colors.transparent,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(vertical: 10),
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding:  EdgeInsets.symmetric(horizontal: 16),
                                          child: SizedBox(
                                            height:125,
                                            child: Row(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                SizedBox(
                                                  height: 125,
                                                  width: 96,
                                                  child: ClipRRect(
                                                    borderRadius: BorderRadius.circular(10),
                                                    child:CachedNetworkImage(
                                                      placeholder: (context, url) =>   Center(
                                                        child: SpinKitThreeBounce(
                                                            size: 16,
                                                            color: AppLightColors.primary_color
                                                        ),
                                                      ),
                                                      imageUrl:wishListController.wishListData[index].itemImage.toString(),
                                                      fit: BoxFit.cover,

                                                      errorWidget: (context, url, error) =>

                                                          ClipRRect(
                                                            borderRadius: BorderRadius.circular(10),
                                                            child: Image.asset(
                                                              "assets/images/dummy6.png",
                                                              fit: BoxFit.cover,

                                                            ),
                                                          ),
                                                    ),


                                                  ),
                                                ),
                                                SizedBox(width: 10,),
                                                Expanded(
                                                  child: Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      AppText(
                                                        text:
                                                        wishListController.wishListData[index].title.toString(),
                                                        size: 16,
                                                        fontWeight: FontWeight.w500,
                                                        color: Theme.of(context).primaryColor,
                                                      ),
                                                      SizedBox(
                                                        height: 5,
                                                      ),
                                                      AppText(
                                                        text: wishListController.wishListData[index].description.toString(),
                                                        size: 12,
                                                        maxline: 2,
                                                        fontWeight: FontWeight.w400,
                                                        color: AppLightColors.label_color,
                                                      ),
                                                      Spacer(),
                                                      Padding(
                                                        padding:  EdgeInsets.only(bottom: 5),
                                                        child: Row(
                                                          children: [
                                                            SvgPicture.asset('assets/icons/shopping.svg'),
                                                            SizedBox(width: 5,),
                                                            AppText(
                                                              text: AppLocalizations.of(context).addToCart,
                                                              size: 13,
                                                              fontWeight: FontWeight.w400,
                                                              color:
                                                              themeChange.darkTheme?AppLightColors.greyColorWish:
                                                              AppLightColors.textField_back_dark,
                                                            ),
                                                            SizedBox(width: 15,),
                                                            GestureDetector(
                                                              onTap: (){
                                                                ApiManger().removeFav(
                                                                  context: context,
                                                                  id:wishListController.wishListData[index].typeId.toString(),
                                                                  customerId: (homeController.id).toString()
                                                                );
                                                                wishListController.wishListData
                                                                    .removeAt(index);
                                                                flutterToast(
                                                                    msg:
                                                                    "Wishlist deleted successfully");
                                                              },
                                                              child: Container(
                                                                color: Colors.transparent,
                                                                child: Row(
                                                                  children: [
                                                                    SvgPicture.asset('assets/icons/del.svg'),
                                                                    SizedBox(width: 5,),
                                                                    AppText(
                                                                      text: AppLocalizations.of(context).delete,
                                                                      size: 13,
                                                                      fontWeight: FontWeight.w400,
                                                                      color:   AppLightColors.primary_color,
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            )
                                                          ],
                                                        ),
                                                      ),

                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        SizedBox(height: 18,),
                                        Divider(color: AppLightColors.dividerColor,height: 0,),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            }),
                      ],
                    ),
                  )),
            ],
          ),
        ));
  }
}
