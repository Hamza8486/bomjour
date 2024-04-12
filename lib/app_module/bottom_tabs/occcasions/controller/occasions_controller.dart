

import 'package:flutter/material.dart';

class OccasionsController extends ChangeNotifier {
  var selectTab=0;
  updateSelectedTab(val){
    selectTab=val;
    notifyListeners();
  }
}