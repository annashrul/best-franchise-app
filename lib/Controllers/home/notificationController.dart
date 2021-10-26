
import 'package:bestfranchise/Controllers/baseController.dart';
import 'package:bestfranchise/Helpers/general/generalHelper.dart';
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
  DateTime dateFrom=DateTime.now(),dateTo=DateTime.now();
  setDate({BuildContext context, input}){
    dateFrom = input["from"];
    dateTo = input["to"];
    isLoading=true;
    loadData(context: context);
    notifyListeners();
  }

  loadData({BuildContext context})async{
    if(notificationModel==null) isLoading=true;
    final res=await BaseController().get(url: "notification?page=1&perpage=$perPage&datefrom=${GeneralHelper.convertDateToYMD(dateFrom)}&dateto=${GeneralHelper.convertDateToYMD(dateTo)}",context: context);
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

  loadMore(BuildContext context) {
    print("loadmore");
    if (perPage < int.parse(notificationModel.pagination.total)) {
      isLoadMore = true;
      perPage += 10;
      loadData(context: context);
    } else {
      isLoadMore = false;
    }
    notifyListeners();
  }

}