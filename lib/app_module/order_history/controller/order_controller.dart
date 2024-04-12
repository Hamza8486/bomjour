import 'package:bomjour/app_module/order_history/model/order_history_model.dart';
import 'package:bomjour/services/api_manager.dart';



import 'package:flutter/material.dart';

class OrderController with ChangeNotifier {


  var orderHistory = <OrderHistoryAllData>[];




  var orderLoader = false;

  updateOrderLoader(val) {
    orderLoader = val;
    notifyListeners();
  }

  getOrderData({required BuildContext context}) async {
    try {
      updateOrderLoader(true);

      var detailData = await ApiManger().getOrderModel(context:context);
      if (detailData != null) {
        orderHistory = detailData.response?.data as dynamic;
        print("This is Order detail Data ${detailData.response?.data}");
      }
    } catch (e, stackTrace) {
      debugPrint("Error fetching data: $e\n$stackTrace");
      updateOrderLoader(false);
      // Show an error message to the user.
    } finally {
      updateOrderLoader(false);
    }
  }


}

