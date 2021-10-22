
import 'package:bestfranchise/Controllers/baseController.dart';
import 'package:bestfranchise/Models/Brand/franchiseModel.dart';
import 'package:flutter/cupertino.dart';

class FranchiseController with ChangeNotifier{
  FranchiseModel franchiseModel;
  bool isLoading=true;
  bool isLoadMore=false;
  int perPage=10;
  ScrollController controller;
  bool isList=true;
  setList(input){
    isList=input;
    notifyListeners();
  }

  loadFranchise({BuildContext context,String idBrand})async{
    String url = "type_invest?brand=$idBrand";
    if(isList){
      url+="&page=1&perpage=$perPage";
    }
    if(franchiseModel==null) isLoading=true;

    final res=await BaseController().get(url: url,context: context);
    if(res["data"].length > 0){
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