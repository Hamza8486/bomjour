import 'package:bomjour/app_module/authentication/controller/auth_controller.dart';
import 'package:bomjour/app_module/authentication/forget_password/send_email_forget.dart';
import 'package:bomjour/app_module/authentication/login/component/auth_component.dart';
import 'package:bomjour/app_module/authentication/signup/signup_view.dart';
import 'package:bomjour/services/api_manager.dart';
import 'package:bomjour/utils/app_common_widgets/app_button.dart';
import 'package:bomjour/utils/app_common_widgets/app_text.dart';
import 'package:bomjour/utils/app_constants/app_config.dart';
import 'package:bomjour/utils/app_constants/global.dart';
import 'package:bomjour/utils/app_constants/localization.dart';
import 'package:bomjour/utils/app_themes/app_colors.dart';
import 'package:bomjour/utils/dark_theme_provider/dark_theme.dart';
import 'package:bomjour/utils/email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';


import 'dart:ui' as ui;


class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {

  bool isPassword = false;
  bool isPasswordValidated = true;
  bool isEmail = false;
  bool isEmailValidate = true;
  bool isShowPass = true;
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var localization = AppLocalizations.of(context);
    final themeChange = Provider.of<ThemeLocalizationProvider>(context);

    final authController =
    Provider.of<AuthenticationController>(context);
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
                  key: formKey,
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
                        text: localization.signIn,
                        size: 32,
                        fontWeight: FontWeight.w500,
                        color: Theme.of(context).primaryColor,
                      ),
                      SizedBox(
                        height: AppConfig(context).height * 0.03,
                      ),
                      authFieldWidget(
                          labelText: localization.enterEmail,
                          controller: authController.emailController,
                          context: context,
                          onChange: (val){
                            setState(() {

                            });
                          },
                          isShowError:  isEmailValidate ,
                          errorText: localization.enterCorrect,
                          textInputType: TextInputType.emailAddress,
                          validator: (value) {
                            WidgetsBinding.instance.addPostFrameCallback((_) {
                              setState(() {
                                if (value!.isEmpty) {
                                  authController. isEmailValidate = false;
                                   isEmail = true;
                                  return null;
                                } else if (!EmailValidator.validate(value)) {
                                   isEmailValidate = false;
                                  return null;
                                } else {
                                   isEmailValidate = true;
                                  return null;
                                }
                              });
                            });
                            return null;
                          },

                          borderColor:   isEmail
                              ? AppLightColors.primary_color
                              : Theme.of(context).primaryColor.withOpacity(0.1),
                          onTap: () {
                            setState(() {
                               isEmail = true;
                              authController.isPassword = false;
                            });
                          }),
                      SizedBox(
                        height: 5,
                      ),
                      authFieldWidget(
                          labelText: localization.enterPassword,
                          onChange: (val){
                            setState(() {

                            });
                          },
                          isShowError: isPasswordValidated ,
                          errorText:

                          localization.enterPassword,
                          context: context,
                          validator: (value) {
                            WidgetsBinding.instance.addPostFrameCallback((_) {
                              setState(() {
                                if (value!.isEmpty) {
                                  isPassword=true;
                                  authController.isPassword = true;
                                  isPasswordValidated= false;

                                  return;
                                }
                                if (value.length < 5) {
                                  isPassword=false;
                                  authController.isPassword = true;
                                  isPasswordValidated = false;

                                  return;
                                } else {
                                  isPassword=false;
                                  isPasswordValidated= true;
                                  return null;
                                }
                              });
                            });
                            return null;
                          },
                          controller: authController.passwordController,
                          textInputType: TextInputType.visiblePassword,
                          textInputAction: TextInputAction.done,
                          borderColor:   authController.isPassword
                              ? AppLightColors.primary_color
                              : Theme.of(context).primaryColor.withOpacity(0.1),
                          isSuffix: true,
                          obsecure:   isShowPass,
                          onTap: () {
                            setState(() {
                               isEmail = false;
                              authController. isPassword = true;
                            });
                          },
                          suffix: GestureDetector(
                            onTap: () {
                              setState(() {
                                if (   isShowPass) {
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
                        height: AppConfig(context).height * 0.02,
                      ),
                      Align(
                        alignment: themeChange.locale.languageCode == "en"
                            ? Alignment.topRight
                            : Alignment.topLeft,
                        child: GestureDetector(
                          onTap: (){

                            FocusScope.of(context).unfocus();
                            authController.clearReg();
                            authController.clearLogin();
                            Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) =>  SendEmailForget()));
                          },
                          child: AppText(
                            text: localization.forgetPass,
                            size: 14,
                            fontWeight: FontWeight.w500,
                            color: AppLightColors.primary_color,
                          ),
                        ),
                      ),
                      if(  authController.showException)
                        errorMessage(
                            context: context,
                            title:
                            "Ooops! your password or email is wrong. Try again."),
                      SizedBox(
                        height: AppConfig(context).height * 0.03,
                      ),
                      AppButton(
                          buttonName: localization.signIn,
                          borderWidth: 0.5,
                          borderColor:authController.emailController.text.isEmpty || authController.passwordController.text.isEmpty
                              ?  AppLightColors.light_black_color
                              : AppLightColors.primary_color,
                          buttonColor: authController.emailController.text.isEmpty || authController.passwordController.text.isEmpty
                              ?  Theme.of(context).scaffoldBackgroundColor
                              : AppLightColors.primary_color,
                          textColor: authController.emailController.text.isEmpty || authController.passwordController.text.isEmpty
                              ? Theme.of(context).primaryColor
                              : AppLightColors.white_color,

                          onTap: () {
                            FocusScope.of(context).unfocus();
                            authController.showException=false;
                            if (formKey.currentState!.validate()) {
                              if(validateLogin(context)){
                                print("true");
                                hideKeyBoard();
                                authController.updateLoginLoader(true);
                                ApiManger().loginResponse(context: context,

                                );

                              }

                            }
                          }),
                      SizedBox(
                        height: AppConfig(context).height * 0.018,
                      ),
                      richTextWidget(
                          title: localization.dontHaveAccount,
                          subtitle: localization.signup,
                          onTap: () {
                            FocusScope.of(context).unfocus();
                            authController.clearLogin();
                            authController.clearReg();
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) =>  SignupView()),
                            );
                          }),
                    ],
                  ),
                ),
              ),
            ),
            ),
          authController.loginLoader == false
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
      )

      );
  }
  bool validateLogin(BuildContext context) {
    final authController =
    Provider.of<AuthenticationController>(context,listen: false);
    if(authController.emailController.text.isEmpty){
      isEmailValidate=false;
      return false;
    }
    else if(isEmailValidate==false){
      return false;
    }

    else if(authController.passwordController.text.isEmpty){
      isPasswordValidated=false;
      return false;
    }

    if (isPasswordValidated==false) {
      return false;
    }

    return true;
  }


}
