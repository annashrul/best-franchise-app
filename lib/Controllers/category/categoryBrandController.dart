
import 'package:bestfranchise/Controllers/baseController.dart';
import 'package:bestfranchise/Models/Brand/detailBrandModel.dart';
import 'package:bestfranchise/Models/Brand/franchiseModel.dart';
import 'package:bestfranchise/Models/Brand/productBrandModel.dart';
import 'package:bestfranchise/Models/Category/categoryBrandModel.dart';
import 'package:flutter/cupertino.dart';

class CategoryBrandController with ChangeNotifier{
  CategoryBrandModel categoryBrandModel;
  bool isLoading=true;
  int perPage=10;


  Future loadCategoryBrand({BuildContext context})async{
    if(categoryBrandModel==null) isLoading=true;
    final res=await BaseController().get(url: "category/list/brand?page=1&perpage=$perPage&status=1",context: context);
    print("############## ${res["data"].length}");
    if(res["data"].length > 0){
      CategoryBrandModel result = CategoryBrandModel.fromJson(res);
      categoryBrandModel = result;
    }
    else{
      categoryBrandModel=null;
    }
    isLoading=false;
    notifyListeners();
  }



}