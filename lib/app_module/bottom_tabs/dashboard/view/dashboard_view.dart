import 'package:bomjour/app_module/bottom_tabs/dashboard/component/best_gift.dart';
import 'package:bomjour/app_module/bottom_tabs/dashboard/component/customize_list.dart';
import 'package:bomjour/app_module/bottom_tabs/dashboard/component/dashboard_component.dart';
import 'package:bomjour/app_module/bottom_tabs/dashboard/component/gift_shops.dart';
import 'package:bomjour/app_module/bottom_tabs/dashboard/component/search.dart';
import 'package:bomjour/app_module/bottom_tabs/dashboard/component/top_gift.dart';
import 'package:bomjour/app_module/bottom_tabs/dashboard/component/trending_occassions.dart';
import 'package:bomjour/app_module/bottom_tabs/dashboard/component/top_category.dart';
import 'package:bomjour/app_module/bottom_tabs/dashboard/component/top_sellers.dart';
import 'package:bomjour/app_module/bottom_tabs/dashboard/controller/dashboard_controller.dart';
import 'package:bomjour/app_module/bottom_tabs/profile/component/notification.dart';
import 'package:bomjour/app_module/cart_view/cart_controller/cart_controller.dart';
import 'package:bomjour/app_module/cart_view/view/cart_view.dart';
import 'package:bomjour/app_module/filter_view/controller/filter_controller.dart';
import 'package:bomjour/app_module/home/controller/home_controller.dart';
import 'package:bomjour/app_module/occasions_view/view/occasions_view.dart';
import 'package:bomjour/utils/app_common_widgets/app_text.dart';
import 'package:bomjour/utils/app_common_widgets/app_text_field.dart';
import 'package:bomjour/utils/app_common_widgets/helper_function.dart';
import 'package:bomjour/utils/app_common_widgets/shimmers.dart';
import 'package:bomjour/utils/app_constants/app_config.dart';
import 'package:bomjour/utils/app_constants/app_images.dart';
import 'package:bomjour/utils/app_constants/localization.dart';
import 'package:bomjour/utils/app_padding/app_paddings.dart';
import 'package:flutter_svg/svg.dart';
import 'package:bomjour/utils/app_themes/app_colors.dart';
import 'package:bomjour/utils/dark_theme_provider/dark_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:ui' as ui;


class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {




