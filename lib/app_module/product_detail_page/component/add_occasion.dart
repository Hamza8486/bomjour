import 'package:bomjour/app_module/bottom_tabs/profile/component/wishlist/component/add_wishlist.dart';
import 'package:bomjour/app_module/product_detail_page/controller/prooduct_detail_controller.dart';
import 'package:bomjour/utils/app_common_widgets/app_text.dart';
import 'package:bomjour/utils/app_constants/app_config.dart';
import 'package:bomjour/utils/app_constants/app_images.dart';
import 'package:bomjour/utils/app_constants/localization.dart';
import 'package:bomjour/utils/app_themes/app_colors.dart';
import 'package:bomjour/utils/dark_theme_provider/dark_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:provider/provider.dart';
import 'dart:ui' as ui;

class AddOccasion extends StatefulWidget {


  AddOccasion({super.key});

  @override
  State<AddOccasion> createState() => _AddOccasionState();
}

class _AddOccasionState extends State<AddOccasion> {

int indexValue = -1;
  @override
  Widget build(BuildContext context) {
    final isKeyBoard = MediaQuery.of(context).viewInsets.bottom != 0;
    final productDetailController = Provider.of<ProductDetailController>(context);
    final themeChange = Provider.of<ThemeLocalizationProvider>(context);

    return Directionality(
      textDirection: themeChange.locale.languageCode == "en"
          ? ui.TextDirection.ltr
          : ui.TextDirection.rtl,
      child:DraggableScrollableSheet(
        initialChildSize:  0.5,
        minChildSize:  0.5,
        maxChildSize:  0.5,
        builder: (_, controller) => Container(
          decoration: BoxDecoration(
            color: Theme.of(context).scaffoldBackgroundColor,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10)),
          ),
          child: Padding(
            padding: EdgeInsets.only(top: 10),
            child: Column(
              children: [
                SizedBox(
                  height: AppConfig(context).height * 0.01,
                ),
                SvgPicture.asset(AppImages.border),
                SizedBox(
                  height: 16,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: AppText(
                    text:
                    "Select Occasion",
                    size: 18,
                    color: Theme.of(context).primaryColor,
                    textAlign: themeChange.locale.languageCode == "en"
                        ? TextAlign.left
                        : TextAlign.right,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                Divider(color:
                themeChange.darkTheme?AppLightColors.black_color:
                AppLightColors.dividerColor,height: 0,),

                GestureDetector(
                  onTap:(){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>  NewWishlist()),
                    );
                  },
                  child: Container(
                    width: AppConfig(context).width,
                    height: 70,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        children: [
                          SvgPicture.asset("assets/icons/add_circle.svg"),
                          SizedBox(width: 10,),
                          AppText(
                            text:
                            AppLocalizations.of(context).newWishlist,
                            size: 16,
                            fontWeight: FontWeight.w500,
                            color:
                            themeChange.darkTheme?AppLightColors.greyColorWish:
                            AppLightColors.black_color,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Divider(color:
                themeChange.darkTheme?AppLightColors.black_color:
                AppLightColors.dividerColor,height: 0,),


                Expanded(
                  child: ListView.builder(
                      padding: EdgeInsets.only(top: 10),
                      shrinkWrap: true,
                      primary: false,
                      itemCount: productDetailController.productDetailList?.occasions?.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          child: Column(
                            children: [
                              GestureDetector(
                                onTap:(){
                                  setState(() {
                                    indexValue=index;
                                  });
                                },
                                child: Container(
                                  color:Colors.transparent,
                                  child: Padding(
                                    padding:  EdgeInsets.symmetric(horizontal: 16),
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          height: 34,
                                          width: 34,
                                          child: ClipRRect(
                                            borderRadius: BorderRadius.circular(10),
                                            child:CachedNetworkImage(
                                              placeholder: (context, url) =>   Center(
                                                child: SpinKitThreeBounce(
                                                    size: 16,
                                                    color: AppLightColors.primary_color
                                                ),
                                              ),
                                              imageUrl:    "",
                                              fit: BoxFit.cover,

                                              errorWidget: (context, url, error) =>

                                                  ClipRRect(
                                                    borderRadius: BorderRadius.circular(10),
                                                    child: Image.asset(
                                                      "assets/images/dummy5.png",
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
                                                "For ${productDetailController.productDetailList?.occasions?[index].firstName} ${productDetailController.productDetailList?.occasions?[index].name}",
                                                size: 16,
                                                fontWeight: FontWeight.w500,
                                                color: Theme.of(context).primaryColor,
                                              ),


                                            ],
                                          ),
                                        ),
                                        SizedBox(width: 10,),
                                        SvgPicture.asset(
                                            indexValue==index?
                                            "assets/icons/fill.svg":"assets/icons/unFill.svg"),
                                        SizedBox(width: 10,),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 20,),
                              Divider(color:
                              themeChange.darkTheme?AppLightColors.black_color:
                              AppLightColors.dividerColor,height: 0,),
                            ],
                          ),
                        );
                      }),
                )
              ],
            ),
          ),
        ),
      )
    );
  }
}
