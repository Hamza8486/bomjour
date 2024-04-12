
import 'package:bomjour/app_module/address/component/add_address.dart';
import 'package:bomjour/app_module/address/controller/address_controller.dart';
import 'package:bomjour/app_module/cart_view/cart_controller/cart_controller.dart';
import 'package:bomjour/app_module/payment/component/add_payment_card.dart';
import 'package:bomjour/app_module/payment/controller/card_controller.dart';
import 'package:bomjour/services/api_manager.dart';
import 'package:bomjour/utils/app_common_widgets/app_button.dart';
import 'package:bomjour/utils/app_common_widgets/app_text.dart';
import 'package:bomjour/utils/app_common_widgets/helper_function.dart';
import 'package:bomjour/utils/app_common_widgets/shimmers.dart';
import 'package:bomjour/utils/app_constants/app_config.dart';
import 'package:bomjour/utils/app_constants/localization.dart';
import 'package:bomjour/utils/app_themes/app_colors.dart';
import 'package:bomjour/utils/dark_theme_provider/dark_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:flutter_svg/svg.dart';

class PaymentList extends StatelessWidget {
  const PaymentList({super.key});

  @override
  Widget build(BuildContext context) {
    final cardController = Provider.of<CardController>(context);
    final themeChange = Provider.of<ThemeLocalizationProvider>(context);
    var localization = AppLocalizations.of(context);
    return

      cardController.cardLoader
          ? Column(
        children: [
          SizedBox(
            height: AppConfig(context).height * 0.01,
          ),
          getShimmerAddressEffect(context: context),
        ],
      )
          : cardController.cardList.isNotEmpty
          ? Column(
        children: [
          SizedBox(
            height: 60,
          ),
          SvgPicture.asset("assets/icons/card.svg"),
          SizedBox(
            height: 20,
          ),
          Center(
            child: AppText(
              text: "No Card",
              size: 24,
              color: Theme.of(context).primaryColor,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 60),
            child: Center(
              child: AppText(
                text: "Oops! It seems you don't have any card",
                size: 16,
                color: AppLightColors.greyColorWish,
                fontWeight: FontWeight.w400,
                textAlign: TextAlign.center,
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 100),
            child: AppButton(buttonName: localization.Add, onTap: (){


              showModalBottomSheet(
                  backgroundColor: Colors.transparent,
                  isScrollControlled: true,
                  isDismissible: true,
                  context: context,
                  builder: (context) => AddPaymentCard());
            },
              buttonHeight: 45,
            ),
          )
        ],
      )
          :
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: ListView.builder(
            shrinkWrap: true,
            primary: false,

            padding:  EdgeInsets.zero,
            itemCount: cardController.paymentCardList.length,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding:  EdgeInsets.symmetric(vertical: 8),
                child: Container(
                  height: 82,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color:
                      cardController.indexSelect==index?AppLightColors.primary_color:

                      themeChange.darkTheme?AppLightColors.black_color:
                      AppLightColors.otpLightColor,width: 1)
                  ),
                  child: GestureDetector(
                    onTap: (){
                      cardController.updateSelectedPayment(index);
                    },
                    child: Container(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,

                          children: [

                            Row(
                              children: [
                                Image.asset(cardController.paymentCardList[index]["image"],
                                  height: 54,
                                  width: 54,
                                ),
                                SizedBox(width: 14,),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,

                                  children: [
                                    index==0?
                                    AppText(
                                      text: AppLocalizations.of(context).paymentCard,
                                      size: 14,
                                      color: Theme.of(context).primaryColor,
                                      fontWeight: FontWeight.w600,
                                    ): AppText(
                                      text: AppLocalizations.of(context).VisaCard,
                                      size: 14,
                                      color: Theme.of(context).primaryColor,
                                      fontWeight: FontWeight.w600,
                                    ),
                                    SizedBox(height: 3,),
                                    AppText(
                                      text: "4355  4666  5676  455",
                                      size: 12,
                                      color:AppLightColors.label_color,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            cardController.indexSelect==index?
                            Image.asset("assets/icons/check.png",
                              height: 24,
                              width: 24,
                            ):  Image.asset("assets/icons/uncheck.png",
                              height: 24,
                              width: 24,
                            )

                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              );
            }
        ),
      );
  }
}
