import 'package:bomjour/utils/app_common_widgets/app_button.dart';
import 'package:bomjour/utils/app_common_widgets/app_text.dart';
import 'package:bomjour/utils/app_constants/api_constant.dart';
import 'package:bomjour/utils/app_constants/app_config.dart';
import 'package:bomjour/utils/app_constants/app_images.dart';
import 'package:bomjour/utils/app_padding/app_paddings.dart';
import 'package:bomjour/utils/app_themes/app_colors.dart';
import 'package:bomjour/utils/dark_theme_provider/dark_theme.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:ui' as ui;

import '../../../utils/app_constants/localization.dart';
import '../controller/onboarding_controller.dart';

class OnBoardingView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final onBoardingController = Provider.of<OnBoardingController>(context);
    final themeChange = Provider.of<ThemeLocalizationProvider>(context);
    return Directionality(
      textDirection: themeChange.locale.languageCode == "en"
          ? ui.TextDirection.ltr
          : ui.TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: WillPopScope(
          onWillPop: () async {
            return false;
          },
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        width: AppConfig(context).width,
                        height: AppConfig(context).height*0.88,
                        child: PageView.builder(
                          physics: BouncingScrollPhysics(),
                          controller: onBoardingController.pageController,
                          onPageChanged: (val) {
                            onBoardingController.selectedPageIndex = val;
                            onBoardingController.isLastPage =
                                onBoardingController.selectedPageIndex ==
                                    onBoardingController.onboardingList.length -
                                        1;
                            onBoardingController.notifyListeners();
                          },
                          itemCount: onBoardingController.onboardingList.length,
                          itemBuilder: (context, index) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CachedNetworkImage(
                                  fit: BoxFit.cover,
                                  height: 442,
                                  width: double.infinity,
                                  imageUrl:
                                  "${ApiConstant.imageUrl}${onBoardingController.onboardingList[index].image}",
                                  placeholder: (context, url) => Center(
                                    child: CircularProgressIndicator(
                                      color: AppLightColors.primary_color,
                                    ),
                                  ),
                                  errorWidget: (context, url, error) => Image.asset(
                                    AppImages.onboarding_1,
                                    fit: BoxFit.cover,
                                    height: 442,
                                    width: double.infinity,
                                  ),
                                ),
                                SizedBox(height: 45),
                                Padding(
                                  padding: AppPaddings.onlyHorizontalPadding(
                                    padding: AppConfig(context).width * 0.05,
                                  ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: themeChange.locale.languageCode == "en"
                                            ? EdgeInsets.only(right: 89)
                                            : EdgeInsets.only(left: 0),
                                        child: AppText(
                                          text: themeChange.locale.languageCode == "en"
                                              ? onBoardingController.onboardingList[index].title.toString()
                                              : (onBoardingController.onboardingList[index].arTitle).toString(),
                                          size: 24,
                                          textAlign: themeChange.locale.languageCode == "en"
                                              ? TextAlign.left
                                              : TextAlign.right,
                                          fontWeight: FontWeight.w600,
                                          color: Theme.of(context).primaryColor,
                                        ),
                                      ),
                                      SizedBox(height: 16),
                                      GestureDetector(
                                        onTap: () {

                                        },
                                        child: AppText(
                                          text: themeChange.locale.languageCode == "en"
                                              ? onBoardingController.onboardingList[index].content.toString()
                                              : onBoardingController.onboardingList[index].contentAr.toString(),
                                          size: 16,
                                          textAlign: themeChange.locale.languageCode == "en"
                                              ? TextAlign.left
                                              : TextAlign.right,
                                          fontWeight: FontWeight.w400,
                                          color: Theme.of(context).disabledColor,
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            );
                          },
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: AppPaddings.symmetricPadding(
                  horizontalPadding: AppConfig(context).width * 0.04,
                  verticalPadding: AppConfig(context).width * 0.03,
                ),
                child: AppButton(
                  buttonName: onBoardingController.isLastPage
                      ? AppLocalizations.of(context).next_btn
                      : AppLocalizations.of(context).next_btn,
                  onTap: (){
                    onBoardingController.forwardAction(context: context);
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

