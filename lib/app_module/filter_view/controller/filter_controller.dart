import 'package:bomjour/app_module/bottom_tabs/dashboard/model/occassion_model.dart';
import 'package:bomjour/app_module/bottom_tabs/dashboard/model/search_model.dart';
import 'package:bomjour/app_module/filter_view/model/result_search_model.dart';
import 'package:bomjour/services/api_manager.dart';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';

class FilterController with ChangeNotifier {



  var selectSpecial="";
  var selectCity="";
  var selectOccasionName="";
  var selectOccasionId="";
  var selectDate="";
  var selectBudget="";
  var selectProduct="";
  var selectCat="";

  TextEditingController fromPrice = TextEditingController();
  TextEditingController toPrice = TextEditingController();

  updateProduct(val){
    selectProduct=val;
    notifyListeners();
  }


  updateCat(val){
    selectCat=val;
    notifyListeners();
  }


  updateSpecial(val){
    selectSpecial=val;
    notifyListeners();
  }

  updateCity(val){
    selectCity=val;
    notifyListeners();
  }

  updateOccName(val){
    selectOccasionName=val;
    notifyListeners();
  }
  updateOccId(val){
    selectOccasionId=val;
    notifyListeners();
  }
  updateDate(val){
    selectDate=val;
    notifyListeners();
  }
  updateBudget(val){
    selectBudget=val;
    notifyListeners();
  }

  clearFilter(){
    updateSpecial("");
    updateProduct("");
    fromPrice.clear();
    toPrice.clear();
    updateCat("");
    updateBudget("");
    updateDate("");
    updateOccId("");
    updateOccName("");
    updateCity("");

  }


  var searchList = <Products>[];
  var catList = <Categories>[];
  var  filterList = <FilterModelAllData>[];

  var  specializeList = <OccassionModel>[];





  var searchLoader = false;
  var specialLoader = false;
  var filterLoader = false;
  var occasionLoader = false;
  updateSpecialLoader(val) {
    specialLoader = val;
    notifyListeners();
  }

  updateLoader(val) {
    searchLoader = val;
    notifyListeners();
  }
  updateOccasionLoader(val) {
    occasionLoader = val;
    notifyListeners();
  }
  updateFilterLoader(val) {
    filterLoader = val;
    notifyListeners();
  }


  getSearchData({String? search}) async {
    try {
      updateLoader(true);

      var detailData = await ApiManger().getSearchModel(search:
      search==null?"":
      search.toString());
      if (detailData != null) {
        searchList.clear();
        catList.clear();
        searchList = detailData.data?.products as dynamic;
        catList = detailData.data?.categories as dynamic;
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

  var  occasionList = <OccassionModel>[];
  getAllOccasion() async {
    try {
      updateOccasionLoader(true);

      var detailData = await ApiManger().getAllOccasionModel();
      if (detailData != null) {
        occasionList.clear();
        occasionList = detailData;

        print("This is occasion Data $detailData");
      }
    } catch (e, stackTrace) {
      debugPrint("Error fetching data: $e\n$stackTrace");
      // Show an error message to the user.
    } finally {
      updateOccasionLoader(false);
    }
  }






  getAllSpecial() async {
    try {
      updateSpecialLoader(true);
      var detailData = await ApiManger().getSpecialModel();
      if (detailData != null) {

        specializeList.clear();

        specializeList = detailData as dynamic;
        updateSpecialLoader(false);
        print("This is occasion Data ${detailData}");
      }
    } catch (e, stackTrace) {
      debugPrint("Error fetching data: $e\n$stackTrace");
      updateSpecialLoader(false);
      // Show an error message to the user.
    } finally {
      updateSpecialLoader(false);
    }
  }


  getFilterData({String specialId ="",String  countryName ="", String  date ="",String occasionId ="", String  fromPrice="", String  toPrice="",
    String productName="", String  catIId="",
  }) async {
    try {
      updateFilterLoader(true);

      var detailData = await ApiManger().getSearchResultModel(specialId: specialId,
      date: date,
        occasionId: occasionId,
        fromPrice: fromPrice,
        toPrice: toPrice,
        productName: productName,
        catIId: catIId,
        countryName: countryName
      );
      if (detailData != null) {
        filterList.clear();

        filterList = detailData.response?.data as dynamic;
        print("This is product filter Data ${detailData.response?.data}");
      }
    } catch (e, stackTrace) {
      debugPrint("Error fetching data: $e\n$stackTrace");
      updateFilterLoader(false);
      // Show an error message to the user.
    } finally {
      updateFilterLoader(false);
    }
  }



}






