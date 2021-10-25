import 'package:bestfranchise/Controllers/baseController.dart';
import 'package:bestfranchise/Models/Reward/listMutasiRoyaltiModel.dart';
import 'package:flutter/cupertino.dart';

class RoyaltiController with ChangeNotifier{
  ListMutasiRoyaltiModel listMutasiRoyaltiModel;
  bool isLoadingList=true;
  bool isLoadMoreList=false;
  int perPage=10;
  Future loadData({BuildContext context})async{
    if(listMutasiRoyaltiModel==null)isLoadingList=true;
    final res=await BaseController().get(url: "transaction/report/mutasi_bonus/royalti?perpage=$perPage",context: context);
    if(res["data"].length>0){
      ListMutasiRoyaltiModel result=ListMutasiRoyaltiModel.fromJson(res);
      listMutasiRoyaltiModel=result;
    }else{
      listMutasiRoyaltiModel=null;
    }
    isLoadMoreList=false;
    isLoadingList=false;
    notifyListeners();
  }
  loadMore(BuildContext context) {
    if (perPage < int.parse(listMutasiRoyaltiModel.pagination.total)) {
      isLoadMoreList = true;
      perPage += 10;
      loadData(context: context);
    } else {
      isLoadMoreList = false;
    }
    notifyListeners();
  }
}