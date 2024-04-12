import 'package:bomjour/app_module/bottom_tabs/dashboard/component/search_result.dart';
import 'package:bomjour/app_module/bottom_tabs/dashboard/controller/dashboard_controller.dart';
import 'package:bomjour/app_module/filter_view/controller/filter_controller.dart';
import 'package:bomjour/utils/app_common_widgets/app_text.dart';
import 'package:bomjour/utils/app_constants/app_config.dart';
import 'package:bomjour/utils/app_constants/localization.dart';
import 'package:bomjour/utils/app_padding/app_paddings.dart';
import 'package:bomjour/utils/app_themes/app_colors.dart';
import 'package:bomjour/utils/dark_theme_provider/dark_theme.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../../../utils/app_constants/api_constant.dart';

class TopCategories extends StatelessWidget {

  TopCategories({super.key});

  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<ThemeLocalizationProvider>(context);
    final filterController = Provider.of<FilterController>(context);
    final dashboardController = Provider.of<DashboardController>(context);
    return  Container(
      height: 90,

      child:


      ListView.builder(
          shrinkWrap: true,
          primary: false,

          scrollDirection: Axis.horizontal,
          padding:  EdgeInsets.zero,
          itemCount: dashboardController.categoryList.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: (){
                filterController.filterList.clear();
                print(dashboardController.categoryList[index].id.toString());
                filterController.getFilterData(catIId:dashboardController.categoryList[index].id.toString() );
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>  SearchResult(name:dashboardController.categoryList[index].name.toString() ,
                    type: "cat",
                    )));
              },
              child: Padding(
                padding:
                themeChange.locale.languageCode == "en"?
                AppPaddings.onlyPadding(left:
                index==0? AppConfig(context).width*0.04:
                AppConfig(context).width*0.03,
                ):AppPaddings.onlyPadding(right:
                index==0? AppConfig(context).width*0.04:
                AppConfig(context).width*0.03,
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: 60,
                      width: 60,
                      child:  ClipRRect(
                        borderRadius: BorderRadius.circular(1000),
                        child:CachedNetworkImage(
                          placeholder: (context, url) =>   Center(
                            child: SpinKitThreeBounce(
                                size: 16,
                                color: AppLightColors.primary_color
                            ),
                          ),
                          imageUrl:    "${ApiConstant.imageUrl }${dashboardController.categoryList[index].categoryImage.toString()}",
                          fit: BoxFit.cover,

                          errorWidget: (context, url, error) =>

                              ClipRRect(
                                borderRadius: BorderRadius.circular(1000),
                                child: Image.asset(
                                  "assets/images/cake.png",
                                  fit: BoxFit.cover,

                                ),
                              ),
                        ),


                      ),
                    ),
                    SizedBox(height:AppConfig(context).height*0.005 ,),
                    AppText(
                      text: themeChange.locale.languageCode  =="en"?"${dashboardController.categoryList[index].name}":"${dashboardController.categoryList[index].arName}",
                      size: 12,
                      fontWeight: FontWeight.w400,
                      color: Theme.of(context).primaryColor,
                    ),
                  ],
                ),
              ),
            );
          }
      ),
    );
  }
}
