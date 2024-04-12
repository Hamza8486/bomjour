import 'package:flutter/material.dart';

class CardController with ChangeNotifier {

  var cardLoader = false;
  List paymentCardList = [{"image":"assets/icons/master.png"},
    {"image":"assets/icons/visa.png"}
  ];

  int indexSelect=-1;

  updateSelectedPayment(val){
    indexSelect=val;
    notifyListeners();
  }

  var cardList = [];

}