import 'package:bomjour/app_module/product_detail_page/model/similar_product_model.dart';
import 'package:bomjour/app_module/product_detail_page/model/wrapper_model.dart';
import 'package:bomjour/services/api_manager.dart';



import 'package:bomjour/app_module/product_detail_page/model/product_detail_model.dart';
import 'package:flutter/material.dart';

class ProductDetailController with ChangeNotifier {
  ProductDetailData? productDetailList;

  var wrapperList = <AllWrapperData>[];
  var similarProductLit = <AllSimilarPrroductModel>[];
  var similarLoader = false;
  updateSimilarLoader(val){
    similarLoader=val;
    notifyListeners();
  }


  List<AllWrapperData> originalWrapperData = <AllWrapperData>[];


  void filterWrapData(String query) {
    if (query.isEmpty) {
      wrapperList = originalWrapperData;
    } else {
      wrapperList = originalWrapperData
          .where((nameData) =>
          nameData.title!.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
  }




  var productDetailLoader = false;
  var wrapperLoader = false;
  updateLoader(val) {
    productDetailLoader = val;
    notifyListeners();
  }
  updateWrapperLoader(val) {
    wrapperLoader = val;
    notifyListeners();
  }

  getProductDetailData({String? id,required BuildContext context}) async {
    try {
      updateLoader(true);

      var detailData = await ApiManger().productDetailModel(id: id.toString(),context:context);
      if (detailData != null) {
        productDetailList = detailData.data as dynamic;
        print("This is product detail Data ${detailData.data}");
      }
    } catch (e, stackTrace) {
      debugPrint("Error fetching data: $e\n$stackTrace");
      updateLoader(false);
      // Show an error message to the user.
    } finally {
      updateLoader(false);
    }
  }


  getWrapperData() async {
    try {
      updateWrapperLoader(true);

      var detailData = await ApiManger().getAllWrapperModel();
      if (detailData != null) {
        originalWrapperData =
        detailData.data as dynamic;
        wrapperList = originalWrapperData;
        print("This is wrapper Data ${detailData.data}");
      }
    } catch (e, stackTrace) {
      debugPrint("Error fetching data: $e\n$stackTrace");
      updateWrapperLoader(false);
      // Show an error message to the user.
    } finally {
      updateWrapperLoader(false);
    }
  }


  getSimilarData({required BuildContext context,String id=""}) async {
    try {
      updateSimilarLoader(true);

      var detailData = await ApiManger().getProductSimilarModel(context: context,id: id);
      if (detailData != null) {
        similarProductLit = detailData.data as dynamic;
        print("This is similar Data ${detailData.data}");
      }
    } catch (e, stackTrace) {
      debugPrint("Error fetching data: $e\n$stackTrace");
      updateSimilarLoader(false);
      // Show an error message to the user.
    } finally {
      updateSimilarLoader(false);
    }
  }
}

