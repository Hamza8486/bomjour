import 'package:bomjour/app_module/bottom_tabs/profile/component/profile_component.dart';
import 'package:bomjour/app_module/order_history/component/order_detail.dart';
import 'package:bomjour/app_module/order_history/controller/order_controller.dart';
import 'package:bomjour/utils/app_common_widgets/app_text.dart';
import 'package:bomjour/utils/app_common_widgets/shimmers.dart';
import 'package:bomjour/utils/app_constants/app_config.dart';
import 'package:bomjour/utils/app_themes/app_colors.dart';
import 'package:bomjour/utils/dark_theme_provider/dark_theme.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'dart:ui' as ui;

class OrderHistory extends StatefulWidget {
  OrderHistory({super.key});

  @override
  State<OrderHistory> createState() => _OrderHistoryState();
}

class _OrderHistoryState extends State<OrderHistory> {

  List statusList=[
    "All",
    "On Hold",
    "Cancelled",
    "Delivered",



  ];

  String selectedStatus="All";

  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<ThemeLocalizationProvider>(context);
    final orderController = Provider.of<OrderController>(context);
    return Directionality(
        textDirection:     themeChange.locale.languageCode  =="en"? ui.TextDirection.ltr: ui.TextDirection.rtl,
        child: Scaffold(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              appBarProfile(context: context,title: "Order History"),
              SizedBox(height: 24),
              Padding(
                padding: const EdgeInsets.only(left: 16),
                child: SizedBox(
                  height: 40,
                  child: ListView.builder(
                      padding:  EdgeInsets.zero,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      primary: false,
                      itemCount: statusList.length,
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                          onTap: (){
                            setState(() {
                              selectedStatus=statusList[index];
                            });
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(right: 8),
                            child: Container(
                              decoration: BoxDecoration(
                                color:
                                selectedStatus==statusList[index]?
                                AppLightColors.primary_color: AppLightColors.rewardBoxColor,
                                borderRadius: BorderRadius.circular(100)
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 20),
                                child: Center(child: AppText(text: statusList[index],
                                size: 15,
                                  fontWeight: FontWeight.w500,
                                  color:
                                  selectedStatus==statusList[index]?AppLightColors.white_color:
                                  AppLightColors.textField_back_dark,
                                )),
                              ),
                            ),
                          ),
                        );
                      }
                  ),
                ),
              ),
              SizedBox(height: 24),
              themeChange.darkTheme?
              Divider(color:

                  AppLightColors.black_color,height: 0 ,)
                  :
              Divider(color:

                  AppLightColors.dividerColor,height: 0 ,),

              Expanded(
                child:

                SingleChildScrollView(
                  child: Column(
                    children: [
                      orderController.orderLoader
                          ? Column(
                        children: [
                          SizedBox(
                            height: AppConfig(context).height * 0.01,
                          ),
                          getShimmerAddressEffect(context: context),
                        ],
                      )
                          : orderController.orderHistory.isEmpty
                          ? Column(
                        children: [
                          SizedBox(
                            height: AppConfig(context).height * 0.35,
                          ),
                          Center(
                            child: AppText(
                              text: "No Order Data!",
                              size: 16,
                              color: Theme.of(context).primaryColor,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ):

                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height:

                          24),
                          ListView.builder(
                              padding:  EdgeInsets.zero,
                              shrinkWrap: true,
                              primary: false,
                              itemCount: orderController.orderHistory.length,
                              itemBuilder: (BuildContext context, int index) {
                                DateTime dateTime = DateTime.parse(orderController.orderHistory[index].createdAt.toString());

                                String formattedDate = DateFormat('dd MMMM yyyy').format(dateTime);
                                String formattedTime = DateFormat('h:mm a').format(dateTime);
                                return  GestureDetector(
                                  onTap: (){
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) =>  OrderDetail(data:orderController.orderHistory[index] ,)),
                                    );
                                  },
                                  child: Container(
                                    color: Colors.transparent,
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.symmetric(horizontal: 16),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  AppText(text:"#ID-${orderController.orderHistory[index].id.toString()}",
                                                    size: 14,
                                                    fontWeight: FontWeight.w700,
                                                    color: Theme.of(context).primaryColor,
                                                  ),
                                                  Container(
                                                    decoration: BoxDecoration(
                                                        color: Color(0xffFFF9E2),
                                                        borderRadius: BorderRadius.circular(100),
                                                        border: Border.all(color: Color(0xffFEC500))
                                                    ),
                                                    child:    Padding(
                                                      padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                                                      child: AppText(text:"On Hold",
                                                        size: 12,
                                                        fontWeight: FontWeight.w600,
                                                        color: Color(0xffFEC500),
                                                      ),
                                                    ),

                                                  )
                                                ],
                                              ),
                                              SizedBox(height: 2),
                                              Row(
                                                children: [
                                                  AppText(text:"$formattedDate ",
                                                    size: 12,
                                                    fontWeight: FontWeight.w400,
                                                    color: AppLightColors.label_color,
                                                  ),
                                                  Container(
                                                    height: 3.5,
                                                    width: 3.5,
                                                    decoration: BoxDecoration(
                                                    color: AppLightColors.label_color,
                                                      shape: BoxShape.circle
                                                  ),),
                                                  AppText(text:" $formattedTime",
                                                    size: 12,
                                                    fontWeight: FontWeight.w400,
                                                    color: AppLightColors.label_color,
                                                  ),
                                                ],
                                              ),
                                              SizedBox(height: 10),
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  SizedBox(
                                                    height: 40,
                                                    child: ListView.builder(
                                                      padding: EdgeInsets.zero,
                                                      shrinkWrap: true,
                                                      scrollDirection: Axis.horizontal,
                                                      primary: false,
                                                      itemCount: orderController.orderHistory[index].products?.length,
                                                      itemBuilder: (BuildContext context, int i) {
                                                        final productCount = orderController.orderHistory[index].products?.length ?? 0;
                                                        if (productCount > 3) {
                                                          if (i < 3) {
                                                            return Padding(
                                                              padding:  EdgeInsets.only(left:i==0?0: 6),
                                                              child: Container(
                                                                height: 45,
                                                                width: 45,
                                                                decoration: BoxDecoration(
                                                                  border: Border.all(color: AppLightColors.otpLightColor),
                                                                  borderRadius: BorderRadius.circular(5),
                                                                ),
                                                                child: Center(
                                                                  child: ClipRRect(
                                                                    borderRadius: BorderRadius.circular(5),
                                                                    child: Image.network(
                                                                      (orderController.orderHistory[index].products?[i].productImage).toString(),
                                                                      height: 23,
                                                                      width: 23,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            );
                                                          } else if (i == 3) {
                                                            return Padding(
                                                              padding: const EdgeInsets.only(left: 6),
                                                              child: Container(
                                                                height: 45,
                                                                width: 45,
                                                                decoration: BoxDecoration(
                                                                  border: Border.all(color: AppLightColors.otpLightColor),
                                                                  borderRadius: BorderRadius.circular(5),
                                                                ),
                                                                child: Center(
                                                                  child: Stack(
                                                                    children: [

                                                                      Positioned(
                                                                        right: 0,
                                                                        bottom: 0,
                                                                        top: 0,
                                                                        left: 0,
                                                                        child: Container(
                                                                          height: 23,
                                                                          width: 23,

                                                                          child: Center(
                                                                            child: AppText(
                                                                              text: "+${productCount - 3}",
                                                                              size: 13,
                                                                              fontWeight: FontWeight.w600,
                                                                              color: Theme.of(context).primaryColor,
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                            );
                                                          } else {
                                                            return Container();
                                                          }
                                                        } else {
                                                          return Padding(
                                                            padding: const EdgeInsets.only(left: 6),
                                                            child: Container(
                                                              height: 45,
                                                              width: 45,
                                                              decoration: BoxDecoration(
                                                                border: Border.all(color: AppLightColors.otpLightColor),
                                                                borderRadius: BorderRadius.circular(5),
                                                              ),
                                                              child: Center(
                                                                child: Image.network(
                                                                  (orderController.orderHistory[index].products?[i].productImage).toString(),
                                                                  height: 23,
                                                                  width: 23,
                                                                ),
                                                              ),
                                                            ),
                                                          );
                                                        }
                                                      },
                                                    ),
                                                  ),



                                                  Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      AppText(text:"Total price ",
                                                        size: 12,
                                                        fontWeight: FontWeight.w400,
                                                        color: AppLightColors.label_color,
                                                      ),
                                                      SizedBox(height: 2),
                                                      AppText(text:"AED ${orderController.orderHistory[index].total.toString()}",
                                                        size: 23,
                                                        fontWeight: FontWeight.w600,
                                                        color: Theme.of(context).primaryColor,
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                        SizedBox(height: 16),
                                        themeChange.darkTheme?
                                        Divider(color:

                                        AppLightColors.black_color,height: 0 ,)
                                            :
                                        Divider(color:

                                        AppLightColors.dividerColor,height: 0 ,),
                                        SizedBox(height: 16),
                                      ],
                                    ),
                                  ),
                                );
                              }
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),


            ],
          ),
        ));
  }
}


