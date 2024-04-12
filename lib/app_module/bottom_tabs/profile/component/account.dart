import 'dart:io';

import 'package:bomjour/app_module/authentication/login/component/auth_component.dart';
import 'package:bomjour/app_module/bottom_tabs/profile/component/profile_component.dart';
import 'package:bomjour/app_module/home/controller/home_controller.dart';
import 'package:bomjour/services/api_manager.dart';
import 'package:bomjour/utils/app_common_widgets/app_button.dart';
import 'package:bomjour/utils/app_common_widgets/app_text.dart';
import 'package:bomjour/utils/app_common_widgets/helper_function.dart';
import 'package:bomjour/utils/app_constants/app_config.dart';
import 'package:bomjour/utils/app_constants/app_images.dart';
import 'package:bomjour/utils/app_constants/localization.dart';
import 'package:bomjour/utils/app_themes/app_colors.dart';
import 'package:bomjour/utils/dark_theme_provider/dark_theme.dart';
import 'package:bomjour/utils/email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:flutter_svg/svg.dart';
import 'package:country_picker/country_picker.dart';

import 'package:cached_network_image/cached_network_image.dart';

import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'dart:ui' as ui;

class AccountView extends StatefulWidget {
  const AccountView({super.key});

  @override
  State<AccountView> createState() => _AccountViewState();
}

class _AccountViewState extends State<AccountView> {
  var firstController = TextEditingController();

  var lastController = TextEditingController();
  var emailController = TextEditingController();
  var numberController = TextEditingController();
  var passwordController = TextEditingController();
  String countryCode = "971";
  File? file;

