
import 'package:flutter/cupertino.dart';

class ListNewsController with ChangeNotifier{
  int indexCategoryActive=0;
  setIndexCategoryActive(input){
    indexCategoryActive=input;
    notifyListeners();
  }




}