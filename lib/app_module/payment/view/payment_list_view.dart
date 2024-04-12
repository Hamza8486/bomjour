import 'package:bomjour/app_module/bottom_tabs/profile/component/profile_component.dart';
import 'package:bomjour/app_module/payment/component/add_payment_card.dart';
import 'package:bomjour/app_module/payment/component/paymentList.dart';
import 'package:bomjour/utils/app_common_widgets/app_button.dart';
import 'package:bomjour/utils/app_common_widgets/app_text.dart';
import 'package:bomjour/utils/app_constants/localization.dart';
import 'package:bomjour/utils/app_themes/app_colors.dart';
import 'package:bomjour/utils/dark_theme_provider/dark_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:ui' as ui;

class PaymentListView extends StatelessWidget {
  const PaymentListView({super.key});

  @override
  Widget build(BuildContext context) {

    final themeChange = Provider.of<ThemeLocalizationProvider>(context);
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
                  title: "Payments",
                  thickness: 2),
              Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 16,),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: AppText(
                            text: "Payment Card",
                            size: 20,
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: 16,),

                        PaymentList(),
                      ],
                    ),
                  )),

              Padding(
                padding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                child: AppButton(
                    borderColor: themeChange.darkTheme
                        ? AppLightColors.greyColorWish
                        : AppLightColors.otpLightColor,
                    borderWidth: 1.5,
                    buttonColor: themeChange.darkTheme
                        ? AppLightColors.textField_back_dark
                        : AppLightColors.white_color,
                    textColor: Theme.of(context).primaryColor,
                    buttonName: AppLocalizations.of(context).addNew,
                    onTap: () {
                      showModalBottomSheet(
                          backgroundColor: Colors.transparent,
                          isScrollControlled: true,
                          isDismissible: true,
                          context: context,
                          builder: (context) => AddPaymentCard());
                    }),
              )
            ],
          ),
        ));
  }
}
