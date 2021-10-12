
import 'package:flutter/cupertino.dart';

class DetailBrandController with ChangeNotifier{
  int indexTabActive=0;
  setIndexTabActive(input){
    indexTabActive=input;
    notifyListeners();
  }
}