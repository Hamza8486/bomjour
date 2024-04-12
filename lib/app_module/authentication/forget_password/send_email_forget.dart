
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


class SendEmailForget extends StatefulWidget {
  const SendEmailForget({super.key});

  @override
  State<SendEmailForget> createState() => _SendEmailForgetState();
}

class _SendEmailForgetState extends State<SendEmailForget> {
  bool isEmail = false;
  bool isEmailValidate = true;

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
                  key: authController.formKeyForget,
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
                      Align(

                        child: AppText(
                          text: localization.enter_register,
                          size: 16,
                          fontWeight: FontWeight.w400,
                          textAlign: TextAlign.start,
                          color: Theme.of(context).disabledColor,
                        ),
                      ),
                      SizedBox(
                        height: AppConfig(context).height * 0.025,
                      ),
                      authFieldWidget(
                          labelText: localization.enetr_your_email,
                          controller: authController.emailForgetController,
                          textInputAction: TextInputAction.done,
                          context: context,
                          textInputType: TextInputType.emailAddress,
                          validator: (value) {
                            WidgetsBinding.instance.addPostFrameCallback((_) {
                              setState(() {
                                if (value!.isEmpty) {
                                   isEmailValidate = false;
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
                          isShowError:  isEmailValidate ,
                          errorText: localization.enterCorrect,

                          borderColor:  isEmail
                              ? AppLightColors.primary_color
                              : Theme.of(context).primaryColor.withOpacity(0.1),
                          onTap: () {
                            setState(() {
                               isEmail = true;

                            });
                          }),


                        authController.errorForgetMessage.isNotEmpty?
                        errorMessage(
                            context: context,
                            title:
                            "Ooops! Email is incorrect. Try again."):SizedBox.shrink(),
                      SizedBox(
                        height: AppConfig(context).height * 0.03,
                      ),
                      AppButton(
                          buttonName: localization.reset_pass,
                          borderWidth: 0.5,
                          borderColor:authController.emailForgetController.text.isEmpty
                              ?  AppLightColors.light_black_color
                              : AppLightColors.primary_color,
                          buttonColor: authController.emailForgetController.text.isEmpty
                              ?  Theme.of(context).scaffoldBackgroundColor
                              : AppLightColors.primary_color,
                          textColor: authController.emailForgetController.text.isEmpty
                              ? Theme.of(context).primaryColor
                              : AppLightColors.white_color,

                          onTap: () {
                            FocusScope.of(context).unfocus();

                            if (authController.formKeyForget.currentState!.validate()) {
                              if(validateSendEmail(context)){
                                authController.updateForgetLoader(true);
                                ApiManger().forgetEmail(context: context);
                              }

                            }
                          }),

                    ],
                  ),
                ),
              ),
            )),
          authController.forgetLoader == false
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

  bool validateSendEmail(BuildContext context) {
    final authController =
    Provider.of<AuthenticationController>(context,listen: false);
    if(authController.emailForgetController.text.isEmpty){
      isEmailValidate=false;
      return false;
    }
    else if(isEmailValidate==false){
      return false;
    }


    return true;
  }

}
