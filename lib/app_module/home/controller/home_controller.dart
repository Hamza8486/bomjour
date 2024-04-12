

  import 'package:bomjour/app_module/bottom_tabs/profile/model/profile_model.dart';
import 'package:bomjour/services/api_manager.dart';
import 'package:bomjour/utils/app_common_widgets/helper_function.dart';
import 'package:flutter/material.dart';

class HomeController extends ChangeNotifier {

  var token = "";
  var email = "";
  var id = "";
  var name = "";

  updateToken(val){
    token=val;
    notifyListeners();
  }
  updateName(val){
    name=val;
    notifyListeners();
  }
  updateEmail(val){
    email=val;
    notifyListeners();
  }
  updateId(val){
    id=val;
    notifyListeners();
  }
  Future<void> fetchProfileData({required BuildContext context}) async {
    await getProfileData(context: context);
  }

  Future<void> fetchData({required BuildContext context}) async {
    HelperFunctions.getFromPreference("name").then((value) {
      name = value;
      print(name.toString());
      notifyListeners();
    });
    HelperFunctions.getFromPreference("email").then((value) {
      email = value;
      print(email.toString());

      notifyListeners();
    });
    HelperFunctions.getFromPreference("token").then((value) {
      token = value;
      print(token.toString());
      fetchProfileData(context:context );
      notifyListeners();
    });
    HelperFunctions.getFromPreference("id").then((value) {
      id = value;
      print(id.toString());
      notifyListeners();
    });
  }


  void updateProfileLoader(bool val) {
    profileLoader = val;
    notifyListeners();
  }
  var profileLoader = false;

  GetProfileModel ? getProfileModel ;
  Future<void> getProfileData({required BuildContext context}) async {
    try {
      updateProfileLoader(true);
      var profData = await ApiManger.profileModel(context: context);
      if (profData != null) {
        getProfileModel = profData;
        notifyListeners();

      } else {
        updateProfileLoader(false);
      }
    } catch (e) {
      updateProfileLoader(false);
      debugPrint(e.toString());
    } finally {
      updateProfileLoader(false);
    }
  }


}