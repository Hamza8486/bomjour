import 'package:bomjour/app_module/bottom_tabs/dashboard/component/dashboard_component.dart';
import 'package:bomjour/app_module/bottom_tabs/dashboard/controller/dashboard_controller.dart';
import 'package:bomjour/app_module/bottom_tabs/profile/component/wishlist/controller/wishlist_controller.dart';
import 'package:bomjour/app_module/home/controller/home_controller.dart';
import 'package:bomjour/app_module/product_detail_page/controller/prooduct_detail_controller.dart';
import 'package:bomjour/app_module/product_detail_page/view/product_detail_view.dart';
import 'package:bomjour/services/api_manager.dart';
import 'package:bomjour/utils/app_constants/app_config.dart';
import 'package:bomjour/utils/app_padding/app_paddings.dart';
import 'package:bomjour/utils/app_themes/app_colors.dart';
import 'package:bomjour/utils/dark_theme_provider/dark_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';


class TopSellers extends StatelessWidget {

  TopSellers({super.key});

  @override
  Widget build(BuildContext context) {
    final productDetailController = Provider.of<ProductDetailController>(context);
    final wishController = Provider.of<WishlistController>(context);
    final dashboardController = Provider.of<DashboardController>(context);
    final homeController = Provider.of<HomeController>(context);
    final themeChange = Provider.of<ThemeLocalizationProvider>(context);
    return Container(
      height: 330,


      child: ListView.builder(
          shrinkWrap: true,
          primary: false,

          scrollDirection: Axis.horizontal,
          padding:  EdgeInsets.zero,
          itemCount: dashboardController.productsList.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: (){
                productDetailController.originalWrapperData.clear();
                productDetailController.getWrapperData();
                productDetailController.productDetailList=null;
                productDetailController.getProductDetailData(id: dashboardController.productsList[index].productId.toString(),context: context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>  ProductDetailView()),
                );
              },
              child: Padding(
                padding:   themeChange.locale.languageCode == "en"?
                AppPaddings.onlyPadding(left:
                index==0? AppConfig(context).width*0.04:
                AppConfig(context).width*0.02,
                ):AppPaddings.onlyPadding(right:
                index==0? AppConfig(context).width*0.04:
                AppConfig(context).width*0.03,
                ),
                child: SizedBox(
                  width: 167,
                  child: giftCommonWidget(sale: true,
                      context: context,
                      title: themeChange.locale.languageCode  =="en"?"${dashboardController.productsList[index].productName.toString()}":"${dashboardController.productsList[index].productName.toString()}",
                      image:dashboardController.productsList[index].productImage.toString(),
                      rating: "4.5",
                      price: "${dashboardController.productsList[index].productPrice.toString()}  AED",


                      discountPrice: "87 AED",
                      like:
                      (wishController.wishListData
                          .where((element) =>
                      element.productId == dashboardController.productsList[index].productId.toString())
                          .toList())
                          .isEmpty
                          ?

                      GestureDetector(
                        onTap: (){
                          ApiManger().addFav(context: context,id: dashboardController.productsList[index].productId.toString(),customerId:(homeController.id).toString() );

                        },
                        child: Container(
                          height: 32,
                          width: 32,
                          decoration: BoxDecoration(
                              color:
                              AppLightColors.white_color,
                              borderRadius: BorderRadius.circular(100)),
                          child: Center(
                            child: Image.asset(


                              "assets/icons/love.png",
                              color: AppLightColors.greyColorWish,
                              height: 20,
                              width: 20,
                            ),
                          ),
                        ),
                      ):
                      GestureDetector(
                        onTap: (){
                          ApiManger().removeFav(context: context,id: dashboardController.productsList[index].productId.toString(),customerId:(homeController.id).toString() );
                        },
                        child: Container(
                          height: 32,
                          width: 32,
                          decoration: BoxDecoration(
                              color:
                              AppLightColors.white_color,
                              borderRadius: BorderRadius.circular(100)),
                          child: Padding(
                            padding: const EdgeInsets.all(6.5),
                            child: Center(
                              child: SvgPicture.asset(


                                "assets/icons/unfav.svg",
                                color: AppLightColors.primary_color,
                                height: 20,
                                width: 20,
                              ),
                            ),
                          ),
                        ),
                      )
                  ),
                ),
              ),
            );
          }
      ),
    );
  }
}
