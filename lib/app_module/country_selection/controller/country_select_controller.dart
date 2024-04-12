import 'package:bomjour/app_module/country_selection/model/city_model.dart';
import 'package:bomjour/app_module/country_selection/model/country_model.dart';
import 'package:bomjour/services/api_manager.dart';
import 'package:flutter/material.dart';

class CountrySelectionController extends ChangeNotifier {
  var countryLoader = false;
  var topCityLoader = false;
  var cityIdLoader = false;
  var countryList = <CountryModel>[];
  var topCityList = <CityModel>[];
  var getCityIdList = <CityModel>[];


  Future<void> fetchData() async {
    await getCountryModelData();
    await getTopCityModelData();
  }

  Future<void> getCountryModelData() async {
    try {
      updateCountryLoader(true);
      var profData = await ApiManger().getCountryModel();
      if (profData != null) {
        countryList.clear();
        countryList = profData;
        notifyListeners();

      } else {
        updateCountryLoader(false);
      }
    } catch (e) {
      updateCountryLoader(false);
      debugPrint(e.toString());
    } finally {
      updateCountryLoader(false);
    }
  }

  Future<void> getTopCityModelData() async {
    try {
      updateTopCityLoader(true);
      var profData = await ApiManger().topCityModel();
      if (profData != null) {
        topCityList.clear();
        topCityList = profData;
        notifyListeners();

      } else {
        updateTopCityLoader(false);
      }
    } catch (e) {
      updateTopCityLoader(false);
      debugPrint(e.toString());
    } finally {
      updateTopCityLoader(false);
    }
  }


  Future<void> getCityByIdModel({String id=""}) async {
    try {
      updateCityIdLoader(true);
      var profData = await ApiManger().getCityIdModel(id: id);
      if (profData != null) {
        getCityIdList.clear();
        getCityIdList = profData;
        notifyListeners();

      } else {
        updateCityIdLoader(false);
      }
    } catch (e) {
      updateCityIdLoader(false);
      debugPrint(e.toString());
    } finally {
      updateCityIdLoader(false);
    }
  }



  void updateCountryLoader(bool val) {
    countryLoader = val;
    notifyListeners();
  }
  void updateTopCityLoader(bool val) {
    topCityLoader = val;
    notifyListeners();
  }
  void updateCityIdLoader(bool val) {
    cityIdLoader = val;
    notifyListeners();
  }

  var selectCityId="";
  updateCityId(val){
    selectCityId=val;
    notifyListeners();
  }
  var searchQuery = '';
  updateSearchQuery(val){
    searchQuery=val;
    notifyListeners();
  }

}
