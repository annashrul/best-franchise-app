
import 'package:bestfranchise/Controllers/baseController.dart';
import 'package:bestfranchise/Models/History/progressModel.dart';
import 'package:flutter/cupertino.dart';

class ProgressController with ChangeNotifier{
  ProgressModel progressModel;
  bool isLoading=true;
  bool isLoadMore=false;
  int perPage=10;
  ScrollController controller;



  loadData({BuildContext context,String idOrder})async{
    if(progressModel==null) isLoading=true;
    String url = "franchise/progress?franchise=$idOrder";
    final res=await BaseController().get(url: url,context: context);
    if(res["data"].length > 0){
      ProgressModel result = ProgressModel.fromJson(res);
      progressModel = result;
    }
    else{
      progressModel=null;
    }
    isLoading=false;
    isLoadMore=false;
    notifyListeners();
  }
}