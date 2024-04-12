import 'package:bomjour/app_module/authentication/login/component/auth_component.dart';
import 'package:bomjour/app_module/bottom_tabs/add_occasions/controller/add_occasion_controller.dart';
import 'package:bomjour/app_module/bottom_tabs/add_occasions/model/group_model.dart';
import 'package:bomjour/app_module/bottom_tabs/profile/component/profile_component.dart';
import 'package:bomjour/services/api_manager.dart';
import 'package:bomjour/utils/app_common_widgets/app_button.dart';
import 'package:bomjour/utils/app_common_widgets/app_text.dart';
import 'package:bomjour/utils/app_common_widgets/app_text_field.dart';
import 'package:bomjour/utils/app_constants/app_config.dart';
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

class CreateGroup extends StatefulWidget {
  const CreateGroup({super.key});

  @override
  State<CreateGroup> createState() => _CreateGroupState();
}

class _CreateGroupState extends State<CreateGroup> {
  @override
  Widget build(BuildContext context) {
    final isKeyBoard = MediaQuery.of(context).viewInsets.bottom != 0;
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
                title: AppLocalizations.of(context).create_groups,
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
                            bool isAdded = occasionController.addGroupList.any((item) => item.mobile == contact.phones.first.number.toString());
                            return Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 16),
                                  child: GestureDetector(
                                    onTap:()
                                  {
                                    String mobileNumber = contact.phones.first.number.toString();
                                    if (isAdded) {
                                      occasionAddController.addGroupList.removeWhere((item) => item.mobile == mobileNumber);
                                    } else {
                                      occasionAddController.addGroupList.add(AddGroupModel(
                                        contactName: contact.displayName.isEmpty ? "UserName" : contact.displayName,
                                        mobile: mobileNumber,
                                      ));
                                    }
                                    setState(() {

                                    });
                                  },
                                    child: Container(
                                      color:Colors.transparent,
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
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
                                          Container(height: 25,
                                          width: 25,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(100),
                                              color:
                            isAdded?AppLightColors.primary_color:
                                              AppLightColors.border_color.withOpacity(0.2)
                                            ),
                                            child:
                                            isAdded ?
                                            Center(
                                              child: Icon(Icons.check,
                                              color: AppLightColors.white_color,
                                              size: 12,
                                              ),
                                            ):SizedBox.shrink(),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 10),
                                Divider(color: AppLightColors.otpLightColor),
                                SizedBox(height: 10),
                              ],
                            );
                          },
                        ),
                      );
                    }
                  },
                ),
              ),
              isKeyBoard?SizedBox.shrink():
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 10),
                child: AppButton(
                    buttonName:localization.Save,

                    onTap: (){
                      showModalBottomSheet(
                          backgroundColor: Colors.transparent,
                          isScrollControlled: true,
                          isDismissible: true,
                          context: context,
                          builder: (context) =>   GroupNameSheet());
                    }),
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





class GroupNameSheet extends StatefulWidget {
  GroupNameSheet({super.key});

  @override
  State<GroupNameSheet> createState() => _GroupNameSheetState();
}

class _GroupNameSheetState extends State<GroupNameSheet> {
  bool groupName = false;
  @override
  Widget build(BuildContext context) {
    final isKeyBoard = MediaQuery.of(context).viewInsets.bottom != 0;
    final themeChange = Provider.of<ThemeLocalizationProvider>(context);
    var localization = AppLocalizations.of(context);
    final occasionAddController = Provider.of<AddOccasionController>(context);

    return  Directionality(

      textDirection:     themeChange.locale.languageCode  =="en"? ui.TextDirection.ltr: ui.TextDirection.rtl,
      child: DraggableScrollableSheet(
        initialChildSize: isKeyBoard?0.58:0.35,
        minChildSize:isKeyBoard?0.58:0.35,
        maxChildSize: isKeyBoard?0.58:0.35,
        builder: (_, controller) => Container(
          decoration: BoxDecoration(
            color: Theme.of(context).scaffoldBackgroundColor,
            borderRadius:  BorderRadius.only(
                topLeft: Radius.circular(10), topRight: Radius.circular(10)),
          ),
          child: Padding(
            padding:  EdgeInsets.only(top: 10),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height:AppConfig(context).height*0.01 ,),
                  Center(child: SvgPicture.asset(AppImages.border)),
                  SizedBox(height:24 ,),
                  Center(
                    child: AppText(text: "${localization.enetr_your_email.toString().split(" ").first} ${localization.group_name}"
                      ,
                      size: 18,
                      color: Theme.of(context).primaryColor,
                      textAlign: themeChange.locale.languageCode  =="en"?TextAlign.left:TextAlign.right,

                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height:24 ,),
                  authFieldWidget(
                      labelText:
                      AppLocalizations.of(context).group_name,
                      controller: occasionAddController.groupNameController,

                      textInputAction: TextInputAction.done,
                      context: context,
                      borderColor: groupName
                          ? AppLightColors.primary_color
                          : Theme.of(context)
                          .primaryColor
                          .withOpacity(0.1),
                      onTap: () {
                        setState(() {

                          groupName = true;

                        });
                      }),
                 Spacer(),
                  Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: AppButton(
                          buttonName:

                          AppLocalizations.of(context).create_groups,
                          onTap:(){
                            ApiManger().addGroupModel(groupItem: occasionAddController.addGroupList.toList(), context: context);
                          }


                          ))



                ],
              ),
            ),
          ),
        ),
      ),
    );


  }
}









