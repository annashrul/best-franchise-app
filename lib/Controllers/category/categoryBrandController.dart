
import 'package:bestfranchise/Controllers/baseController.dart';
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
      categoryBrandModel.data.insert(0,Datum(records: "0",id: "",title: "Semua",type: 0,status: 1,icon: "",createdAt: null,updatedAt: null));


    }
    else{
      categoryBrandModel=null;
    }
    isLoading=false;
    notifyListeners();
  }



}