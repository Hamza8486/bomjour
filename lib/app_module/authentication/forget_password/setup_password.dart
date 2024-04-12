import 'package:bomjour/app_module/authentication/controller/auth_controller.dart';
import 'package:bomjour/services/api_manager.dart';
import 'package:bomjour/utils/app_common_widgets/app_button.dart';
import 'package:bomjour/utils/app_common_widgets/app_text.dart';
import 'package:bomjour/utils/app_constants/app_config.dart';
import 'package:bomjour/utils/app_constants/localization.dart';
import 'package:bomjour/utils/app_themes/app_colors.dart';
import 'package:bomjour/utils/dark_theme_provider/dark_theme.dart';
import 'package:bomjour/utils/email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';

import 'dart:ui' as ui;
import '../login/component/auth_component.dart';

class SetupPassword extends StatefulWidget {

  SetupPassword({super.key});

  @override
  State<SetupPassword> createState() => _SetupPasswordState();
}

class _SetupPasswordState extends State<SetupPassword> {
  bool isPassword = false;
  bool isConfPassword = false;
  bool isSpecialPassword = false;
  bool isPasswordForget = false;
  bool isPasswordValidated = true;
  bool isPasswordForgetValidated = true;
  bool isShowPass = false;
  bool isConfirmPassword = false;
  bool isShowConfirmPass = false;
  bool isPasswordCoonfirmValidated = true;
  final setupPassKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var localization = AppLocalizations.of(context);
    final themeChange = Provider.of<ThemeLocalizationProvider>(context);
    final authController = Provider.of<AuthenticationController>(context);
    return Directionality(
      textDirection: themeChange.locale.languageCode == "en"
          ? ui.TextDirection.ltr
          : ui.TextDirection.rtl,
      child: Stack(
        children: [
          Scaffold(
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              body: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: SingleChildScrollView(
                  child: Form(
                    key:  setupPassKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: AppConfig(context).height * 0.07,
                        ),
                        backButton(context),
                        SizedBox(
                          height: AppConfig(context).height * 0.03,
                        ),
                        AppText(
                          text: localization.forget,
                          size: 32,
                          fontWeight: FontWeight.w500,
                          color: Theme.of(context).primaryColor,
                        ),
                        AppText(
                          text: localization.password,
                          size: 32,
                          fontWeight: FontWeight.w500,
                          color: Theme.of(context).primaryColor,
                        ),
                        SizedBox(
                          height: AppConfig(context).height * 0.01,
                        ),
                        AppText(
                          text: localization.createPass,
                          textAlign: TextAlign.start,
                          size: 16,
                          fontWeight: FontWeight.w400,
                          color: Theme.of(context).disabledColor,
                        ),
                        SizedBox(
                          height: AppConfig(context).height * 0.025,
                        ),
                        authFieldWidget(
                            labelText: localization.enterPassword,
                            context: context,
                            validator: (value) {
                              WidgetsBinding.instance.addPostFrameCallback((_) {
                                setState(() {
                                  if (value!.isEmpty) {
                                    isPassword = true;
                                    isSpecialPassword = false;
                                    isPasswordForget = true;
                                   isPasswordForgetValidated = false;

                                    return;
                                  }
                                  if (!isPasswordValid(value)) {
                                    isSpecialPassword = true;
                                    return;
                                  }
                                  if (value.length < 8) {
                                    isSpecialPassword = false;
                                    isPassword = false;
                                    isPasswordForget = true;
                                  isPasswordForgetValidated = false;

                                    return;
                                  } else {
                                    isSpecialPassword = false;
                                    isPassword = false;
                                    isPasswordForgetValidated = true;
                                    return null;
                                  }
                                });
                              });
                              return null;
                            },
                            isShowError: isPasswordForgetValidated,
                            errorText: isPassword
                                ? localization.enterPassword
                                : localization.passWeek,
                            controller:  authController.passwordOldController,
                            textInputType: TextInputType.visiblePassword,
                            textInputAction: TextInputAction.done,
                            borderColor:  isPasswordForget
                                ? AppLightColors.primary_color
                                : Theme.of(context).primaryColor.withOpacity(0.1),
                            isSuffix: true,
                            obsecure:  isShowPass,
                            onTap: () {
                              setState(() {
                                 isPasswordForget = true;
                                 isConfirmPassword = false;
                              });
                            },
                            suffix: GestureDetector(
                              onTap: () {
                                setState(() {
                                  if ( isShowPass) {
                                     isShowPass = false;
                                  } else {
                                     isShowPass = true;
                                  }
                                });
                              },
                              child: Icon(
                                 isShowPass
                                    ? Icons.visibility_off_outlined
                                    : Icons.visibility_outlined,
                                size: 24,
                                color: Theme.of(context).primaryColor,
                              ),
                            )),
                        SizedBox(
                          height: 6,
                        ),
                        authFieldWidget(
                            labelText: localization.confirmPass,
                            isShowError:  isPasswordCoonfirmValidated,
                            errorText: isConfPassword
                                ? localization.confirmPass
                                : localization.doNotMATCH,
                            context: context,
                            validator: (value) {
                              WidgetsBinding.instance.addPostFrameCallback((_) {
                                setState(() {
                                  if (value!.isEmpty) {
                                    isConfPassword = true;
                                     isConfirmPassword = true;

                                    return;
                                  }
                                  if (value !=
                                       authController.passwordOldController.text) {
                                    isConfPassword = false;
                                     isConfirmPassword = true;
                                     isPasswordCoonfirmValidated =
                                        false;

                                    return;
                                  } else {
                                    isConfPassword = false;
                                     isPasswordCoonfirmValidated = true;
                                    return null;
                                  }
                                });
                              });
                              return null;
                            },
                            controller:  authController.confirmController,
                            textInputType: TextInputType.visiblePassword,
                            textInputAction: TextInputAction.done,
                            borderColor:  isConfirmPassword
                                ? AppLightColors.primary_color
                                : Theme.of(context).primaryColor.withOpacity(0.1),
                            isSuffix: true,
                            obsecure:  isShowConfirmPass,
                            onTap: () {
                              setState(() {
                                 isPasswordForget = false;

                                 isConfirmPassword = true;
                              });
                            },
                            suffix: GestureDetector(
                              onTap: () {
                                setState(() {
                                  if ( isShowConfirmPass) {
                                     isShowConfirmPass = false;
                                  } else {
                                     isShowConfirmPass = true;
                                  }
                                });
                              },
                              child: Icon(
                                 isShowConfirmPass
                                    ? Icons.visibility_off_outlined
                                    : Icons.visibility_outlined,
                                size: 24,
                                color: Theme.of(context).primaryColor,
                              ),
                            )),
                        isSpecialPassword == true
                            ? Padding(
                                padding: EdgeInsets.only(
                                    top: AppConfig(context).height * 0.022),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.info_outline,
                                      size: 23,
                                      color: themeChange.locale.languageCode != "en"
                                          ? AppLightColors.label_color
                                          : AppLightColors.blue_color,
                                    ),
                                    SizedBox(
                                      width: 8,
                                    ),
                                    Expanded(
                                      child: AppText(
                                        text: localization.special_character,
                                        size: 12,
                                        fontWeight: FontWeight.w400,
                                        color: Theme.of(context).highlightColor,
                                      ),
                                    )
                                  ],
                                ),
                              )
                            : SizedBox.shrink(),
                         isPasswordCoonfirmValidated == false
                            ? errorMessage(
                                context: context, title: localization.doNotMATCH)
                            : SizedBox.shrink(),
                        SizedBox(
                          height: AppConfig(context).height * 0.03,
                        ),
                        AppButton(
                            buttonName: localization.reset_pass,
                            borderWidth: 0.5,
                            borderColor:
                                 authController.passwordOldController.text.isEmpty ||
                                     authController.confirmController.text.isEmpty
                                    ? AppLightColors.light_black_color
                                    : AppLightColors.primary_color,
                            buttonColor:
                            authController.passwordOldController.text.isEmpty ||
                                authController.confirmController.text.isEmpty
                                    ? Theme.of(context).scaffoldBackgroundColor
                                    : AppLightColors.primary_color,
                            textColor:
                            authController.passwordOldController.text.isEmpty ||
                                authController.confirmController.text.isEmpty
                                    ? Theme.of(context).primaryColor
                                    : AppLightColors.white_color,
                            onTap: () {
                              FocusScope.of(context).unfocus();
                              if (setupPassKey.currentState!.validate()) {
                                if (validateCreatePass(context)) {
                                   authController.updateSetupPassword(true);
                                  ApiManger().setupPassword(context: context);
                                }
                              }
                            }),
                      ],
                    ),
                  ),
                ),
              )),
          authController.setupPasswordLoader == false
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
    );
  }
  bool validateCreatePass(BuildContext context) {
    final authController = Provider.of<AuthenticationController>(context,listen: false);
    if(authController.passwordOldController.text.isEmpty){
      isPasswordForgetValidated=false;
      return false;
    }
    else if(isPasswordForgetValidated==false){
      return false;
    }
    if(authController.confirmController.text.isEmpty){
      isPasswordCoonfirmValidated=false;
      return false;
    }
    else if(isPasswordCoonfirmValidated==false){
      return false;
    }


    return true;
  }

}
