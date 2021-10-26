
import 'package:bestfranchise/Controllers/baseController.dart';
import 'package:bestfranchise/Controllers/user/userController.dart';
import 'package:bestfranchise/Databases/tableDatabase.dart';
import 'package:bestfranchise/Models/History/statusOrderModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class StatusOrderController with ChangeNotifier{
  StatusOrderModel statusOrderModel;
  bool isLoading=true;
  bool isLoadMore=false;
  int perPage=10;
  ScrollController controller;
  int indexDetailOrder;

  setIndexDetailOrder(input){
    indexDetailOrder=input;
    notifyListeners();
  }

  loadStatusOrder({BuildContext context})async{
    if(statusOrderModel==null) isLoading=true;
    final user = Provider.of<UserController>(context, listen: false);
    print(user.dataUser);
    String url = "franchise?page=1&perpage=$perPage&member=${user.dataUser[UserTable.idUser]}";
    final res=await BaseController().get(url: url,context: context);
    print(res["data"].length);
    if(res["data"].length > 0){
      StatusOrderModel result = StatusOrderModel.fromJson(res);
      statusOrderModel = result;
    }
    else{
      statusOrderModel=null;
    }
    isLoading=false;
    isLoadMore=false;
    notifyListeners();
  }

  loadMore(BuildContext context) {
    print("loadmore");
    if (perPage < int.parse(statusOrderModel.pagination.total)) {
      isLoadMore = true;
      perPage += 10;
      loadStatusOrder(context: context);
    } else {
      isLoadMore = false;
    }
    notifyListeners();
  }



}