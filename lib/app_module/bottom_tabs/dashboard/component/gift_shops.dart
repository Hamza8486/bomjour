import 'package:bomjour/app_module/bottom_tabs/dashboard/controller/dashboard_controller.dart';
import 'package:bomjour/app_module/product_detail_page/controller/prooduct_detail_controller.dart';
import 'package:bomjour/app_module/product_detail_page/view/product_detail_view.dart';
import 'package:bomjour/utils/app_common_widgets/app_text.dart';
import 'package:bomjour/utils/app_constants/app_config.dart';
import 'package:bomjour/utils/app_padding/app_paddings.dart';
import 'package:bomjour/utils/app_themes/app_colors.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../../../utils/dark_theme_provider/dark_theme.dart';
import 'package:provider/provider.dart';

class GiftShops extends StatelessWidget {

  GiftShops({super.key});

  @override
  Widget build(BuildContext context) {
    final productDetailController = Provider.of<ProductDetailController>(context);
    final themeChange = Provider.of<ThemeLocalizationProvider>(context);
    final dashboardController = Provider.of<DashboardController>(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [



        if (dashboardController.businessList.isNotEmpty)
          Container(
            height: 128,
            child: ListView.builder(
                shrinkWrap: true,
                primary: false,
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.zero,
                itemCount: dashboardController.businessList.length,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: (){
                      productDetailController.productDetailList=null;
                      productDetailController.originalWrapperData.clear();
                      productDetailController.getWrapperData();
                      productDetailController.getProductDetailData(id:dashboardController.businessList[index].id.toString(),context: context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) =>  ProductDetailView()),
                      );
                    },
                    child: Padding(
                      padding: AppPaddings.onlyPadding(
                        left: index == 0
                            ? AppConfig(context).width * 0.04
                            : AppConfig(context).width * 0.03,
                      ),
                      child: Container(
                        width: 164,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 100,
                              width: 164,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: CachedNetworkImage(
                                  placeholder: (context, url) => Center(
                                    child: SpinKitThreeBounce(
                                        size: 16,
                                        color: AppLightColors.primary_color),
                                  ),
                                  imageUrl: dashboardController.businessList[index].coverMedia.toString(),
                                  fit: BoxFit.cover,
                                  errorWidget: (context, url, error) => ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.asset(
                                      "assets/images/shop.png",
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: AppConfig(context).height * 0.005,
                            ),
                            AppText(
                              text: themeChange.locale.languageCode == "en"
                                  ? "${dashboardController.businessList[index].businessName.toString()}"
                                  : "${dashboardController.businessList[index].businessName.toString()}",
                              size: 14,
                              fontWeight: FontWeight.w500,
                              color: Theme.of(context).primaryColor,
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }),
          ),
      ],
    );
  }
}
