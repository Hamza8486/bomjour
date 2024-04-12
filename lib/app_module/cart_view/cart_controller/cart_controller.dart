
import 'dart:convert';
import 'dart:io';

import 'package:bomjour/app_module/address/controller/address_controller.dart';
import 'package:bomjour/app_module/cart_view/model/cart_model.dart';
import 'package:bomjour/app_module/home/controller/home_controller.dart';
import 'package:bomjour/app_module/order_placed/view/order_place_view.dart';
import 'package:bomjour/services/api_manager.dart';
import 'package:bomjour/utils/app_common_widgets/helper_function.dart';
import 'package:bomjour/utils/app_constants/api_constant.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart' as dio;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

class CartController extends ChangeNotifier {
  var cartAddList = <AddProductModel>[];
  var paymentId="";
  updatePaymentId(val){
    paymentId=val;
    notifyListeners();
  }
  var wrapperId="";
  updateWrapperId(val){
    wrapperId=val;
    notifyListeners();
  }


  var qty = 1;

  updateQty(val) {
    qty = val;
    notifyListeners();
  }
  updateAddQty() {
    qty++;
    notifyListeners();
  }

  updateDecQty() {
    --qty;
    notifyListeners();
  }

  var orderLoader=false;
  updateLoader(val){
    orderLoader=val;
    notifyListeners();
  }
  double totalPrice = 0.0;
  int totalQuantity = 0;
  int calculateTotalQuantity(List<AddProductModel> cartAddList) {
    int totalQuantity = 0;
    for (var item in cartAddList) {
      int quantity = int.parse(item.quantity ?? "1"); // Default to 1 if quantity is not available
      totalQuantity += quantity;
    }
    return totalQuantity;
  }
  void updateTotalQuantity() {
    totalQuantity = calculateTotalQuantity(cartAddList);
    notifyListeners(); // Update the listeners
  }

  double calculateTotalPrice(List<AddProductModel> cartAddList) {
    double total = 0.0;
    for (var item in cartAddList) {
      double productPrice = double.parse(item.productPrice ?? "0.0");
      int quantity = int.parse(item.quantity ?? "1"); // Default to 1 if quantity is not available

      total += (productPrice * quantity);
    }
    return total;
  }

  void updateTotalPrice() {
    totalPrice = calculateTotalPrice(cartAddList);
    notifyListeners(); // Update the listeners
  }


  var addressName="";
  var addressFloor="";
  var address="";
  var addressId="";

  updateAddress(val){
    address=val;
    notifyListeners();
  }

  updateAddressName(val){
    addressName=val;
    notifyListeners();
  }
  updateAddressId(val){
    addressId=val;
    notifyListeners();
  }

  updateAddressFloor(val){
    addressFloor=val;
    notifyListeners();
  }

  clear(){
    updateAddress("");
    updateAddressFloor("");
    updateAddressName("");
    updateAddressId("");
    updateWrapperId("");
  }


  Map<String, dynamic>? paymentIntentData;

  Future<void> makePayment(
      {required String amount, required String currency,
        required List<AddProductModel> cartItems,
        String ? total,
        String ? orderStatus,
        String ? isPaid,
        String ? sameAddress,
        String ? cusId,
        String ? billingId,
        String ? wrapId,
        String ? addressId,
        required BuildContext context
      }) async {
    try {
      paymentIntentData = await createPaymentIntent(amount, currency);

      if (paymentIntentData != null) {
        // var gPay= const PaymentSheetGooglePay(
        //     merchantCountryCode: "aed",
        //     currencyCode: "aed",
        //     testEnv: true
        // );
        await Stripe.instance.initPaymentSheet(
            paymentSheetParameters: SetupPaymentSheetParameters(
                merchantDisplayName: 'Ikay',
                customerId: paymentIntentData!['customer'],
                paymentIntentClientSecret: paymentIntentData!['client_secret'],
                customerEphemeralKeySecret: paymentIntentData!['ephemeralKey'],

            ));

        print(paymentIntentData);

        displayPaymentSheet(totalFee: amount,
            context: context,
            cartItems: cartItems,
            total: total,
            orderStatus: orderStatus,
            isPaid: isPaid,
            sameAddress: sameAddress,
            cusId: cusId,
            billingId: billingId,
            wrapId: wrapId,
            addressId: addressId
        );

      }
    } catch (e, s) {
      print('exception:$e$s');
    }
  }


  displayPaymentSheet({totalFee,
    required List<AddProductModel> cartItems,
    String ? total,
    String ? orderStatus,
    String ? isPaid,
    String ? sameAddress,
    String ? cusId,
    String ? billingId,
    String ? wrapId,
    String ? addressId,
    required BuildContext context
  }) async {
    try {
      updateLoader(false);
      await Stripe.instance.presentPaymentSheet().then((value) {
        paymentIntentData = null;
        print("This is value");
        print(paymentId.toString());

        updateLoader(true);
        ApiManger().orderPlaceData(context: context,
        cartItems: cartItems,
          total: total,
          orderStatus: orderStatus,
          isPaid: isPaid,
          sameAddress: sameAddress,
          cusId: cusId,
          billingId: billingId,
          wrapId: wrapId,
          addressId: addressId
        );



      }).onError((error, stackTrace) {
        flutterToast(msg: 'Payment Declined');
        updateLoader(false);
        print("Payment Declined");
        throw Exception(error);

      });
    } on StripeException catch (e) {
      flutterToast(msg: 'Payment Declined');
      updateLoader(false);
      print("Payment Declined");
      print('Error is:---> $e');

    } catch (e) {
      print('$e');
    }
  }

  //  Future<Map<String, dynamic>>
  createPaymentIntent(String amount, String currency) async {
    try {
      Map<String, dynamic> body = {
        'amount': calculateAmount(amount),
        'currency': currency,
        'payment_method_types[]': 'card'
      };
      var response = await http.post(
          Uri.parse('https://api.stripe.com/v1/payment_intents'),
          body: body,
          headers: {
            'Authorization':
            'Bearer ${dotenv.env['STRIPE_SECRET']}',
            'Content-Type': 'application/x-www-form-urlencoded'
          });
      print(response.body);
      if(response.statusCode==200){
        var jsonString=jsonDecode(response.body);

        print("This is respnonse");
        print(jsonString["id"].toString());
        updatePaymentId(jsonString["id"].toString());
        print(response.body);
        updateLoader(false);

        return jsonDecode(response.body);

      }
      else{
        updateLoader(false);
        return jsonDecode(response.body);
      }


    } catch (err) {
      updateLoader(false);
      print('err charging user: ${err.toString()}');
    }
  }

  calculateAmount(String amount) {
    final a = (int.parse(amount)) * 100;
    print(a);
    return a.toString();
  }

}

