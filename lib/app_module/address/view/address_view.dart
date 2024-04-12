import 'package:bomjour/app_module/address/component/add_address.dart';
import 'package:bomjour/app_module/address/component/address_list.dart';
import 'package:bomjour/app_module/address/controller/address_controller.dart';
import 'package:bomjour/app_module/bottom_tabs/profile/component/profile_component.dart';
import 'package:bomjour/app_module/home/controller/home_controller.dart';
import 'package:bomjour/utils/app_common_widgets/app_button.dart';
import 'package:bomjour/utils/app_constants/localization.dart';
import 'package:bomjour/utils/app_themes/app_colors.dart';
import 'package:bomjour/utils/dark_theme_provider/dark_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:ui' as ui;

class AddressView extends StatelessWidget {
  const AddressView({super.key});

  @override
  Widget build(BuildContext context) {

    final themeChange = Provider.of<ThemeLocalizationProvider>(context);
    final addressController = Provider.of<AddressController>(context);
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
                  title: AppLocalizations.of(context).address,
                  thickness: 2),
              Expanded(
                  child: SingleChildScrollView(
                child: Column(
                  children: [


                    AddressListView(),
                  ],
                ),
              )),
              addressController.addressList.isEmpty?SizedBox.shrink():
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
                      print(homeController.id);
                      addressController.getPropertyTypes();
                      addressController.addressCon.clear();
                      showModalBottomSheet(
                          backgroundColor: Colors.transparent,
                          isScrollControlled: true,
                          isDismissible: true,
                          context: context,
                          builder: (context) => AddAddress());
                    }),
              )
            ],
          ),
        ));
  }
}
