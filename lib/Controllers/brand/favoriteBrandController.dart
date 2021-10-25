import 'package:bestfranchise/Controllers/baseController.dart';
import 'package:bestfranchise/Helpers/general/generalHelper.dart';
import 'package:bestfranchise/Models/Brand/favoriteBrandModel.dart';
import 'package:flutter/cupertino.dart';

class FavoriteBrandController with ChangeNotifier{
  FavoriteBrandModel favoriteBrandModel;
  bool isLoading=true;
  bool isLoadMore=false;
  int perPage=10;
  ScrollController controller;
  loadData({BuildContext context})async{
    if(favoriteBrandModel==null) isLoading=true;
    final res=await BaseController().get(url: "brand/fav?page=1&perpage=$perPage",context: context);
    if(res["data"].length > 0){
      FavoriteBrandModel result = FavoriteBrandModel.fromJson(res);
      favoriteBrandModel = result;
    }
    else{
      favoriteBrandModel=null;
    }
    isLoading=false;
    isLoadMore=false;
    notifyListeners();
  }
  void scrollListener({BuildContext context}) {
    if(!isLoading){
      if (controller.position.pixels == controller.position.maxScrollExtent) {
        if(perPage<int.parse(favoriteBrandModel.pagination.total)){
          print("LOADMORE LOKASI");
          perPage+=10;
          isLoadMore=true;
          notifyListeners();
        }
      }
    }
  }
  Future create({BuildContext context,dynamic data})async{
    final res=await BaseController().post(url: "brand/fav",data: data,context: context);
    if(res!=null){
      GeneralHelper.toast(msg: res["meta"]["message"]);
    }
    notifyListeners();
  }
  Future delete({BuildContext context,dynamic id})async{
    final res=await BaseController().delete(url: "brand/fav/$id",context: context);
    if(res!=null){
      GeneralHelper.toast(msg: res["meta"]["message"]);
      loadData(context: context);
    }
    notifyListeners();
  }


}