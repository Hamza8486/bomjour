
import 'package:bomjour/app_module/filter_view/controller/filter_controller.dart';
import 'package:bomjour/app_module/product_detail_page/controller/prooduct_detail_controller.dart';
import 'package:bomjour/app_module/product_detail_page/view/product_detail_view.dart';
import 'package:bomjour/utils/app_common_widgets/app_text.dart';
import 'package:bomjour/utils/app_constants/app_config.dart';
import 'package:bomjour/utils/app_padding/app_paddings.dart';
import 'package:bomjour/utils/app_themes/app_colors.dart';
import 'package:bomjour/utils/dark_theme_provider/dark_theme.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';



class BirthdayGift extends StatelessWidget {

  BirthdayGift({super.key});

  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<ThemeLocalizationProvider>(context);
    final productDetailController = Provider.of<ProductDetailController>(context);
    final filterController = Provider.of<FilterController>(context);
    return Container(
      height: 190,

      child: ListView.builder(
          shrinkWrap: true,
          primary: false,

          scrollDirection: Axis.horizontal,
          padding:  EdgeInsets.zero,
          itemCount: filterController.specializeList.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: (){
                productDetailController.productDetailList=null;
                productDetailController.originalWrapperData.clear();
                productDetailController.getWrapperData();
                productDetailController.getProductDetailData(id: filterController.specializeList[index].id.toString(),context: context);
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
                child: Container(
                  width: 120,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 160,
                        width: 120,
                        child:  ClipRRect(
                          borderRadius: BorderRadius.only(topLeft: Radius.circular(10),
                              topRight: Radius.circular(10)
                          ),
                          child:CachedNetworkImage(
                            placeholder: (context, url) =>   Center(
                              child: SpinKitThreeBounce(
                                  size: 16,
                                  color: AppLightColors.primary_color
                              ),
                            ),
                            imageUrl:filterController.specializeList[index].image.toString(),
                            fit: BoxFit.cover,

                            errorWidget: (context, url, error) =>

                                ClipRRect(
                                  borderRadius: BorderRadius.only(topLeft: Radius.circular(10),
                                      topRight: Radius.circular(10)),
                                  child: Image.asset(
                                    "assets/images/best.png",
                                    fit: BoxFit.cover,

                                  ),
                                ),
                          ),




                        ),
                      ),

                      Expanded(
                        child: Container(
                          width: AppConfig(context).width,

                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(bottomRight: Radius.circular(10),
                                  bottomLeft: Radius.circular(10)
                              ),
                              color: AppLightColors.primary_color
                          ),

                          child: Center(
                            child: AppText(
                              text: themeChange.locale.languageCode  =="en"?"${filterController.specializeList[index].name.toString()}":"${filterController.specializeList[index].ar_name.toString()}",
                              size: 13,
                              maxline: 1,
                              fontWeight: FontWeight.w400,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }
      ),
    );
  }
}
