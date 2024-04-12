import 'package:bomjour/app_module/address/controller/address_controller.dart';
import 'package:bomjour/app_module/address/view/address_view.dart';
import 'package:bomjour/app_module/authentication/login_type/login_type_view.dart';
import 'package:bomjour/app_module/bottom_tabs/profile/component/account.dart';
import 'package:bomjour/app_module/bottom_tabs/profile/component/appearence.dart';
import 'package:bomjour/app_module/bottom_tabs/profile/component/language.dart';
import 'package:bomjour/app_module/bottom_tabs/profile/component/notification.dart';
import 'package:bomjour/app_module/bottom_tabs/profile/component/wishlist/controller/wishlist_controller.dart';
import 'package:bomjour/app_module/bottom_tabs/profile/component/wishlist/view/my_wishlist.dart';
import 'package:bomjour/app_module/bottom_tabs/profile/component/profile_component.dart';
import 'package:bomjour/app_module/bottom_tabs/profile/component/reward/rewards.dart';
import 'package:bomjour/app_module/cart_view/cart_controller/cart_controller.dart';
import 'package:bomjour/app_module/home/controller/home_controller.dart';
import 'package:bomjour/app_module/order_history/controller/order_controller.dart';
import 'package:bomjour/app_module/order_history/view/order_history_view.dart';
import 'package:bomjour/app_module/payment/view/payment_list_view.dart';
import 'package:bomjour/app_module/prefrence/controller/prefrence_controller.dart';
import 'package:bomjour/app_module/prefrence/view/prefrence_view.dart';
import 'package:bomjour/utils/app_common_widgets/app_text.dart';
import 'package:bomjour/utils/app_common_widgets/helper_function.dart';
import 'package:bomjour/utils/app_constants/global.dart';
import 'package:bomjour/utils/app_constants/localization.dart';
import 'package:bomjour/utils/app_themes/app_colors.dart';
import 'package:bomjour/utils/dark_theme_provider/dark_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:ui' as ui;





class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {

    var localization = AppLocalizations.of(context);
    final themeChange = Provider.of<ThemeLocalizationProvider>(context);
    final addressController = Provider.of<AddressController>(context);
    final cartController = Provider.of<CartController>(context);
    final wishController = Provider.of<WishlistController>(context);
    final orderController = Provider.of<OrderController>(context);
    final prefController = Provider.of<PreferenceController>(context);
    final homeController = Provider.of<HomeController>(context);

