
import 'package:bestfranchise/Controllers/baseController.dart';
import 'package:bestfranchise/Models/Brand/detailBrandModel.dart';
import 'package:bestfranchise/Models/Brand/franchiseModel.dart';
import 'package:bestfranchise/Models/Brand/productBrandModel.dart';
import 'package:flutter/cupertino.dart';

class FranchiseController with ChangeNotifier{
  FranchiseModel franchiseModel;
  bool isLoading=true;
  bool isLoadMore=false;
  int perPage=10;
  ScrollController controller;
  List data = [
    "Renovasi, Dekorasi & Interior",
    "Bahan Baku Awal, Perlengkapan dan Peralatan",
    "Perlengkapan Kasir & User Apps",
    "Training, Promosi & Pendampingan"
  ];


  loadFranchise({BuildContext context,String idBrand})async{
    if(franchiseModel==null) isLoading=true;
    final res=await BaseController().get(url: "type_invest?page=1&perpage=$perPage&brand=$idBrand",context: context);
    if(res["data"].length>0){
      FranchiseModel result = FranchiseModel.fromJson(res);
      franchiseModel = result;
    }
    else{
      franchiseModel=null;
    }
    isLoading=false;
    isLoadMore=false;
    notifyListeners();
  }

  void scrollListener({BuildContext context}) {
    if(!isLoading){
      if (controller.position.pixels == controller.position.maxScrollExtent) {
        if(perPage<int.parse(franchiseModel.pagination.total)){
          print("LOADMORE FRANCHISE");
          perPage+=10;
          isLoadMore=true;
          notifyListeners();
        }
      }
    }
  }

}