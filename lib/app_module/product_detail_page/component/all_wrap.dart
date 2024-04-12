import 'package:bomjour/app_module/bottom_tabs/profile/component/profile_component.dart';
import 'package:bomjour/app_module/cart_view/cart_controller/cart_controller.dart';
import 'package:bomjour/app_module/product_detail_page/component/components.dart';
import 'package:bomjour/app_module/product_detail_page/controller/prooduct_detail_controller.dart';
import 'package:bomjour/utils/app_common_widgets/app_button.dart';
import 'package:bomjour/utils/app_common_widgets/app_text.dart';
import 'package:bomjour/utils/app_common_widgets/app_text_field.dart';
import 'package:bomjour/utils/app_constants/app_images.dart';
import 'package:bomjour/utils/app_constants/localization.dart';
import 'package:bomjour/utils/app_themes/app_colors.dart';
import 'package:bomjour/utils/dark_theme_provider/dark_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:flutter_svg/svg.dart';

import 'dart:ui' as ui;

class AllWrap extends StatelessWidget {
  const AllWrap({super.key});

  @override
  Widget build(BuildContext context) {
    final isKeyBoard = MediaQuery.of(context).viewInsets.bottom != 0;
    final cartController = Provider.of<CartController>(context);
    final productDetailController = Provider.of<ProductDetailController>(context);
    final themeChange = Provider.of<ThemeLocalizationProvider>(context);
    return Directionality(
        textDirection: themeChange.locale.languageCode == "en"
            ? ui.TextDirection.ltr
            : ui.TextDirection.rtl,
        child: Scaffold(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              appBarProfile(
                  context: context,
                  title: AppLocalizations.of(context).SelectWrap,
                  thickness: 2
              ),
              Container(
                width: double.infinity,
                height: 76,
                color: themeChange.darkTheme
                    ? AppLightColors.textField_back_dark
                    : AppLightColors.profileBackColor,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Center(
                    child: appField(
                        context: context,
                        hint: AppLocalizations.of(context).searchWrap,
                        border: AppLightColors.border_color,
                        borderRadius: BorderRadius.circular(100),
                        isPrefix: true,
                        onChange: (val){
                          print(val.toString());
                          productDetailController.filterWrapData(val.toString());
                        },
                        fillColor: themeChange.darkTheme
                            ? AppLightColors.textField_back_dark
                            : AppLightColors.white_color,
                        textInputAction: TextInputAction.done,

                        child1: Padding(
                          padding: const EdgeInsets.only(
                              left: 16, right: 16, bottom: 3, top: 5),
                          child: SvgPicture.asset(
                            AppImages.search_icon,
                            color: AppLightColors.border_color,
                          ),
                        )),
                  ),
                ),
              ),
              SizedBox(height: 24,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppText(
                      text:AppLocalizations.of(context).prefBased,
                      size: 16,
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.w500,
                    ),
                    AppText(
                      text:AppLocalizations.of(context).seeAll,
                      size: 16,
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.w500,
                    ),

                  ],
                ),
              ),
              SizedBox(height: 8,),

              Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(height: 12,),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: GridView.builder(

                              padding: EdgeInsets.zero,
                              shrinkWrap: true,
                              primary: false,
                              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3,
                                  childAspectRatio: 110/110,
                                  crossAxisSpacing: 16,
                                  mainAxisSpacing: 16),
                              itemCount:productDetailController.originalWrapperData.length,
                              itemBuilder: (BuildContext ctx, index) {
                                return wrapComp(image:productDetailController.originalWrapperData[index].image.toString(),
                                    onTap: (){
                                      cartController.updateWrapperId(productDetailController.originalWrapperData[index].id.toString());
                                    },
                                    color:
                                    cartController.wrapperId == productDetailController.originalWrapperData[index].id.toString()?
                                    AppLightColors.primary_color:
                                    AppLightColors.otpLightColor
                                );
                              }),
                        )
                      ],
                    ),
                  )),
              isKeyBoard?SizedBox.shrink():
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: 16,vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    Expanded(
                      child: AppButton(

                          buttonName: AppLocalizations.of(context).AddWrap,



                          onTap: () {
                            Navigator.pop(context);
                          }),
                    ),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
