
import 'package:bomjour/app_module/address/component/add_address.dart';
import 'package:bomjour/app_module/address/controller/address_controller.dart';
import 'package:bomjour/app_module/cart_view/cart_controller/cart_controller.dart';
import 'package:bomjour/services/api_manager.dart';
import 'package:bomjour/utils/app_common_widgets/app_button.dart';
import 'package:bomjour/utils/app_common_widgets/app_text.dart';
import 'package:bomjour/utils/app_common_widgets/helper_function.dart';
import 'package:bomjour/utils/app_common_widgets/shimmers.dart';
import 'package:bomjour/utils/app_constants/app_config.dart';
import 'package:bomjour/utils/app_constants/localization.dart';
import 'package:bomjour/utils/app_themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:flutter_svg/svg.dart';

class AddressListView extends StatelessWidget {
  const AddressListView({super.key});

  @override
  Widget build(BuildContext context) {
    final addressController = Provider.of<AddressController>(context);
    var localization = AppLocalizations.of(context);
    final cartController = Provider.of<CartController>(context);
    return

      addressController.addressLoader
          ? Column(
        children: [
          SizedBox(
            height: AppConfig(context).height * 0.01,
          ),
          getShimmerAddressEffect(context: context),
        ],
      )
          : addressController.addressList.isEmpty
          ? Column(
        children: [
          SizedBox(
            height: 60,
          ),
          SvgPicture.asset("assets/icons/address.svg"),
          SizedBox(
            height: 20,
          ),
          Center(
            child: AppText(
              text: "No Address",
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
                text: "Oops! It seems you don't have any address",
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
              addressController.getPropertyTypes();
              addressController.addressCon.clear();
              showModalBottomSheet(
                  backgroundColor: Colors.transparent,
                  isScrollControlled: true,
                  isDismissible: true,
                  context: context,
                  builder: (context) => AddAddress());
            },
              buttonHeight: 45,
            ),
          )
        ],
      )
          :
      ListView.builder(
      padding: EdgeInsets.only(top: 4),
      shrinkWrap: true,
      primary: false,
      reverse: true,
      itemCount: addressController.addressList.length,
      itemBuilder: (BuildContext context, int index) {

        return Dismissible(
          key: Key(addressController
              .addressList[index].id
              .toString()),

          onDismissed: (direction) {
            if (direction ==
                DismissDirection.endToStart ||direction == DismissDirection.startToEnd) {
              ApiManger().deleteAddress(
                context: context,
                id: addressController
                    .addressList[index].id
                    .toString(),
              );
              addressController.addressList
                  .removeAt(index);
              flutterToast(
                  msg:
                  "Address deleted successfully");
            }
          },
          background: Container(

            child: Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 26),
                child: SvgPicture.asset('assets/icons/remove.svg'),
              ),
            ),
          ),
          child: GestureDetector(
            onTap: (){
              cartController.updateAddressId(addressController.addressList[index].id.toString());
              cartController.updateAddress(addressController.addressList[index].address.toString());
              cartController.updateAddressName(addressController.addressList[index].addressNickname.toString());

            },
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 16,vertical: 15),
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color:
                  cartController.addressId==addressController.addressList[index].id.toString()?AppLightColors.primary_color:
                  AppLightColors.dividerColor)
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 14),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:  EdgeInsets.only(left: 16,right: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          AppText(
                            text:
                            addressController.addressList[index].addressNickname.toString(),
                            size: 14,
                            fontWeight: FontWeight.w600,
                            color: Theme.of(context).primaryColor,
                          ),
                          GestureDetector(
                            onTap: () {
                              addressController
                                  .addressCon
                                  .text =
                                  addressController
                                      .addressList[
                                  index]
                                      .address
                                      .toString();
                              addressController.updateLng(addressController
                                  .addressList[
                              index]
                                  .longitude
                                  .toString());
                              addressController.updateLat(addressController
                                  .addressList[
                              index]
                                  .latitude
                                  .toString());

                              showModalBottomSheet(
                                backgroundColor:
                                Colors
                                    .transparent,
                                isScrollControlled:
                                true,
                                isDismissible: true,
                                context: context,
                                builder: (context) =>
                                    AddAddress(
                                      type: "edit",
                                      data: addressController
                                          .addressList[
                                      index],
                                    ),
                              );
                            },
                            child: SvgPicture.asset(
                                "assets/icons/ediit.svg"),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10,),
                    Padding(
                      padding:  EdgeInsets.only(left: 16,right: 16),
                      child: AppText(
                        text: addressController.addressList[index].address.toString(),
                        size: 14,
                        fontWeight: FontWeight.w400,
                        color: AppLightColors.label_color,
                      ),
                    ),
                    SizedBox(height: 10,),
                    Divider(color: AppLightColors.dividerColor.withOpacity(0.5),height: 0,),
                    SizedBox(height: 10,),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          // Row(children: [
                          // //   SvgPicture.asset("assets/icons/looc.svg"),
                          // //   SizedBox(width: 10,),
                          // //   AppText(
                          // //     text:  addressController.addressList[index].floorNo.toString(),
                          // //     size: 14,
                          // //     fontWeight: FontWeight.w700,
                          // //     color: AppLightColors.greenColor,
                          // //   ),
                          // ],),
                          Container(decoration: BoxDecoration(color:
                          addressController.addressList[index].propertyType=="Home"?
                          AppLightColors.primary_color:AppLightColors.greenColor,
                              borderRadius: BorderRadius.circular(200)
                          ),
                            child:  Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 14,vertical: 6),
                              child: AppText(
                                text:  addressController.addressList[index].propertyType.toString(),
                                size: 14,
                                fontWeight: FontWeight.w500,
                                color: AppLightColors.white_color,
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
