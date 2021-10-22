
import 'package:bestfranchise/Controllers/baseController.dart';
import 'package:bestfranchise/Models/Brand/detailBrandModel.dart';
import 'package:bestfranchise/Models/Brand/franchiseModel.dart';
import 'package:bestfranchise/Models/Brand/lokasiBrandModel.dart';
import 'package:bestfranchise/Models/Brand/productBrandModel.dart';
import 'package:flutter/cupertino.dart';

class LokasiBrandController with ChangeNotifier{
  LokasiBrandModel lokasiBrandModel;
  bool isLoading=true;
  bool isLoadMore=false;
  int perPage=10;
  ScrollController controller;


  loadLokasi({BuildContext context,String idBrand})async{
    if(lokasiBrandModel==null) isLoading=true;
    final res=await BaseController().get(url: "franchise?page=1&perpage=$perPage&brand=$idBrand",context: context);
    if(res==null){
      lokasiBrandModel=null;
    }else if(res["data"].length > 0){
      LokasiBrandModel result = LokasiBrandModel.fromJson(res);
      lokasiBrandModel = result;
    }
    else{
      lokasiBrandModel=null;
    }
    isLoading=false;
    isLoadMore=false;
    notifyListeners();
  }

  void scrollListener({BuildContext context}) {
    if(!isLoading){
      if (controller.position.pixels == controller.position.maxScrollExtent) {
        if(perPage<int.parse(lokasiBrandModel.pagination.total)){
          print("LOADMORE LOKASI");
          perPage+=10;
          isLoadMore=true;
          notifyListeners();
        }
      }
    }
  }

}