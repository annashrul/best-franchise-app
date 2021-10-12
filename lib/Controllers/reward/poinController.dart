
import 'package:flutter/cupertino.dart';

class PoinController with ChangeNotifier{
  int indexActive=0;
  setIndexActive(input){
    indexActive=input;
    notifyListeners();
  }

}