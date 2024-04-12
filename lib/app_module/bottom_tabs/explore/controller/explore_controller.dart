

import 'package:flutter/material.dart';

class ExploreController extends ChangeNotifier {
  var selectId=0;
  updateSelectedId(val){
    selectId=val;
    notifyListeners();
  }
}