import 'package:bomjour/app_module/cart_view/cart_controller/cart_controller.dart';
import 'package:bomjour/app_module/product_detail_page/component/components.dart';
import 'package:bomjour/app_module/product_detail_page/controller/prooduct_detail_controller.dart';
import 'package:bomjour/utils/app_themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';



class AvailableWraps extends StatelessWidget {
  const AvailableWraps({super.key});

  @override
  Widget build(BuildContext context) {
    final productDetailController = Provider.of<ProductDetailController>(context);
    final cartController = Provider.of<CartController>(context);
    return SizedBox(
      height: 110,
      child: ListView.builder(

          itemCount: productDetailController.originalWrapperData.length,
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          primary: false,
          padding: EdgeInsets.zero,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding:  EdgeInsets.only(left:
              index==0?0:
              8),
              child: wrapComp(image: productDetailController.originalWrapperData[index].image.toString(),
              onTap: (){
                cartController.updateWrapperId(productDetailController.originalWrapperData[index].id.toString());
              },
                color:
                cartController.wrapperId == productDetailController.originalWrapperData[index].id.toString()?
                    AppLightColors.primary_color:
                AppLightColors.otpLightColor
              ),
            );
          }),
    );
  }
}