    return Directionality(
      textDirection:     themeChange.locale.languageCode  =="en"? ui.TextDirection.ltr: ui.TextDirection.rtl,
      child: WillPopScope(
        onWillPop: () async {
          return false;
        },
        child: Scaffold(
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            body:  Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                appBar(context: context,
                    crossAxisAlignment: CrossAxisAlignment.center
                ),
                SizedBox(height: 6),
                Expanded(
                  child: SingleChildScrollView(

                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 6),
                        profileBar(image: (homeController.getProfileModel?.data?.imgPath).toString(),
                            context: context,
                            name: (homeController.getProfileModel?.data?.firstName).toString(),
                            email: (homeController.getProfileModel?.data?.email).toString(),
                            phoneNumber:
                            homeController.getProfileModel?.data?.phone==null?"+971-302404755":
                            (homeController.getProfileModel?.data?.phone).toString()
                        ),

                        SizedBox(height: 20),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: themeChange.darkTheme?AppLightColors.black_color:
                              AppLightColors.dividerColor),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 12,),
                                Padding(
                                  padding:  EdgeInsets.symmetric(horizontal: 16),
                                  child: AppText(text: localization.account,
                                    size: 14,
                                    color:AppLightColors.profileTabColor,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                profileWidget(
                                    height: 16,
                                    onTap: (){
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) =>  AccountView()),
                                      );
                                    },
                                    image: "assets/icons/account.svg",
                                    context: context,
                                    title: localization.account
                                ),
                                profileWidget(

                                    onTap: (){
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) =>  AppearanceView()),
                                      );

                                    },
                                    context: context,
                                    image: "assets/icons/appear.svg",
                                    title: localization.appear
                                ),

                                profileWidget(onTap: (){
                                  Share.share('check out my website https://example.com', subject: 'Gift');
                                },
                                    image: "assets/icons/share.svg",
                                    context: context,
                                    title: localization.invite
                                ),
                                profileWidget(onTap: (){
                                  orderController.getOrderData(context: context);
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) =>  OrderHistory()),
                                  );
                                },
                                    image: "assets/icons/order.svg",
                                    context: context,
                                    title: localization.orderHis
                                ),
                                profileWidget(onTap: (){

                                  wishController.getWishDataAll(id: (homeController.id).toString(),
                                    token: (homeController.token).toString(),
                                  );
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) =>  MyWishlistView()),
                                  );
                                },
                                    image: "assets/icons/wish.svg",
                                    context: context,
                                    title: localization.wishList
                                ),
                                SizedBox(height: 16,),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: themeChange.darkTheme?AppLightColors.black_color:
                              AppLightColors.dividerColor),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 12,),
                                Padding(
                                  padding:  EdgeInsets.symmetric(horizontal: 16),
                                  child: AppText(text: localization.creditsOffer,
                                    size: 14,
                                    color:AppLightColors.profileTabColor,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                profileWidget(onTap: (){
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) =>  Rewards()),
                                  );
                                },
                                    image: "assets/icons/reward.svg",
                                    context: context,
                                    title: localization.reward
                                ),
                                profileWidget(onTap: (){
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) =>  PaymentListView()),
                                  );

                                },
                                    image: "assets/icons/payment.svg",
                                    context: context,
                                    title: localization.Payment
                                ),

                                SizedBox(height: 16,),
                              ],
                            ),
                          ),
                        ),

                        SizedBox(height: 20),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color:
                              themeChange.darkTheme?AppLightColors.black_color:
                              AppLightColors.dividerColor),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 12,),
                                Padding(
                                  padding:  EdgeInsets.symmetric(horizontal: 16),
                                  child: AppText(text: "Other Settings",
                                    size: 14,
                                    color:AppLightColors.profileTabColor,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),

                                profileWidget(onTap: (){
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) =>  LanguageView()),
                                  );
                                },
                                    image: "assets/icons/language.svg",
                                    context: context,
                                    title: localization.language
                                ),

                                profileWidget(onTap: (){
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) =>  NotificationView()),
                                  );
                                },
                                    image: "assets/icons/Bells.svg",
                                    context: context,
                                    title: "Notifications"
                                ),


                                profileWidget(onTap: (){
                                  cartController.clear();

                                  addressController.getPropertyTypes();
                                  addressController.getAllAddress(id: (homeController.id).toString(),
                                    token: (homeController.token).toString(),

                                  );
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) =>  AddressView()),
                                  );
                                },
                                    image: "assets/icons/loc.svg",
                                    context: context,
                                    title: localization.address
                                ),
                                profileWidget(onTap: (){
                                  prefController.selectID.clear();
                                  prefController.getMyPreferenceData(context: context);
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) =>  PreferenceView()),
                                  );
                                },
                                    image: "assets/icons/pref.svg",
                                    context: context,
                                    title: localization.prefrence
                                ),
                                SizedBox(height: 16,),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color:
                              themeChange.darkTheme?AppLightColors.black_color:
                              AppLightColors.dividerColor),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 12,),
                                Padding(
                                  padding:  EdgeInsets.symmetric(horizontal: 16),
                                  child: AppText(text: "Help",
                                    size: 14,
                                    color:AppLightColors.profileTabColor,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),

                                profileWidget(onTap: (){

                                },
                                    image: "assets/icons/become.svg",
                                    context: context,
                                    title: "Become a Bomjour Merchant"
                                ),

                                profileWidget(onTap: (){

                                },
                                    image: "assets/icons/support.svg",
                                    context: context,
                                    title: "Support Center"
                                ),


                                profileWidget(onTap: (){

                                },
                                    image: "assets/icons/about.svg",
                                    context: context,
                                    title: "About Bomjour"
                                ),

                                profileWidget(onTap: (){

                                },
                                    image: "assets/icons/rate.svg",
                                    context: context,
                                    title: "Rate Us"
                                ),
                                SizedBox(height: 16,),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        GestureDetector(
                          onTap: (){
                            showExit(
                                context: context,
                                onTap: () async {


                                  await HelperFunctions().clearPrefs();
                                  homeController.updateToken('');
                                  homeController.updateName('');
                                  homeController.updateEmail('');
                                  homeController.updateId('');
                                  Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(builder: (context) => LoginTypeView()),
                                        (route) => false,
                                  );



                                });
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Container(
                              height: 52,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                border: Border.all(color: AppLightColors.primary_color,width: 1.3),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SvgPicture.asset("assets/icons/logout.svg",
                                    color: AppLightColors.primary_color,
                                  ),
                                  SizedBox(width: 8,),
                                  AppText(text: localization.logout,
                                    size: 16,
                                    color:
                                    themeChange.darkTheme?AppLightColors.primary_color:
                                    AppLightColors.primary_color,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),





                        SizedBox(height: 25),


                      ],
                    ),
                  ),
                ),
              ],
            )



        ),
      ),
    );
  }


}




