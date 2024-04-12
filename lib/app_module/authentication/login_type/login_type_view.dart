import 'package:bomjour/app_module/authentication/controller/auth_controller.dart';
import 'package:bomjour/app_module/authentication/login/login_view.dart';
import 'package:bomjour/app_module/authentication/signup/signup_view.dart';
import 'package:bomjour/app_module/authentication/social_login/view/social_login.dart';
import 'package:bomjour/utils/app_common_widgets/app_button.dart';
import 'package:bomjour/utils/app_common_widgets/app_text.dart';
import 'package:bomjour/utils/app_constants/app_config.dart';
import 'package:bomjour/utils/app_constants/app_images.dart';
import 'package:bomjour/utils/app_constants/localization.dart';
import 'package:bomjour/utils/app_padding/app_paddings.dart';
import 'package:bomjour/utils/app_themes/app_colors.dart';
import 'package:bomjour/utils/dark_theme_provider/dark_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'dart:ui' as ui;


class LoginTypeView extends StatelessWidget {
  const LoginTypeView({super.key});

  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<ThemeLocalizationProvider>(context);
    var localization = AppLocalizations.of(context);
    final authController =
    Provider.of<AuthenticationController>(context);
    return Directionality(
      textDirection: themeChange.locale.languageCode == "en"
          ? ui.TextDirection.ltr
          : ui.TextDirection.rtl,
      child: WillPopScope(
        onWillPop: () async {
          return false;
        },
        child: Stack(
          children: [
            Scaffold(
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              body: Padding(
                padding: AppPaddings.onlyHorizontalPadding(padding: 16),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 68,
                      ),
                      GestureDetector(
                        onTap: () {
                          // Navigator.pop(context);
                          //
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(builder: (context) => HomeView()),
                          // );
                        },
                        child: Align(
                          alignment: Alignment.topRight,
                          child: Container(
                            height: 48,
                            width: 48,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: Theme.of(context).primaryColor,
                                )),
                            child: Center(
                              child: AppText(
                                text: localization.skip,
                                size: 12,
                                color: Theme.of(context).primaryColor,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 94,
                      ),
                      SvgPicture.asset(AppImages.heart),
                      SizedBox(
                        height: AppConfig(context).height * 0.02,
                      ),
                      AppText(
                        text: localization.titleType,
                        size: 32,
                        fontWeight: FontWeight.w500,
                        color: Theme.of(context).primaryColor,
                        textAlign: TextAlign.center,
                      ),
                      AppText(
                        text: localization.titleType1,
                        size: 32,
                        fontWeight: FontWeight.w500,
                        color: Theme.of(context).primaryColor,
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 29,
                      ),
                      AppButton(
                          buttonName: localization.signup,
                          onTap: () {
                            authController.clearLogin();
                            authController.clearReg();
                            authController.clearForget();

                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SignupView()));
                          }),
                      SizedBox(
                        height: 10,
                      ),
                      socialButton(
                          title: localization.facebookType,
                          context: context,
                          image: AppImages.fb,
                          onTap: () {

                            AuthenticationHelper().facebookSignIn(context: context);
                          }),
                      socialButton(
                          title: localization.googleType,
                          context: context,
                          image: AppImages.google,
                          onTap: () {
                            authController.updateSocialLoginLoader(true);
                            AuthenticationHelper().googlebySignIn(context: context);

                          }),
                      socialButton(
                          title: localization.appleType,
                          context: context,
                          child: SvgPicture.asset(
                            AppImages.apple,
                            color: Theme.of(context).primaryColor,
                          ),
                          image: AppImages.apple,
                          onTap: () {}),
                      SizedBox(
                        height: 8,
                      ),
                      socialButton(
                          title: localization.signin,
                          context: context,
                          image: AppImages.fb,
                          onTap: () {
                            authController.clearLogin();
                            authController.clearReg();
                            authController.clearForget();
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) => LoginView()));
                          },
                          child: SizedBox.shrink()),
                    ],
                  ),
                ),
              ),
            ),
            authController.socialLoader == false
                ? SizedBox.shrink()
                : Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              color: Colors.black.withOpacity(0.7),
              child: Center(
                  child: SpinKitThreeBounce(
                      size: 25, color: AppLightColors.primary_color)),
            )
          ],
        ),
      ),
    );
  }

  Widget socialButton(
      {title, onTap, image, Widget? child, required BuildContext context}) {
    return Padding(
      padding: AppPaddings.onlyVerticalPadding(
        padding: 6,
      ),
      child: AppButton(
        buttonName: title,
        onTap: onTap,
        child: child ?? SvgPicture.asset(image),
        buttonColor: Colors.transparent,
        fontWeight: FontWeight.w500,
        textColor: Theme.of(context).primaryColor,
        borderColor: Theme.of(context).disabledColor,
        isIcon: true,
      ),
    );
  }
}
