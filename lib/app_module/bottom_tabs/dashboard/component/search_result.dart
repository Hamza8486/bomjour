import 'package:bomjour/app_module/bottom_tabs/dashboard/component/dashboard_component.dart';
import 'package:bomjour/app_module/bottom_tabs/profile/component/wishlist/controller/wishlist_controller.dart';
import 'package:bomjour/app_module/filter_view/component/create_occasion_popup.dart';
import 'package:bomjour/app_module/filter_view/controller/filter_controller.dart';
import 'package:bomjour/app_module/filter_view/view/filter_view.dart';
import 'package:bomjour/app_module/home/controller/home_controller.dart';
import 'package:bomjour/app_module/product_detail_page/controller/prooduct_detail_controller.dart';
import 'package:bomjour/app_module/product_detail_page/view/product_detail_view.dart';
import 'package:bomjour/services/api_manager.dart';
import 'package:bomjour/utils/app_common_widgets/app_text.dart';
import 'package:bomjour/utils/app_common_widgets/helper_function.dart';
import 'package:bomjour/utils/app_constants/app_config.dart';
import 'package:bomjour/utils/app_constants/app_images.dart';
import 'package:bomjour/utils/app_constants/localization.dart';
import 'package:bomjour/utils/app_themes/app_colors.dart';
import 'package:bomjour/utils/dark_theme_provider/dark_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_svg/svg.dart';
import 'dart:ui' as ui;

class SearchResult extends StatefulWidget {
  SearchResult({super.key,this.name,this.type});
  var name;
  var type;

  @override
  State<SearchResult> createState() => _SearchResultState();
}

class _SearchResultState extends State<SearchResult> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if(widget.type!="cat"){
      Future.delayed(Duration(seconds: 3), () {
        showModalBottomSheet(
          backgroundColor: Colors.transparent,
          isScrollControlled: true,
          isDismissible: true,
          context: context,
          builder: (context) => CreateOccasionPopup(),
        );
      });
    }

  }




  @override
  Widget build(BuildContext context) {
    var localization = AppLocalizations.of(context);
    final filterController = Provider.of<FilterController>(context);
    final wishController = Provider.of<WishlistController>(context);
    final productDetailController = Provider.of<ProductDetailController>(context);
    final homeController = Provider.of<HomeController>(context);
    final themeChange = Provider.of<ThemeLocalizationProvider>(context);
    return Directionality(
      textDirection: themeChange.locale.languageCode == "en"
          ? ui.TextDirection.ltr
          : ui.TextDirection.ltr,
      child: Scaffold(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          body: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: AppConfig(context).width * 0.04),
            child: Column(
              children: [
                SizedBox(
                  height: AppConfig(context).height * 0.06,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        color: Colors.transparent,
                        height: 20,
                        width: 20,
                        child: SvgPicture.asset(
                          AppImages.BACK1,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                    ),
                    AppText(
                      text:
                      widget.type=="cat"?"${widget.name.toString()}":
                      "${filterController.filterList.length.toString()} ${localization.resultFor} “${widget.name.toString()}”",
                      size: 16,
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.w600,
                    ),
                    widget.type=="cat"?Container():
                    GestureDetector(
                      onTap: () {
                        filterController.getAllSpecial();
                        filterController.getAllOccasion();
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => FilterView()));
                      },
                      child: SvgPicture.asset(
                        AppImages.filter,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: AppConfig(context).height * 0.02,
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: AppConfig(context).height * 0.015,
                        ),
                        filterController.filterLoader? loader(height: AppConfig(context).height*0.35)

                            :
                        filterController.filterList.isEmpty?
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: AppConfig(context).height * 0.35,
                            ),

                            Center(
                              child: AppText(
                                text:"No Data!",
                                size: 16,
                                color: Theme.of(context).primaryColor,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ):
                        GridView.builder(
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          primary: false,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 167 / 322,
                            crossAxisSpacing: 12,
                            mainAxisSpacing: 12,
                          ),
                          itemCount: filterController.filterList.length,
                          itemBuilder: (BuildContext ctx, index) {
                            return SizedBox(
                              child: GestureDetector(
                                onTap: (){
                                  productDetailController.originalWrapperData.clear();
                                  productDetailController.getWrapperData();
                                  productDetailController.productDetailList=null;
                                  productDetailController.getProductDetailData(id: filterController.filterList[index].productId.toString(),context: context);
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) =>  ProductDetailView()),
                                  );
                                },
                                child: giftCommonWidget(
                                  sale: false,
                                  context: context,
                                  width: AppConfig(context).width,
                                  title: filterController.filterList[index].productName.toString(),
                                  image: filterController.filterList[index].productImage.toString(),
                                  rating: "0",
                                  price: "${filterController.filterList[index].productPrice.toString()} AED",
                                  discountPrice: "${filterController.filterList[index].productPrice.toString()} AED",
                                    like:
                                    (wishController.wishListData
                                        .where((element) =>
                                    element.productId == filterController.filterList[index].productId)
                                        .toList())
                                        .isEmpty
                                        ?

                                    GestureDetector(
                                      onTap: (){
                                        ApiManger().addFav(context: context,id: filterController.filterList[index].productId.toString(),customerId:(homeController.id).toString() );

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
                                        ApiManger(). removeFav(context: context,id: filterController.filterList[index].productId.toString(),customerId:(homeController.id).toString() );
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
                            );
                          },
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
