
import 'package:bestfranchise/Controllers/baseController.dart';
import 'package:bestfranchise/Models/Brand/allLokasiBrandModel.dart';
import 'package:bestfranchise/Models/Brand/detailBrandModel.dart';
import 'package:bestfranchise/Models/Brand/franchiseModel.dart';
import 'package:bestfranchise/Models/Brand/lokasiBrandModel.dart';
import 'package:bestfranchise/Models/Brand/productBrandModel.dart';
import 'package:flutter/cupertino.dart';

class LokasiBrandController with ChangeNotifier{
  LokasiBrandModel lokasiBrandModel;
  AllLokasiBrandModel allLokasiBrandModel;
  bool isLoading=true,isLoadingAllLokasi=true;
  bool isLoadMoreAllLokasi=false;
  int perPage=5,perPageAllLokasi=10;
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
    notifyListeners();
  }

  loadAllLokasi({BuildContext context,String idBrand})async{
    if(allLokasiBrandModel==null) isLoadingAllLokasi=true;
    final res=await BaseController().get(url: "franchise?page=1&perpage=$perPageAllLokasi&brand=$idBrand",context: context);
    if(res==null){
      allLokasiBrandModel=null;
    }else if(res["data"].length > 0){
      AllLokasiBrandModel result = AllLokasiBrandModel.fromJson(res);
      allLokasiBrandModel = result;
    }
    else{
      allLokasiBrandModel=null;
    }
    isLoadingAllLokasi=false;
    isLoadMoreAllLokasi=false;
    notifyListeners();
  }
  loadMoreAllLokasi(BuildContext context,String idBrand) {
    if (perPageAllLokasi < int.parse(allLokasiBrandModel.pagination.total)) {
      isLoadMoreAllLokasi = true;
      perPageAllLokasi += 10;
      loadAllLokasi(context: context,idBrand: idBrand);
    } else {
      isLoadMoreAllLokasi = false;
    }
    notifyListeners();
  }

}