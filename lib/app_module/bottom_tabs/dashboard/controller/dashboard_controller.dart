import 'package:bomjour/app_module/bottom_tabs/dashboard/model/business_model.dart';
import 'package:bomjour/app_module/bottom_tabs/dashboard/model/cateegory_model.dart';
import 'package:bomjour/app_module/bottom_tabs/dashboard/model/customize_model.dart';
import 'package:bomjour/app_module/bottom_tabs/dashboard/model/product_model.dart';
import 'package:bomjour/services/api_manager.dart';
import 'package:flutter/material.dart';

class DashboardController with ChangeNotifier {



  var categoryLoader = false;
  var businessLoader = false;
  var customizeLoader = false;
  var productsLoader = false;
  void updateCatLoader(bool val) {
    categoryLoader = val;
    notifyListeners();
  }
  void updateProductLoader(bool val) {
    productsLoader = val;
    notifyListeners();
  }
  void updateBusinessLoader(bool val) {
    businessLoader = val;
    notifyListeners();
  }
  void updateCustomizeLoader(bool val) {
    customizeLoader = val;
    notifyListeners();
  }

  var categoryList = <CategoryModel>[];
  var businessList = <BusinessModel>[];
  var customizeList = <CustomizeModel>[];
  var productsList = <ProductData>[];

  Future<void> fetchData() async {
    await getCategoryData();
    await getProductData();
    await getCustomizeData();
    await getBusinessData();


  }

  Future<void> getCategoryData() async {
    try {
      updateCatLoader(true);
      var profData = await ApiManger().categoryModel();
      if (profData != null) {
        categoryList = profData;
        notifyListeners();

      } else {
        updateCatLoader(false);
      }
    } catch (e) {
      updateCatLoader(false);
      debugPrint(e.toString());
    } finally {
      updateCatLoader(false);
    }
  }

  Future<void> getBusinessData() async {
    try {
      updateBusinessLoader(true);
      var profData = await ApiManger().businessModel();
      if (profData != null) {
        businessList = profData;
        notifyListeners();

      } else {
        updateBusinessLoader(false);
      }
    } catch (e) {
      updateBusinessLoader(false);
      debugPrint(e.toString());
    } finally {
      updateBusinessLoader(false);
    }
  }


  Future<void> getCustomizeData() async {
    try {
      updateCustomizeLoader(true);
      var profData = await ApiManger().customizeModel();
      if (profData != null) {
        customizeList = profData;
        notifyListeners();

      } else {
        updateCustomizeLoader(false);
      }
    } catch (e) {
      updateCustomizeLoader(false);
      debugPrint(e.toString());
    } finally {
      updateCustomizeLoader(false);
    }
  }


  Future<void> getProductData() async {
    try {
      updateProductLoader(true);
      var profData = await ApiManger.productModel();
      if (profData != null) {
        productsList = profData.response?.data as List<ProductData>;
        notifyListeners();

      } else {
        updateProductLoader(false);
      }
    } catch (e) {
      updateProductLoader(false);
      debugPrint(e.toString());
    } finally {
      updateProductLoader(false);
    }
  }

}