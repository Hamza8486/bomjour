
import 'package:bomjour/app_module/bottom_tabs/profile/component/wishlist/model/wishlist_model.dart';
import 'package:bomjour/services/api_manager.dart';

import 'package:flutter/material.dart';



class WishlistController with ChangeNotifier {

  var wishLoader = false;


  updateWish(val){
    wishLoader=val;
    notifyListeners();
  }



  var  wishListData = <WishListModelAllData>[];

  getWishDataAll({String id="",bool isLoading =true,String token=""}) async {
    try {
      if(isLoading){
        updateWish(true);
      }
      else{
        updateWish(false);
      }


      var detailData = await ApiManger().getWishlistModel(id: id,token: token);
      if (detailData != null) {
        wishListData.clear();
        wishListData = detailData.response?.data as dynamic;

        print("This is wish Data $detailData");
      }
    } catch (e, stackTrace) {
      updateWish(false);
      debugPrint("Error fetching data: $e\n$stackTrace");
      // Show an error message to the user.
    } finally {
      updateWish(false);
    }
  }


}






