
import 'package:bomjour/app_module/address/model/get_address_model.dart';
import 'package:bomjour/app_module/address/model/property_type_model.dart';
import 'package:bomjour/services/api_manager.dart';
import 'package:flutter/material.dart';



class AddressController with ChangeNotifier {

  var propertyLoader = false;
  var addressLoader = false;
  var addAddressCon = false;

  updateAddAddress(val){
    addAddressCon=val;
    notifyListeners();
  }

  var addressCon =  TextEditingController();

  updatePropertyLoader(val) {
    propertyLoader = val;
    notifyListeners();
  }
  updateAddressLoader(val) {
    addressLoader = val;
    notifyListeners();
  }

  var lat="";
  var lng="";

  updateLat(val){
    lat=val;
    notifyListeners();
  }
  updateLng(val){
    lng=val;
    notifyListeners();
  }


  var  propertyList = <PropertyAllModel>[];
  var  addressList = <AddressModelAllData>[];
  getPropertyTypes() async {
    try {
      updatePropertyLoader(true);

      var detailData = await ApiManger().getPropertyModel();
      if (detailData != null) {
        propertyList.clear();
        propertyList = detailData.data as dynamic;
        notifyListeners();

        print("This is occasion Data $detailData");
      }
    } catch (e, stackTrace) {
      debugPrint("Error fetching data: $e\n$stackTrace");
      // Show an error message to the user.
    } finally {
      updatePropertyLoader(false);
    }
  }
  getAllAddress({String id="",bool isLoading =true,String token=""}) async {
    try {
      if(isLoading){
        updateAddressLoader(true);
      }
      else{
        updateAddressLoader(false);
      }


      var detailData = await ApiManger().getAddressModel(id: id,token: token);
      if (detailData != null) {
        addressList.clear();
        addressList = detailData.response?.data as dynamic;
        notifyListeners();

        print("This is address Data $detailData");
      }
    } catch (e, stackTrace) {
      updateAddressLoader(false);
      debugPrint("Error fetching data: $e\n$stackTrace");
      // Show an error message to the user.
    } finally {
      updateAddressLoader(false);
    }
  }



}



