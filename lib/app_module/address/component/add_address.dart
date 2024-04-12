import 'package:bomjour/app_module/address/component/pick_address_map.dart';
import 'package:bomjour/app_module/address/controller/address_controller.dart';
import 'package:bomjour/app_module/authentication/login/component/auth_component.dart';
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
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'dart:ui' as ui;

class AddAddress extends StatefulWidget {
  AddAddress({super.key,this.type,this.data});
  var type;
  var data;

  @override
  State<AddAddress> createState() => _AddAddressState();
}

class _AddAddressState extends State<AddAddress> {
  var addressName = TextEditingController();
  var cityCon = TextEditingController();
  var floorCon = TextEditingController();
  bool addressNameBool = false;
  bool address = false;
  bool city = false;
  bool floor = false;
  String? addressType;

  bool isLoading = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if(widget.type=='edit'){
      addressName.text=widget.data.addressNickname.toString();
      addressType=widget.data.propertyTypeId.toString();
      floorCon.text=widget.data.floorNo.toString();
      cityCon.text=widget.data.city.toString();
      setState(() {

      });

    }
  }

  @override
  Widget build(BuildContext context) {
    final isKeyBoard = MediaQuery.of(context).viewInsets.bottom != 0;
    final themeChange = Provider.of<ThemeLocalizationProvider>(context);
    final addressController = Provider.of<AddressController>(context);
    final homeController = Provider.of<HomeController>(context);
    return Directionality(
        textDirection: themeChange.locale.languageCode == "en"
            ? ui.TextDirection.ltr
            : ui.TextDirection.rtl,
        child: DraggableScrollableSheet(
          initialChildSize: isKeyBoard ? 0.89 : 0.68,
          minChildSize: isKeyBoard ? 0.89: 0.68,
          maxChildSize: isKeyBoard ? 0.89: 0.68,
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
                      widget.type=='edit'?"Update Address":
                      AppLocalizations.of(context).addNewAddress,
                      size: 16,
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    height: 32,
                  ),
                  authFieldWidget(
                      labelText: "Address Name",
                      controller: addressName,
                      textInputAction: TextInputAction.done,
                      context: context,
                      onTap: (){
                        setState(() {
                          addressNameBool=true;
                          city = false;
                          address = false;

                          floor = false;
                        });
                      },
                      borderColor: addressNameBool
                          ? AppLightColors.primary_color
                          : Theme.of(context)
                              .primaryColor
                              .withOpacity(0.1),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  authFieldWidget(
                      labelText: AppLocalizations.of(context).address,
                      controller: addressController.addressCon,
                      isRead: true,
                      context: context,
                      borderColor: address
                          ? AppLightColors.primary_color
                          : Theme.of(context)
                          .primaryColor
                          .withOpacity(0.1),
                      onTap: () {
                        setState(() {
                          city = false;
                          address = true;
                          addressNameBool=false;
                          floor = false;
                        });
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PickAddressMap()),
                        );
                      }),
                  SizedBox(
                    height: 16,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: authFieldWidget(
                            labelText:
                                AppLocalizations.of(context).city,
                            controller: cityCon,
                            textInputAction: TextInputAction.done,
                            context: context,
                            borderColor: city
                                ? AppLightColors.primary_color
                                : Theme.of(context)
                                    .primaryColor
                                    .withOpacity(0.1),
                            onTap: () {
                              setState(() {
                                city = true;
                                address = false;
                                addressNameBool=false;
                                floor = false;
                              });
                            }),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: authFieldWidget(
                            labelText:
                                AppLocalizations.of(context).floor,
                            controller: floorCon,
                            textInputAction: TextInputAction.done,
                            context: context,
                            borderColor: floor
                                ? AppLightColors.primary_color
                                : Theme.of(context)
                                    .primaryColor
                                    .withOpacity(0.1),
                            onTap: () {
                              setState(() {
                                address = false;
                                floor = true;
                                city = false;
                                addressNameBool=false;
                              });
                            }),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  Wrap(
                    direction: Axis.horizontal,
                    spacing: 15.0,
                    runSpacing: 15.0,
                    children: List.generate(
                        addressController.propertyList.length, (index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            addressType = addressController
                                .propertyList[index].id
                                .toString();
                            print(addressController
                                .propertyList[index].type.toString());
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(40),
                              color: addressType ==
                                      addressController
                                          .propertyList[index].id
                                          .toString()
                                  ? AppLightColors.primary_color
                                  : Colors.transparent,
                              border: Border.all(
                                  color: addressType ==
                                          addressController
                                              .propertyList[index].id
                                              .toString()
                                      ? AppLightColors.primary_color
                                      : Theme.of(context)
                                          .disabledColor)),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal:
                                    AppConfig(context).width * 0.035,
                                vertical:
                                    AppConfig(context).height * 0.01),
                            child: AppText(
                                text: themeChange.locale.languageCode ==
                                        "en"
                                    ? addressController
                                        .propertyList[index].type
                                        .toString()
                                    : addressController
                                        .propertyList[index].typeAr
                                        .toString(),
                                size: 14,
                                fontWeight: FontWeight.w500,
                                color: addressType ==
                                        addressController
                                            .propertyList[index].id
                                            .toString()
                                    ? AppLightColors.white_color
                                    : Theme.of(context).primaryColor),
                          ),
                        ),
                      );
                    }),
                  ),
                Spacer(),
                  addressController.addAddressCon
                      ? Center(
                          child: SpinKitThreeBounce(
                              size: 25, color: AppLightColors.primary_color))
                      : Padding(
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          child: AppButton(
                              buttonName:

                              AppLocalizations.of(context).Save,
                              onTap:
                              widget.type=='edit'?(){
                                if (addressName.text.isEmpty) {
                                  flutterToast(msg: "Please enter address name");
                                } else if (addressController.addressCon.text.isEmpty) {
                                  flutterToast(msg: "Please select address");
                                }
                                else if (cityCon.text.isEmpty) {
                                  flutterToast(msg: "Please enter city name");
                                }
                                else if (floorCon.text.isEmpty) {
                                  flutterToast(msg: "Please enter floor no.");
                                }
                                else if (addressType == null) {
                                  flutterToast(
                                      msg: "Please select address type");
                                } else {
                                  addressController.updateAddAddress(true);
                                  ApiManger().updateAddress(
                                      id:(homeController.id).toString(),
                                      addressId:widget.data.id.toString() ,
                                      address: addressController.addressCon.text,
                                      floorNo: floorCon.text,
                                      type: addressType.toString(),
                                      context: context,
                                    city: cityCon.text,
                                      addressName: addressName.text,
                                    lat: addressController.lat.toString(),
                                    lng: addressController.lng.toString()
                                  );
                                }
                              }:
                                  () {
                                    if (addressName.text.isEmpty) {
                                      flutterToast(msg: "Please enter address name");
                                    } else if (addressController.addressCon.text.isEmpty) {
                                      flutterToast(msg: "Please select address");
                                    }
                                else if (cityCon.text.isEmpty) {
                                  flutterToast(msg: "Please enter city name");
                                }

                                else if (floorCon.text.isEmpty) {
                                  flutterToast(msg: "Please enter floor no.");
                                } else if (addressType == null) {
                                  flutterToast(
                                      msg: "Please select address type");
                                } else {
                                 addressController.updateAddAddress(true);
                                 ApiManger().addAddress(
                                    id: (homeController.id).toString(),
                                    address: addressController.addressCon.text,
                                    floorNo: floorCon.text,
                                    addressName: addressName.text,
                                    type: addressType.toString(),
                                    context: context,
                                      city: cityCon.text,
                                      lat: addressController.lat.toString(),
                                      lng: addressController.lng.toString()
                                  );
                                }
                              })),
                ],
              ),
            ),
          ),
        ));
  }


}