  bool isShowPass = false;
  bool isEmail = false;
  bool isFirst = false;
  bool isLast = false;
  bool isNumber = false;
  bool isFirstValidate = true;
  bool isLastValidate = true;
  bool isNumberValidate = true;
  bool isEmailValidate = true;
  bool isPassword = false;
  bool isPasswordValidated = true;
  final formKey = GlobalKey<FormState>();
  var firstTip = GlobalKey<TooltipState>();
  var lastTip = GlobalKey<TooltipState>();
  var emailTip = GlobalKey<TooltipState>();
  var numberTip = GlobalKey<TooltipState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    emailController.text = (Provider.of<HomeController>(context, listen: false)
            .getProfileModel
            ?.data
            ?.email)
        .toString();
    firstController.text = (Provider.of<HomeController>(context, listen: false)
            .getProfileModel
            ?.data
            ?.firstName)
        .toString();
    lastController.text = (Provider.of<HomeController>(context, listen: false)
            .getProfileModel
            ?.data
            ?.lastName)
        .toString();
    numberController.text = (Provider.of<HomeController>(context, listen: false)
            .getProfileModel
            ?.data
            ?.phone)
        .toString();
  }

  @override
  Widget build(BuildContext context) {
    var localization = AppLocalizations.of(context);
    final themeChange = Provider.of<ThemeLocalizationProvider>(context);
    final homeController = Provider.of<HomeController>(context);
    return Directionality(
        textDirection: themeChange.locale.languageCode == "en"
            ? ui.TextDirection.ltr
            : ui.TextDirection.rtl,
        child: Scaffold(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          body: Column(
            children: [
              appBarProfile(
                  context: context,
                  title: AppLocalizations.of(context).account),
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Form(
                      key: formKey,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 15,
                          ),
                          GestureDetector(
                            onTap: () {
                              showModalBottomSheet(
                                  backgroundColor: Colors.transparent,
                                  context: context,
                                  builder: (builder) => bottomSheet(
                                      onCamera: () {
                                        Navigator.pop(context);
                                        HelperFunctions.pickImage(
                                                ImageSource.camera)
                                            .then((value) {
                                          setState(() {
                                            file = value;
                                          });
                                        });
                                      },
                                      onGallery: () {
                                        Navigator.pop(context);
                                        HelperFunctions.pickImage(
                                                ImageSource.gallery)
                                            .then((value) {
                                          setState(() {
                                            file = value;
                                          });
                                        });
                                      },
                                      context: context));
                            },
                            child: Container(
                              color: Colors.transparent,
                              height: 135,
                              width: AppConfig(context).width,
                              child: Stack(
                                children: [
                                  Center(
                                    child: Container(
                                      height: 120,
                                      width: 120,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(200),
                                        border: Border.all(color: AppLightColors.primary_color)
                                      ),
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(200),
                                        child: CachedNetworkImage(
                                          placeholder: (context, url) => Center(
                                            child: SpinKitThreeBounce(
                                                size: 8,
                                                color: AppLightColors
                                                    .primary_color),
                                          ),
                                          imageUrl: (homeController.getProfileModel?.data?.imgPath).toString(),
                                          fit: BoxFit.cover,
                                          errorWidget: (context, url, error) =>
                                              ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(200),
                                            child:
                                            file==null

                                                ?
                                            Image.asset(
                                              "assets/images/person.png",
                                              fit: BoxFit.cover,
                                            ):Image.file(
                                             file as File,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                      left: 70,
                                      right: 0,
                                      bottom: 7,
                                      child: SvgPicture.asset(
                                          "assets/icons/edit.svg")),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          authFieldWidget(
                              labelText: localization.firstName,
                              controller: firstController,
                              context: context,
                              validator: (value) {
                                WidgetsBinding.instance
                                    .addPostFrameCallback((_) {
                                  setState(() {
                                    if (value!.isEmpty) {
                                      isFirst = true;
                                      isFirstValidate = false;
                                      return;
                                    }
                                    if (value.length < 3) {
                                      isFirst = true;
                                      isFirstValidate = false;
                                      return;
                                    }
                                    if (!RegExp("[a-zA-Z]").hasMatch(value)) {
                                      isFirst = true;
                                      isFirstValidate = false;
                                      return;
                                    }
                                    isFirstValidate = true;

                                    return null;
                                  });
                                });
                              },
                              isShowError: isFirstValidate,
                              errorText: localization.firstName,
                              borderColor: isFirst
                                  ? AppLightColors.primary_color
                                  : Theme.of(context)
                                      .primaryColor
                                      .withOpacity(0.1),
                              onTap: () {
                                setState(() {
                                  isFirst = true;
                                  isPassword = false;
                                  isNumber = false;
                                  isEmail = false;
                                  isLast = false;
                                });
                              }),
                          SizedBox(
                            height: 6,
                          ),
                          authFieldWidget(
                              labelText: localization.lastName,
                              controller: lastController,
                              isShowError: isLastValidate,
                              errorText: localization.lastName,
                              context: context,
                              validator: (value) {
                                WidgetsBinding.instance
                                    .addPostFrameCallback((_) {
                                  setState(() {
                                    if (value!.isEmpty) {
                                      isLast = true;
                                      isLastValidate = false;
                                      return;
                                    }
                                    if (value.length < 3) {
                                      isLast = true;
                                      isLastValidate = false;
                                      return;
                                    }
                                    if (!RegExp("[a-zA-Z]").hasMatch(value)) {
                                      isLast = true;
                                      isLastValidate = false;
                                      return;
                                    }

                                    isLastValidate = true;
                                    return null;
                                  });
                                });
                              },
                              borderColor: isLast
                                  ? AppLightColors.primary_color
                                  : Theme.of(context)
                                      .primaryColor
                                      .withOpacity(0.1),
                              onTap: () {
                                setState(() {
                                  isLast = true;
                                  isPassword = false;
                                  isNumber = false;
                                  isEmail = false;
                                  isFirst = false;
                                });
                              }),
                          SizedBox(
                            height: 6,
                          ),
                          authFieldWidget(
                              labelText: localization.email,
                              controller: emailController,
                              isRead: true,
                              showCur: false,
                              context: context,
                              validator: (value) {
                                WidgetsBinding.instance
                                    .addPostFrameCallback((_) {
                                  setState(() {
                                    if (value!.isEmpty) {
                                      isEmailValidate = false;
                                      isEmail = true;
                                      return;
                                    } else if (!EmailValidator.validate(
                                        value)) {
                                      isEmail = true;
                                      isEmailValidate = false;
                                      return;
                                    } else {
                                      isEmailValidate = true;
                                      return;
                                    }
                                  });
                                });
                              },
                              isShowError: isEmailValidate,
                              errorText: localization.enterCorrect,
                              borderColor: isEmail
                                  ? AppLightColors.primary_color
                                  : Theme.of(context)
                                      .primaryColor
                                      .withOpacity(0.1),
                              onTap: () {
                                setState(() {
                                  isPassword = false;
                                  isNumber = false;
                                  isFirst = false;
                                  isLast = false;
                                });
                              }),
                          SizedBox(
                            height: 6,
                          ),
                          authFieldWidget(
                              labelText: localization.number,
                              isPrefix: true,
                              isShowError: isNumberValidate,
                              errorText: localization.number,
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
                                            color:
                                                Theme.of(context).primaryColor,
                                            fontWeight: FontWeight
                                                .w600)), // optional. Shows phone code before the country name.
                                    onSelect: (Country country) {
                                      setState(() {
                                        countryCode = country.phoneCode;
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
                                          text: "+${countryCode.toString()}",
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
                              controller: numberController,
                              textInputType: TextInputType.phone,
                              textInputAction: TextInputAction.done,
                              context: context,
                              validator: (value) {
                                WidgetsBinding.instance
                                    .addPostFrameCallback((_) {
                                  setState(() {
                                    if (value!.isEmpty) {
                                      isNumber = true;
                                      isNumberValidate = false;

                                      return;
                                    } else if (value.length < 8) {
                                      isNumber = true;
                                      isNumberValidate = false;

                                      return;
                                    } else {
                                      //   isNumber = true;
                                      isNumberValidate = true;
                                      return null;
                                    }
                                  });
                                });
                              },
                              borderColor: isNumber
                                  ? AppLightColors.primary_color
                                  : Theme.of(context)
                                      .primaryColor
                                      .withOpacity(0.1),
                              onTap: () {
                                setState(() {
                                  isNumber = true;
                                  isPassword = false;
                                  isEmail = false;
                                  isFirst = false;
                                  isLast = false;
                                });
                              }),
                          SizedBox(
                            height: AppConfig(context).height * 0.03,
                          ),
                          homeController.profileLoader?
                          Center(
                            child: SpinKitThreeBounce(
                                size: 25, color: AppLightColors.primary_color),
                          ):
                          AppButton(
                              buttonName: localization.update,
                              onTap: () {
                                if (formKey.currentState!.validate()) {
                                  if (validateAccount(context)) {
                                    homeController.updateProfileLoader(true);
                                    ApiManger().editProfile(
                                      context: context,
                                        name: firstController.text,
                                        phone: numberController.text,
                                        file: file);
                                  }
                                }
                              }),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }

  bool validateAccount(BuildContext context) {
    if (firstController.text.isEmpty) {
      isFirstValidate = false;
      return false;
    }
    if (isFirstValidate == false) {
      return false;
    }
    if (lastController.text.isEmpty) {
      isLastValidate = false;
      return false;
    }
    if (isLastValidate == false) {
      return false;
    }
    if (emailController.text.isEmpty) {
      isEmailValidate = false;
      return false;
    }
    if (isEmailValidate == false) {
      return false;
    }

    if (numberController.text.toString().isEmpty) {
      isNumberValidate = false;
      return false;
    }
    if (isNumberValidate == false) {
      return false;
    }

    return true;
  }
}
