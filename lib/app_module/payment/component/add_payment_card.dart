import 'package:bomjour/app_module/authentication/login/component/auth_component.dart';
import 'package:bomjour/app_module/payment/controller/card_controller.dart';
import 'package:bomjour/utils/app_common_widgets/app_button.dart';
import 'package:bomjour/utils/app_common_widgets/app_text.dart';
import 'package:bomjour/utils/app_common_widgets/helper_function.dart';
import 'package:bomjour/utils/app_constants/app_config.dart';
import 'package:bomjour/utils/app_constants/app_images.dart';
import 'package:bomjour/utils/app_constants/localization.dart';
import 'package:bomjour/utils/app_themes/app_colors.dart';
import 'package:bomjour/utils/dark_theme_provider/dark_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'dart:ui' as ui;

class AddPaymentCard extends StatefulWidget {
  AddPaymentCard({super.key});


  @override
  State<AddPaymentCard> createState() => _AddPaymentCardState();
}

class _AddPaymentCardState extends State<AddPaymentCard> {
  var cardNameController = TextEditingController();
  var expireDateController = TextEditingController();
  var cvvController = TextEditingController();
  bool cardNameBool = false;
  bool expireBool = false;
  bool cvvBool = false;


  @override
  Widget build(BuildContext context) {
    final isKeyBoard = MediaQuery.of(context).viewInsets.bottom != 0;
    final themeChange = Provider.of<ThemeLocalizationProvider>(context);
    final cardController = Provider.of<CardController>(context);
    return Directionality(
        textDirection: themeChange.locale.languageCode == "en"
            ? ui.TextDirection.ltr
            : ui.TextDirection.rtl,
        child: DraggableScrollableSheet(
          initialChildSize: isKeyBoard ? 0.7 : 0.57,
          minChildSize: isKeyBoard ? 0.7:  0.57,
          maxChildSize: isKeyBoard ? 0.7:  0.57,
          builder: (_, controller) => Container(
            decoration: BoxDecoration(
              color: Theme.of(context).scaffoldBackgroundColor,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10), topRight: Radius.circular(10)),
            ),
            child: Padding(
              padding: EdgeInsets.only(top: 10, left: 16, right: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: AppConfig(context).height * 0.01,
                  ),
                  Center(child: SvgPicture.asset(AppImages.border)),
                  SizedBox(
                    height: 24,
                  ),
                  Center(
                    child: AppText(
                      text:
                      "Add Card",

                      size: 18,
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    height: 32,
                  ),
                  authFieldWidget(
                    labelText: "Card Number",
                    controller: cardNameController,
                    textInputAction: TextInputAction.next,
                    listInputParam: [
                      LengthLimitingTextInputFormatter(16),
                    ],
                    textInputType: TextInputType.phone,
                    context: context,
                    onTap: (){
                      setState(() {
                        cardNameBool=true;
                        expireBool = false;
                        cvvBool = false;

                      });
                    },
                    borderColor: cardNameBool
                        ? AppLightColors.primary_color
                        : Theme.of(context)
                        .primaryColor
                        .withOpacity(0.1),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: authFieldWidget(
                            labelText: "Expiry Date",
                            listInputParam: [
                              LengthLimitingTextInputFormatter(4),
                            ],
                            controller: expireDateController,
                            textInputType: TextInputType.phone,
                            textInputAction: TextInputAction.next,
                            context: context,
                            borderColor: expireBool
                                ? AppLightColors.primary_color
                                : Theme.of(context)
                                .primaryColor
                                .withOpacity(0.1),
                            onTap: () {
                              setState(() {
                                cardNameBool=false;
                                cvvBool = false;
                                expireBool = true;

                              });
                            }),

                      ),
                      SizedBox(width: 20,),
                      Expanded(
                        child: authFieldWidget(
                            labelText:"Cvv",
                            controller: cvvController,
                            listInputParam: [
                              LengthLimitingTextInputFormatter(3),
                            ],

                            textInputType: TextInputType.phone,
                            textInputAction: TextInputAction.done,
                            context: context,
                            borderColor: cvvBool
                                ? AppLightColors.primary_color
                                : Theme.of(context)
                                .primaryColor
                                .withOpacity(0.1),
                            onTap: () {
                              setState(() {
                                cvvBool = true;
                                expireBool = false;
                                cardNameBool=false;

                              });
                            }),
                      ),
                    ],
                  ),

                  Spacer(),


                  cardController.cardLoader
                      ? Center(
                      child: SpinKitThreeBounce(
                          size: 25, color: AppLightColors.primary_color))
                      : Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      child: AppButton(
                          buttonName:

                          AppLocalizations.of(context).Save,
                          onTap: () {
                            if (cardNameController.text.isEmpty) {
                              flutterToast(msg: "Please enter card number");
                            } else if (expireDateController.text.isEmpty) {
                              flutterToast(msg: "Please enter expire date");
                            }
                            else if (cvvController.text.isEmpty) {
                              flutterToast(msg: "Please enter cvv");
                            }

                           else {

                            }
                          })),
                ],
              ),
            ),
          ),
        ));
  }


}
