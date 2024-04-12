import 'package:bomjour/app_module/authentication/controller/auth_controller.dart';
import 'package:bomjour/app_module/authentication/login/component/auth_component.dart';
import 'package:bomjour/app_module/authentication/login/login_view.dart';
import 'package:bomjour/services/api_manager.dart';
import 'package:bomjour/utils/app_common_widgets/app_button.dart';
import 'package:bomjour/utils/app_common_widgets/app_text.dart';
import 'package:bomjour/utils/app_constants/app_config.dart';
import 'package:bomjour/utils/app_constants/global.dart';
import 'package:bomjour/utils/app_constants/localization.dart';
import 'package:bomjour/utils/app_themes/app_colors.dart';
import 'package:bomjour/utils/email_validator/email_validator.dart';
import 'package:country_picker/country_picker.dart';

import 'package:bomjour/utils/dark_theme_provider/dark_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:provider/provider.dart';
import 'dart:ui' as ui;

class SignupView extends StatefulWidget {
  const SignupView({super.key});

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  bool isPassword = false;
  bool isSpecialPassword = false;
  bool isNumber = false;

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
                    key: authController.formKeySignup,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: AppConfig(context).height * 0.07,
                        ),
                        backButton(context),
                        SizedBox(
                          height: 24,
                        ),
                        AppText(
                          text: localization.signUp,
                          size: 32,
                          fontWeight: FontWeight.w500,
                          color: Theme.of(context).primaryColor,
                        ),
                        SizedBox(
                          height: 36,
                        ),
                        authFieldWidget(
                            labelText: localization.firstName,
                            isShowError: authController.isFirstValidate,
                            errorText: localization.firstName,
                            controller: authController.firstController,
                            context: context,
                            validator: (value) {
                              WidgetsBinding.instance.addPostFrameCallback((_) {
                                setState(() {
                                  if (value!.isEmpty) {
                                    authController.isFirst = true;
                                    authController.isFirstValidate = false;
                                    return;
                                  }
                                  if (value.length < 3) {
                                    authController.isFirst = true;
                                    authController.isFirstValidate = false;
                                    return;
                                  }
                                  if (!RegExp("[a-zA-Z]").hasMatch(value)) {
                                    authController.isFirst = true;
                                    authController.isFirstValidate = false;
                                    return;
                                  }
                                  authController.isFirstValidate = true;

                                  return null;
                                });
                              });
                            },
                            borderColor: authController.isFirst
                                ? AppLightColors.primary_color
                                : Theme.of(context)
                                    .primaryColor
                                    .withOpacity(0.1),
                            onTap: () {
                              setState(() {
                                authController.isFirst = true;
                                authController.isPassword = false;
                                authController.isNumber = false;
                                authController.isEmail = false;
                                authController.isLast = false;
                              });
                            }),
                        SizedBox(
                          height: 5,
                        ),
                        authFieldWidget(
                            labelText: localization.lastName,
                            controller: authController.lastController,
                            context: context,
                            validator: (value) {
                              WidgetsBinding.instance.addPostFrameCallback((_) {
                                setState(() {
                                  if (value!.isEmpty) {
                                    authController.isLast = true;
                                    authController.isLastValidate = false;
                                    return;
                                  }
                                  if (value.length < 3) {
                                    authController.isLast = true;
                                    authController.isLastValidate = false;
                                    return;
                                  }
                                  if (!RegExp("[a-zA-Z]").hasMatch(value)) {
                                    authController.isLast = true;
                                    authController.isLastValidate = false;
                                    return;
                                  }

                                  authController.isLastValidate = true;
                                  return null;
                                });
                              });
                            },
                            isShowError: authController.isLastValidate,
                            errorText: localization.lastName,
                            borderColor: authController.isLast
                                ? AppLightColors.primary_color
                                : Theme.of(context)
                                    .primaryColor
                                    .withOpacity(0.1),
                            onTap: () {
                              setState(() {
                                authController.isLast = true;
                                authController.isPassword = false;
                                authController.isNumber = false;
                                authController.isEmail = false;
                                authController.isFirst = false;
                              });
                            }),
                        SizedBox(
                          height: 5,
                        ),
                        authFieldWidget(
                            labelText: localization.email,
                            controller: authController.emailRegController,
                            context: context,
                            validator: (value) {
                              WidgetsBinding.instance.addPostFrameCallback((_) {
                                setState(() {
                                  if (value!.isEmpty) {
                                    authController.isEmailValidate = false;
                                    authController.isEmail = true;
                                    return;
                                  } else if (!EmailValidator.validate(value)) {
                                    authController.isEmail = true;
                                    authController.isEmailValidate = false;
                                    return;
                                  } else {
                                    authController.isEmailValidate = true;
                                    return;
                                  }
                                });
                              });
                            },
                            isShowError: authController.isEmailValidate,
                            errorText: localization.enterCorrect,
                            borderColor: authController.isEmail
                                ? AppLightColors.primary_color
                                : Theme.of(context)
                                    .primaryColor
                                    .withOpacity(0.1),
                            onTap: () {
                              setState(() {
                                authController.isPassword = false;
                                authController.isNumber = false;
                                authController.isFirst = false;
                                authController.isLast = false;
                              });
                            }),
                        SizedBox(
                          height: 5,
                        ),
                        authFieldWidget(
                            labelText: localization.number,
                            isPrefix: true,
                            child: GestureDetector(
                              onTap: () {
                                showCountryPicker(
                                  context: context,
                                  showPhoneCode: true,
                                  showSearch: true,
                                  searchAutofocus: false,
                                  showWorldWide: false,

                                  countryListTheme: CountryListThemeData(
                                      bottomSheetHeight: 600,
                                      textStyle: TextStyle(
                                          color: Theme.of(context).primaryColor,
                                          fontWeight: FontWeight
                                              .w600)), // optional. Shows phone code before the country name.
                                  onSelect: (Country country) {
                                    setState(() {
                                      authController.countryCode =
                                          country.phoneCode;
                                      print(country.phoneCode);
                                    });
                                    print(
                                        'Select country: ${country.displayName}');
                                    print(
                                        'Select country: ${country.countryCode}');
                                  },
                                );
                              },
                              child: Padding(
                                padding: EdgeInsets.only(left: 7, top: 20),
                                child: Container(
                                  color: Colors.transparent,
                                  width: 70,
                                  child: Row(
                                    children: [
                                      SizedBox(
                                        width: 3,
                                      ),
                                      AppText(
                                        text:
                                            "+${authController.countryCode.toString()}",
                                        color: Theme.of(context).primaryColor,
                                        size: 15,
                                        fontWeight: FontWeight.w500,
                                      ),
                                      const SizedBox(
                                        width: 2,
                                      ),
                                      Icon(
                                        Icons.keyboard_arrow_down_sharp,
                                        size: 16,
                                        color: Theme.of(context).primaryColor,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            controller: authController.numberController,
                            textInputType: TextInputType.phone,
                            context: context,
                            validator: (value) {
                              WidgetsBinding.instance.addPostFrameCallback((_) {
                                setState(() {
                                  if (value!.isEmpty) {
                                    isNumber = true;
                                    authController.isNumber = true;
                                    authController.isNumberValidate = false;

                                    return;
                                  } else if (value.length < 8) {
                                    isNumber = false;
                                    authController.isNumber = true;
                                    authController.isNumberValidate = false;

                                    return;
                                  }
                                  else if (value.length > 10) {
                                    isNumber = false;
                                    authController.isNumber = true;
                                    authController.isNumberValidate = false;

                                    return;
                                  }

                                  else {
                                    isNumber = false;
                                    // authController.  isNumber = true;
                                    authController.isNumberValidate = true;
                                    return null;
                                  }
                                });
                              });
                            },
                            isShowError: authController.isNumberValidate,
                            errorText: isNumber
                                ? localization.number
                                : localization.numberNotCorr,
                            borderColor: authController.isNumber
                                ? AppLightColors.primary_color
                                : Theme.of(context)
                                    .primaryColor
                                    .withOpacity(0.1),
                            onTap: () {
                              setState(() {
                                authController.isNumber = true;
                                authController.isPassword = false;
                                authController.isEmail = false;
                                authController.isFirst = false;
                                authController.isLast = false;
                              });
                            }),
                        SizedBox(
                          height: 5,
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
                                    authController.isPassword = true;
                                    authController.isPasswordValidated = false;

                                    return;
                                  } else if (!isPasswordValid(value)) {
                                    isSpecialPassword = true;
                                    return;
                                  } else if (value.length < 8) {
                                    isSpecialPassword = false;
                                    isPassword = false;
                                    authController.isPassword = true;
                                    authController.isPasswordValidated = false;

                                    return;
                                  } else {
                                    isSpecialPassword = false;
                                    isPassword = false;
                                    authController.isPasswordValidated = true;

                                    return null;
                                  }
                                });
                              });
                            },
                            controller: authController.passwordRegController,
                            textInputType: TextInputType.visiblePassword,
                            textInputAction: TextInputAction.done,
                            borderColor: authController.isPassword
                                ? AppLightColors.primary_color
                                : Theme.of(context)
                                    .primaryColor
                                    .withOpacity(0.1),
                            isSuffix: true,
                            isShowError: authController.isPasswordValidated,
                            errorText: isPassword
                                ? localization.enterPassword
                                : localization.passWeek,
                            obsecure: authController.isShowPass,
                            onTap: () {
                              setState(() {
                                authController.isEmail = false;
                                authController.isNumber = false;
                                authController.isFirst = false;
                                authController.isLast = false;
                                authController.isPassword = true;
                              });
                            },
                            suffix: GestureDetector(
                              onTap: () {
                                setState(() {
                                  if (authController.isShowPass) {
                                    authController.isShowPass = false;
                                  } else {
                                    authController.isShowPass = true;
                                  }
                                });
                              },
                              child: Icon(
                                authController.isShowPass
                                    ? Icons.visibility_off_outlined
                                    : Icons.visibility_outlined,
                                size: 24,
                                color: Theme.of(context).primaryColor,
                              ),
                            )),
                        authController.isPasswordValidated == false
                            ? Padding(
                                padding: EdgeInsets.only(
                                    top: AppConfig(context).height * 0.022),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.info_outline,
                                      size: 23,
                                      color: themeChange.locale.languageCode !=
                                              "en"
                                          ? AppLightColors.label_color
                                          : AppLightColors.blue_color,
                                    ),
                                    SizedBox(
                                      width: 8,
                                    ),
                                    Expanded(
                                      child: AppText(
                                        text: isSpecialPassword
                                            ? localization.special_character
                                            : localization.passwordMust,
                                        size: 12,
                                        fontWeight: FontWeight.w400,
                                        color: Theme.of(context).highlightColor,
                                      ),
                                    )
                                  ],
                                ),
                              )
                            : SizedBox.shrink(),
                        SizedBox(
                          height: AppConfig(context).height * 0.03,
                        ),
                        authController.errorMessage.isEmpty?SizedBox.shrink():

                  errorMessage(
                              context: context,
                              title:
                              authController.errorMessage.toString()),
                        SizedBox(
                          height: AppConfig(context).height * 0.03,
                        ),
                        AppButton(
                            buttonName: localization.signUp,
                            borderWidth: 0.5,
                            borderColor:
                                authController.firstController.text.isEmpty ||
                                        authController
                                            .lastController.text.isEmpty ||
                                        authController
                                            .emailRegController.text.isEmpty ||
                                        authController
                                            .numberController.text.isEmpty ||
                                        authController
                                            .passwordRegController.text.isEmpty
                                    ? AppLightColors.light_black_color
                                    : AppLightColors.primary_color,
                            buttonColor:
                                authController.firstController.text.isEmpty ||
                                        authController
                                            .lastController.text.isEmpty ||
                                        authController
                                            .emailRegController.text.isEmpty ||
                                        authController
                                            .numberController.text.isEmpty ||
                                        authController
                                            .passwordRegController.text.isEmpty
                                    ? Theme.of(context).scaffoldBackgroundColor
                                    : AppLightColors.primary_color,
                            textColor:
                                authController.firstController.text.isEmpty ||
                                        authController
                                            .lastController.text.isEmpty ||
                                        authController
                                            .emailRegController.text.isEmpty ||
                                        authController
                                            .numberController.text.isEmpty ||
                                        authController
                                            .passwordRegController.text.isEmpty
                                    ? Theme.of(context).primaryColor
                                    : AppLightColors.white_color,
                            onTap: () {
                              if (authController.formKeySignup.currentState!
                                  .validate()) {
                                if (authController.validateSignup(context)) {
                                  hideKeyBoard();
                                  authController.updateSignupLoader(true);
                                  ApiManger().signupResponse(context: context);
                                }
                              }
                            }),
                        SizedBox(
                          height: AppConfig(context).height * 0.018,
                        ),
                        richTextWidget(
                            title: localization.already,
                            subtitle: localization.signin,
                            onTap: () {
                              print("object");
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LoginView()),
                              );
                            }),
                      ],
                    ),
                  ),
                ),
              )),
          authController.signupLoader == false
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
}
