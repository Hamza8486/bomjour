import 'package:bomjour/app_module/bottom_tabs/profile/component/language.dart';
import 'package:bomjour/app_module/country_selection/components/country_list.dart';
import 'package:bomjour/app_module/country_selection/components/top_cities.dart';
import 'package:bomjour/utils/app_common_widgets/app_text.dart';
import 'package:bomjour/utils/app_constants/app_images.dart';
import 'package:bomjour/utils/app_padding/app_paddings.dart';
import 'package:bomjour/utils/dark_theme_provider/dark_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../../utils/app_constants/localization.dart';

class CountrySelectionView extends StatelessWidget {
  const CountrySelectionView({super.key});
  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<ThemeLocalizationProvider>(context);

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Padding(
        padding: AppPaddings.onlyHorizontalPadding(padding: 16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 68,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) =>  LanguageView()),
                      );
                    },
                    child: AppText(
                      text: themeChange.locale.languageCode == "en"
                          ? "العربية"
                          : "English",
                      size: 14,
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SvgPicture.asset(
                    themeChange.darkTheme
                        ? AppImages.dark_logo_image
                        : AppImages.logo_image,
                    width: 108,
                    height: 44,
                  ),
                  Container()
                ],
              ),
              SizedBox(
                height: 35,
              ),
              Center(
                child: AppText(
                  text: AppLocalizations.of(context).buy_send,
                  size: 24,
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(
                height: 24,
              ),
              AppText(
                text: AppLocalizations.of(context).top_city,
                size: 20,
                color: Theme.of(context).primaryColor,
                fontWeight: FontWeight.w500,
              ),
              SizedBox(
                height: 16,
              ),
              TopCities(),
              SizedBox(
                height: 32,
              ),
              AppText(
                text: AppLocalizations.of(context).all_city_country,
                size: 20,
                color: Theme.of(context).primaryColor,
                fontWeight: FontWeight.w500,
              ),
              SizedBox(
                height: 28,
              ),
              CountryListView()
            ],
          ),
        ),
      ),
    );
  }
}


