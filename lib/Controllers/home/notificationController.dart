
import 'package:bestfranchise/Controllers/baseController.dart';
import 'package:bestfranchise/Models/Brand/detailBrandModel.dart';
import 'package:bestfranchise/Models/Brand/franchiseModel.dart';
import 'package:bestfranchise/Models/Brand/productBrandModel.dart';
import 'package:bestfranchise/Models/Notification/notificationModel.dart';
import 'package:flutter/cupertino.dart';

class NotificationController with ChangeNotifier{
  NotificationModel notificationModel;
  bool isLoading=true;
  bool isLoadMore=false;
  int perPage=10;
  ScrollController controller;


  loadData({BuildContext context})async{
    if(notificationModel==null) isLoading=true;
    final res=await BaseController().get(url: "notification?page=1&perpage=$perPage",context: context);
    print("############## ${res["data"].length}");
    if(res["data"].length > 0){
      NotificationModel result = NotificationModel.fromJson(res);
      notificationModel = result;
    }
    else{
      notificationModel=null;
    }
    isLoading=false;
    isLoadMore=false;
    notifyListeners();
  }

  void scrollListener({BuildContext context}) {
    if(!isLoading){
      if (controller.position.pixels == controller.position.maxScrollExtent) {
        if(perPage<int.parse(notificationModel.pagination.total)){
          print("LOADMORE FRANCHISE");
          perPage+=10;
          isLoadMore=true;
          notifyListeners();
        }
      }
    }
  }

}