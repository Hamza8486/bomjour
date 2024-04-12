import 'package:bomjour/app_module/authentication/login_type/login_type_view.dart';
import 'package:bomjour/app_module/country_selection/controller/country_select_controller.dart';
import 'package:bomjour/utils/app_common_widgets/app_text.dart';
import 'package:bomjour/utils/app_constants/localization.dart';
import 'package:bomjour/utils/app_themes/app_colors.dart';
import 'package:bomjour/utils/dark_theme_provider/dark_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:ui' as ui;

class TopCities extends StatelessWidget {
  TopCities({super.key});

  List topCity = [
    {
      "image": "assets/images/city.png",
      "name": "Riyadh",
    },
    {
      "image": "assets/images/city1.png",
      "name": "Jeddah",
    },
    {
      "image": "assets/images/city2.png",
      "name": "Al Khobar",
    },
    {
      "image": "assets/images/city3.png",
      "name": "Dubai",
    },
    {
      "image": "assets/images/city4.png",
      "name": "Abu Dhabi",
    },
    {
      "image": "assets/images/city.png",
      "name": "Amman",
    }
  ];

  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<ThemeLocalizationProvider>(context);
    final countrySelectionController =
        Provider.of<CountrySelectionController>(context);

    return Directionality(
        textDirection: themeChange.locale.languageCode == "en"
            ? ui.TextDirection.ltr
            : ui.TextDirection.rtl,
        child: countrySelectionController.topCityLoader
            ? Center(
                child: CircularProgressIndicator(
                  color: AppLightColors.primary_color,
                ),
              )
            : countrySelectionController.topCityList.isEmpty
                ? Center(
                    child: AppText(
                      text: AppLocalizations.of(context).noRecordFound,
                      size: 20,
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.w500,
                    ),
                  )
                : GridView.builder(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    primary: false,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        childAspectRatio: 110 / 110,
                        crossAxisSpacing: 16,
                        mainAxisSpacing: 16),
                    itemCount: countrySelectionController.topCityList.length,
                    itemBuilder: (BuildContext ctx, index) {
                      return GestureDetector(
                        onTap: () {

                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) =>  LoginTypeView()),
                          );
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(builder: (context) =>  PreferenceView()),
                          // );
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                  image: AssetImage(topCity[index]["image"]),
                                  fit: BoxFit.cover)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              AppText(
                                text: themeChange.locale.languageCode == "en"
                                    ? countrySelectionController
                                        .topCityList[index].name
                                        .toString()
                                    : countrySelectionController
                                        .topCityList[index].arName
                                        .toString(),
                                size: 14,
                                textAlign:
                                    themeChange.locale.languageCode == "en"
                                        ? TextAlign.left
                                        : TextAlign.right,
                                color: AppLightColors.white_color,
                                fontWeight: FontWeight.w500,
                              ),
                              SizedBox(
                                height: 6,
                              ),
                            ],
                          ),
                        ),
                      );
                    }));
  }
}
