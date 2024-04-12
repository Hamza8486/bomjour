import 'dart:async';
import 'package:bomjour/app_module/authentication/controller/auth_controller.dart';
import 'package:bomjour/services/api_manager.dart';
import 'package:bomjour/utils/app_constants/global.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:bomjour/utils/app_common_widgets/app_button.dart';
import 'package:bomjour/utils/app_common_widgets/app_text.dart';
import 'package:bomjour/utils/app_constants/app_config.dart';
import 'package:bomjour/utils/app_constants/localization.dart';
import 'package:bomjour/utils/app_themes/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:bomjour/utils/dark_theme_provider/dark_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:ui' as ui;
import '../login/component/auth_component.dart';

class OtpView extends StatefulWidget {
  OtpView({super.key,this.type});

  var type;

  @override
  State<OtpView> createState() => _OtpViewState();
}

class _OtpViewState extends State<OtpView> {
  StreamController<ErrorAnimationType>? errorController;
  bool hasError = false;
  bool _mounted = false;
  Timer? _timer;
  bool isEnabled = false;
  int start = 60;

  var otpController  = TextEditingController();



  @override
  void dispose() {
    _mounted = false;
    _timer?.cancel();
    super.dispose();
  }

  void safeSetState(VoidCallback fn) {
    if (_mounted) {
      setState(fn);
    }
  }

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
          (Timer timer) {
        if (start == 0) {
          safeSetState(() {
            timer.cancel();
          });
        } else {
          safeSetState(() {
            start--;
            if (start == 0) {
              timer.cancel();
              isEnabled = true;

            }
          });
        }
      },
    );
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _mounted = true;
    startTimer();
  }

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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: AppConfig(context).height * 0.07,
                      ),
                      backButton(context),
                      SizedBox(
                        height: 32,
                      ),
                      AppText(
                        text: localization.verification,
                        size: 32,
                        fontWeight: FontWeight.w500,
                        color: Theme.of(context).primaryColor,
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      AppText(
                        text: localization.otpSend,
                        size: 16,
                        fontWeight: FontWeight.w400,
                        color: AppLightColors.textColorCreated,
                      ),
                      RichText(
                        text: TextSpan(
                          text:
                          widget.type=="Forget"?
                          "${authController.emailForgetController.text} ":

                          widget.type=="verify"?
                          "${authController.emailController.text} ":
                          "${authController.emailRegController.text} ",
                          style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w400,
                            color: AppLightColors.primary_color,
                          )),
                          children: <TextSpan>[
                            TextSpan(
                                text:
                                    "${localization.enterCode} ${localization.verify}",
                                style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w400,
                                  color: AppLightColors.textColorCreated,
                                ))),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 48,
                      ),
                      PinCodeTextField(
                        appContext: context,
                        controller: otpController,
                        autoDisposeControllers: false,
                        length: 4,
                        textStyle: TextStyle(color: Theme.of(context).primaryColor),
                        hintCharacter: "-",
                        animationType: AnimationType.fade,
                        validator: (v) {
                          if (v!.length < 4) {
                            return;
                          } else {
                            return null;
                          }
                        },
                        pinTheme: PinTheme(
                          fieldHeight: 61,
                          fieldWidth: 78,
                          shape: PinCodeFieldShape.box,
                          borderWidth: 1.5,
                          activeColor: themeChange.darkTheme
                              ? AppLightColors.textField_fill_dark
                              : AppLightColors.black_color.withOpacity(0.0),
                          inactiveColor: themeChange.darkTheme
                              ? AppLightColors.textField_fill_dark
                              : AppLightColors.black_color.withOpacity(0.0),
                          inactiveFillColor: themeChange.darkTheme
                              ? AppLightColors.textField_back_dark
                              : AppLightColors.textField_back_color,
                          activeFillColor: themeChange.darkTheme
                              ? AppLightColors.bottom_dark_back
                              : AppLightColors.textField_back_color,
                          selectedFillColor: themeChange.darkTheme
                              ? AppLightColors.bottom_dark_back
                              : AppLightColors.textField_back_color,
                          selectedColor: themeChange.darkTheme
                              ? AppLightColors.textField_fill_dark
                              : AppLightColors.black_color,
                          disabledColor:
                              Theme.of(context).primaryColor.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        cursorColor: AppLightColors.primary_color,
                        animationDuration: const Duration(milliseconds: 300),
                        enableActiveFill: true,
                        errorAnimationController: errorController,
                        keyboardType: TextInputType.number,
                        onChanged: (value) {
                          debugPrint(value);
                          setState(() {
                            authController.currentText = value;
                            if (value.length == 4) {}
                          });
                        },
                        onSubmitted: (value) {},
                        beforeTextPaste: (text) {
                          debugPrint("Allowing to paste $text");
                          return true;
                        },
                      ),
                      SizedBox(
                        height: 12,
                      ),
                     isEnabled
                          ? Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                richTextWidget(
                                    title: localization.getSms,
                                    subtitle: localization.sendCode,
                                    onTap: () {
                                      authController.updateOtpMessage("");
                                      FocusScope.of(context).unfocus();
                                      setState(() {
                                        ApiManger().resendOtp(context: context,
                                        email:
                                        widget.type=="Forget"?
                                        authController.emailForgetController.text:
                                        widget.type=="verify"?
                                        authController.emailController.text:

                                        authController.emailRegController.text
                                        );
                                        start = 60;
                                        startTimer();
                                        isEnabled = false;
                                      });
                                      FocusScope.of(context).unfocus();
                                      hideKeyBoard();
                                      WidgetsBinding.instance
                                          .addPostFrameCallback((_) {});
                                    }),
                              ],
                            )
                          : Center(
                              child: Row(
                                children: [
                                  SvgPicture.asset(
                                    "assets/icons/timer.svg",
                                    color: Theme.of(context).primaryColor,
                                  ),
                                  AppText(
                                    text: "  ${start}s",
                                    size: 15,
                                    fontWeight: FontWeight.w500,
                                    color: Theme.of(context).primaryColor,
                                  ),
                                ],
                              ),
                            ),
                      if (authController.errorOtpMessage.isNotEmpty)
                        errorMessage(
                            context: context,
                            title:
                                "OTP is wrong click on send again button to resend OTP code."),
                      SizedBox(
                        height: 24,
                      ),
                      AppButton(
                          buttonName: localization.verifyOtp,
                          borderWidth: 1.5,
                          borderColor: authController.currentText.length != 4
                              ? themeChange.darkTheme
                                  ? AppLightColors.textField_fill_dark
                                  : AppLightColors.otpLightColor
                              : AppLightColors.primary_color,
                          buttonColor: authController.currentText.length != 4
                              ? Theme.of(context).scaffoldBackgroundColor
                              : AppLightColors.primary_color,
                          textColor: authController.currentText.length != 4
                              ? Theme.of(context).primaryColor
                              : AppLightColors.white_color,
                          onTap: authController.currentText.length != 4
                              ? () {}
                              : () {
                                  FocusScope.of(context).unfocus();
                                  hideKeyBoard();
                                  authController.updateOtpLoader(true);
                                  ApiManger().verifyOtp(context: context,
                                  email:
                                  widget.type=="Forget"?
                                  authController.emailForgetController.text:
                                  widget.type=="verify"?
                                  authController.emailController.text:
                                  authController.emailRegController.text,
                                    otp: authController.currentText,
                                    type:
                                    widget.type=="Forget"?
                                    "Forget":""
                                  );
                                }),
                    ],
                  ),
                ),
              )),
          authController.otpLoader == false
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
