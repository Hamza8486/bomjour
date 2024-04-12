import 'package:bomjour/app_module/bottom_tabs/add_occasions/controller/add_occasion_controller.dart';
import 'package:bomjour/app_module/bottom_tabs/profile/component/profile_component.dart';
import 'package:bomjour/utils/app_common_widgets/app_text.dart';
import 'package:bomjour/utils/app_common_widgets/app_text_field.dart';
import 'package:bomjour/utils/app_constants/app_images.dart';
import 'package:bomjour/utils/app_constants/localization.dart';
import 'package:bomjour/utils/app_themes/app_colors.dart';
import 'package:bomjour/utils/dark_theme_provider/dark_theme.dart';
import 'package:fast_contacts/fast_contacts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'dart:ui' as ui;

class AddContactList extends StatelessWidget {
  const AddContactList({super.key});


  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<ThemeLocalizationProvider>(context);
    var localization = AppLocalizations.of(context);
    final occasionAddController = Provider.of<AddOccasionController>(context);

    return Directionality(
        textDirection:     themeChange.locale.languageCode  =="en"? ui.TextDirection.ltr: ui.TextDirection.rtl,
        child: Scaffold(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          body:

          Column(
            children: [
              appBarProfile(context: context,
                  title: AppLocalizations.of(context).add_contact,
                image:
                "assets/icons/cross.svg",

              ),


              Container(
                width: double.infinity,
                height: 76,
                color: themeChange.darkTheme
                    ? AppLightColors.textField_back_dark
                    : AppLightColors.profileBackColor,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Center(
                    child: appField(
                        context: context,
                        hint: localization.searchName,
                        border: themeChange.darkTheme
                            ? AppLightColors.black_color
                            : AppLightColors.border_color,
                        hintSize: 14,
                        borderRadius: BorderRadius.circular(100),
                        onChange: (value) {
                          occasionAddController.filterContacts(value.toString());
                        },
                        isPrefix: true,
                        fillColor: themeChange.darkTheme
                            ? AppLightColors.textField_back_dark
                            : AppLightColors.white_color,
                        textInputAction: TextInputAction.done,

                        child1: Padding(
                          padding: const EdgeInsets.only(
                              left: 16, right: 16, bottom: 3, top: 5),
                          child: SvgPicture.asset(
                            AppImages.search_icon,
                            color: AppLightColors.border_color,
                          ),
                        )),
                  ),
                ),
              ),
              SizedBox(height: 24),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppText(
                      text: localization.invitation_member,
                      size: 17,
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.w400,
                    ),
                    AppText(
                      text: localization.Added,
                      size: 15,
                      color: AppLightColors.label_color,
                      fontWeight: FontWeight.w400,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16),
              Expanded(
                child: Consumer<AddOccasionController>(
                  builder: (context, occasionController, _) {
                    if (occasionController.contacts.isEmpty) {
                      occasionController.fetchContacts();
                      return Center(
                        child: SpinKitThreeBounce(
                            size: 25, color: AppLightColors.primary_color),
                      );
                    } else {
                      return Padding(
                        padding: const EdgeInsets.only(top: 16),
                        child: ListView.builder(
                          itemCount: occasionController.filteredContacts.length,
                          shrinkWrap: true,
                          primary: false,
                          padding: EdgeInsets.zero,
                          itemBuilder: (context, index) {
                            Contact contact = occasionController.filteredContacts[index];
                            return Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 16),
                                  child: Row(
                                    children: [
                                      SizedBox(
                                        height: 40,
                                        width: 40,
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(1000),
                                          child: CachedNetworkImage(
                                            placeholder: (context, url) => Center(
                                              child: SpinKitThreeBounce(
                                                  size: 5,
                                                  color: AppLightColors.primary_color),
                                            ),
                                            imageUrl: "",
                                            fit: BoxFit.cover,
                                            errorWidget: (context, url, error) =>
                                                ClipRRect(
                                                  borderRadius: BorderRadius.circular(1000),
                                                  child: Image.asset(
                                                    "assets/images/person.png",
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: 10),
                                      AppText(
                                        text: contact.displayName.isEmpty
                                            ? "Username"
                                            : contact.displayName,
                                        size: 15,
                                        color: Theme.of(context).primaryColor,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 15),
                                Divider(color: AppLightColors.otpLightColor),
                                SizedBox(height: 15),
                              ],
                            );
                          },
                        ),
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ));
  }


  Future<List<Contact>> getContacts() async {
    bool isGranted = await Permission.contacts.status.isGranted;
    if (!isGranted) {
      isGranted = await Permission.contacts.request().isGranted;
    }
    if (isGranted) {
      return await FastContacts.getAllContacts();
    }
    return [];
  }
}






