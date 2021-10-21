
import 'package:bestfranchise/Controllers/baseController.dart';
import 'package:bestfranchise/Models/Brand/detailBrandModel.dart';
import 'package:flutter/cupertino.dart';

class DetailBrandController with ChangeNotifier{
  int indexTabActive=0;
  DetailBrandModel detailBrandModel;
  bool isLoading=true;
  loadDetailBrand({BuildContext context,String id})async{
    final res=await BaseController().get(url: "brand/get/$id",context: context);
    DetailBrandModel result = DetailBrandModel.fromJson(res);
    detailBrandModel = result;
    isLoading=false;
    notifyListeners();
  }
  setIndexTabActive(input){
    indexTabActive=input;
    notifyListeners();
  }
}