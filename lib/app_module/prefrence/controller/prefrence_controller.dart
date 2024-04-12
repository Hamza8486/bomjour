import 'package:bomjour/app_module/prefrence/model/my_prefrence_model.dart';
import 'package:bomjour/app_module/prefrence/model/prefrence_model.dart';
import 'package:bomjour/services/api_manager.dart';
import 'package:flutter/material.dart';

class PreferenceController extends ChangeNotifier {

var preferenceLoader = false;
var preferenceMyLoader = false;
var addPrefLoader=false;
updateAddPrefLoader(val){
  addPrefLoader=val;
  notifyListeners();
}
updateMyPrefLoader(val){
  preferenceMyLoader=val;
  notifyListeners();
}
  void updatePreferenceLoader(bool val) {
    preferenceLoader = val;
    notifyListeners();
  }


Future<void> fetchData() async {
  await getPreferenceData();

}
var preferenceList = <PreferenceModel>[];

  Future<void> getPreferenceData() async {
    try {
      updatePreferenceLoader(true);
      var profData = await ApiManger().prefrenceModel();
      if (profData != null) {
        preferenceList = profData;
        notifyListeners();

      } else {
        updatePreferenceLoader(false);
      }
    } catch (e) {
      updatePreferenceLoader(false);
      debugPrint(e.toString());
    } finally {
      updatePreferenceLoader(false);
    }
  }

var selectID = [];
updateIdsValue(var val) {
  if (selectID.contains(val)) {
    selectID.remove(val);
  } else {
    selectID.add(val);
  }
  notifyListeners();
}

var myPreferenceList = <MyPerfenceModel>[];


Future<void> getMyPreferenceData({required BuildContext context}) async {
  try {
    updateMyPrefLoader(true);
    var profData = await ApiManger.myPreferenceModel(context: context);
    if (profData != null) {
      myPreferenceList.clear();
      if ((profData.data ?? []).isEmpty) {
        selectID.clear();
      } else {
        for (int i = 0; i < (profData.data ?? []).length; i++) {
          updateIdsValue((profData.data ?? [])[i].id.toString());
        }
      }
      notifyListeners();
    } else {
      selectID.clear();
      updateMyPrefLoader(false);
    }
  } catch (e) {
    selectID.clear();
    updateMyPrefLoader(false);
    debugPrint(e.toString());
  } finally {
    updateMyPrefLoader(false);
  }
}
}