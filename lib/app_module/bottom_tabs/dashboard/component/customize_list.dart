import 'package:bomjour/app_module/bottom_tabs/dashboard/controller/dashboard_controller.dart';
import 'package:bomjour/app_module/product_detail_page/controller/prooduct_detail_controller.dart';
import 'package:bomjour/app_module/product_detail_page/view/product_detail_view.dart';
import 'package:bomjour/utils/app_common_widgets/app_text.dart';
import 'package:bomjour/utils/app_constants/app_config.dart';
import 'package:bomjour/utils/app_padding/app_paddings.dart';
import 'package:bomjour/utils/dark_theme_provider/dark_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class CustomizeList extends StatelessWidget {
  CustomizeList({super.key});

  @override
  Widget build(BuildContext context) {
    final productDetailController = Provider.of<ProductDetailController>(context);
    final themeChange = Provider.of<ThemeLocalizationProvider>(context);
    final dashboardController = Provider.of<DashboardController>(context);
    return Container(
      height: 216,


      child: ListView.builder(
          shrinkWrap: true,
          primary: false,

          scrollDirection: Axis.horizontal,
          padding:  EdgeInsets.zero,
          itemCount: dashboardController.customizeList.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: (){
                productDetailController.originalWrapperData.clear();
                productDetailController.getWrapperData();
                productDetailController.productDetailList=null;
                productDetailController.getProductDetailData(id: dashboardController.customizeList[index].id.toString(),context: context);
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
                child:Container(
                  height: 216,
                  width: 320,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                          image: AssetImage(
                            "assets/images/dummy2.png",
                          ),
                          fit: BoxFit.cover
                      )
                  ),

                  child:  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,

                    children: [
                      AppText(
                        text: themeChange.locale.languageCode == "en"?"${dashboardController.customizeList[index].name}":"${dashboardController.customizeList[index].arName}",
                        size: 24,
                        maxline: 2,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                      SizedBox(height:AppConfig(context).height*0.008 ,),
                      AppText(
                        text: "As unique as they are",
                        size: 16,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                      ),
                      SizedBox(height:AppConfig(context).height*0.012 ,),
                      Container(

                        height: 40,
                        width: 219,
                        decoration: BoxDecoration(

                            border: Border.all(color: Colors.white),
                            borderRadius: BorderRadius.circular(100)

                        ),
                        child: Center(
                          child: AppText(
                            text: "Shop Now",
                            size: 16,

                            fontWeight: FontWeight.w500,
                            color: Colors.white,
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
