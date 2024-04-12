import 'package:bomjour/app_module/bottom_tabs/dashboard/component/dashboard_component.dart';
import 'package:bomjour/app_module/filter_view/controller/filter_controller.dart';
import 'package:bomjour/app_module/product_detail_page/controller/prooduct_detail_controller.dart';
import 'package:bomjour/app_module/product_detail_page/view/product_detail_view.dart';
import 'package:bomjour/utils/app_constants/app_config.dart';
import 'package:bomjour/utils/app_padding/app_paddings.dart';
import 'package:bomjour/utils/dark_theme_provider/dark_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class TrendingOccasion extends StatelessWidget {

  TrendingOccasion({super.key});

  @override
  Widget build(BuildContext context) {
    final productDetailController = Provider.of<ProductDetailController>(context);
    final themeChange = Provider.of<ThemeLocalizationProvider>(context);
    final filterController = Provider.of<FilterController>(context);
    return Container(
      height: 121,


      child: ListView.builder(
          shrinkWrap: true,
          primary: false,

          scrollDirection: Axis.horizontal,
          padding:  EdgeInsets.zero,
          itemCount: filterController.occasionList.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: (){
                productDetailController.productDetailList=null;
                productDetailController.getProductDetailData(id: filterController.occasionList[index].id.toString(),context: context);
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
                child:occasionCommonWidget(image:   (filterController.occasionList[index].image!="")?(filterController.occasionList[index].image):
                "assets/images/cake1.png"
                ,
                title:  themeChange.locale.languageCode == "en"? filterController.occasionList[index].name:filterController.occasionList[index].ar_name
                ),
              ),
            );
          }
      ),
    );
  }
}