  @override
  Widget build(BuildContext context) {
    final filterController = Provider.of<FilterController>(context);
    final dashboardController = Provider.of<DashboardController>(context);
    final cartController = Provider.of<CartController>(context);
    var localization = AppLocalizations.of(context);
    final themeChange = Provider.of<ThemeLocalizationProvider>(context);
    return Directionality(
      textDirection: themeChange.locale.languageCode == "en"
          ? ui.TextDirection.ltr
          : ui.TextDirection.rtl,
      child: Scaffold(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Container(
                      width: double.infinity,
                      height: 180,
                      color: AppLightColors.primary_color,
                      child: Padding(
                        padding: AppPaddings.onlyHorizontalPadding(
                            padding: AppConfig(context).width * 0.04),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 65,
                            ),
                            Row(
                              mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    filterController.getAllOccasion();
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                OccasionView()));
                                  },
                                  child: Container(
                                    color: Colors.transparent,
                                    child: Row(
                                      children: [
                                        AppText(
                                          text: localization.allOcc,
                                          size: 16,
                                          fontWeight: FontWeight.w600,
                                          color: AppLightColors.white_color,
                                        ),
                                        SizedBox(
                                          width: 8,
                                        ),
                                        SvgPicture.asset(AppImages.down)
                                      ],
                                    ),
                                  ),
                                ),
                                Row(
                                  children: [
                                    GestureDetector(
                                        onTap:(){
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(builder: (context) =>  NotificationView()),
                                          );
                                        },
                                        child
                                            : SvgPicture.asset(AppImages.bell)),
                                    SizedBox(
                                      width: 14,
                                    ),
                                    GestureDetector(
                                        onTap:
                                        cartController.cartAddList.isEmpty?(){
                                          flutterToast(msg: "Your cart is empty");
                                        }:
                                            (){
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(builder: (context) =>  CartView()),
                                          );
                                        },
                                        child: SvgPicture.asset(AppImages.cart)),
                                  ],
                                )
                              ],
                            ),
                            SizedBox(
                              height: 19,
                            ),
                            appField(

                                context: context,
                                isRead: true,
                                onTap: () {

                                  filterController.searchList.clear();
                                  filterController.catList.clear();
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              SearchView()));
                                },
                                isCur: false,
                                hint: localization.searchGift,
                                border: themeChange.darkTheme
                                    ? AppLightColors.textField_back_dark
                                    : AppLightColors.white_color,
                                borderRadius: BorderRadius.circular(100),
                                isPrefix: true,
                                fillColor: themeChange.darkTheme
                                    ? AppLightColors.textField_back_dark
                                    : AppLightColors.white_color,
                                textInputAction: TextInputAction.done,
                                child1: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 16,
                                      right: 16,
                                      bottom: 3,
                                      top: 5),
                                  child: SvgPicture.asset(
                                    AppImages.search_icon,
                                    color: AppLightColors.border_color,
                                  ),
                                )),
                          ],
                        ),
                      ),
                    ),
                    cartController.cartAddList.isEmpty?SizedBox.shrink():
                    Positioned(
                        top:AppConfig(context).height*0.062,
                        right:13,
                        child: Container(

                          padding: const EdgeInsets.all(5),
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child:AppText(
                              size: 8,
                              fontWeight: FontWeight.w700,
                              color:AppLightColors.primary_color, text: cartController.totalQuantity.toString(),
                            ),
                          ),
                        )
                    )
                  ],
                ),
                // TopCategories(),
                Container(
                  width: double.infinity,
                  height: 180,
                  color: themeChange.darkTheme?AppLightColors.black_color:

                  AppLightColors.light_color,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      rowData(context: context,
                          title: localization.topCat,
                          onTap:(){}
                      ),
                      SizedBox(height:AppConfig(context).height*0.02 ,),
                      dashboardController.categoryLoader?
                      catEffect(context: context):
                      TopCategories(),
                    ],
                  ),
                ),
                // TopGift(),
                SizedBox(height:20 ,),
                rowData(context: context,
                    title: AppLocalizations.of(context).topGift,
                    onTap:(){}
                ),
                SizedBox(height:AppConfig(context).height*0.015 ,),
                dashboardController.productsLoader?
                getShimmerAllLoading(context: context):
                TopGift(),
                // BirthdayGift(),
                rowData(context: context,
                    title:AppLocalizations.of(context).bestGift,
                    onTap:(){}
                ),
                SizedBox(height:AppConfig(context).height*0.015 ,),
                filterController.specialLoader?
                getShimmerBestEffect(context: context):
                BirthdayGift(),

                // TrendingOccasion(),
                SizedBox(height:32 ,),
                rowData(context: context,
                    title: AppLocalizations.of(context).trendingOcc,
                    onTap:(){}
                ),
                SizedBox(height:AppConfig(context).height*0.015 ,),
                filterController.occasionLoader?
                getShimmerTrendingEffect(context: context):
                TrendingOccasion(),

                // CustomizeList(),
                SizedBox(height:32 ,),
                rowData(context: context,
                    title: AppLocalizations.of(context).customize,
                    onTap:(){}
                ),
                SizedBox(height:AppConfig(context).height*0.015 ,),
                dashboardController.customizeLoader?
                getShimmerCustomizeEffect(context: context):
                CustomizeList(),

                // TopSellers(),
                SizedBox(height:32 ,),
                rowData(context: context,
                    title:AppLocalizations.of(context).topSeller,
                    onTap:(){}
                ),
                SizedBox(height:AppConfig(context).height*0.015 ,),

                TopSellers(),

                // GiftShops(),

                rowData(
                    context: context,
                    title: AppLocalizations.of(context).nearBy,
                    onTap: () {}),

                SizedBox(
                  height: AppConfig(context).height * 0.015,
                ),
                dashboardController.businessLoader?
                giftShopEffect(context: context):
                GiftShops(),
                SizedBox(
                  height: AppConfig(context).height * 0.025,
                ),
              ],
            ),
          )
          ));

  }





}
