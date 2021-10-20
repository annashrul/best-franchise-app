
import 'package:bestfranchise/Controllers/baseController.dart';
import 'package:bestfranchise/Models/Brand/detailBrandModel.dart';
import 'package:bestfranchise/Models/Brand/productBrandModel.dart';
import 'package:bestfranchise/Models/Brand/reviewBrandModel.dart';
import 'package:flutter/cupertino.dart';

class ReviewBrandController with ChangeNotifier{
  ReviewBrandModel reviewBrandModel;
  bool isLoading=true;
  bool isLoadMore=false;
  int perPage=10;
  ScrollController controller;

  loadReviewBrand({BuildContext context,String idBrand})async{
    if(reviewBrandModel==null) isLoading=true;
    final res=await BaseController().get(url: "brand/review/$idBrand?page=1&perpage=$perPage",context: context);
    if(res["data"].length>0){
      ReviewBrandModel result = ReviewBrandModel.fromJson(res);
      reviewBrandModel = result;
    }
    else{
      reviewBrandModel=null;
    }

    isLoading=false;
    isLoadMore=false;
    notifyListeners();
  }

  void scrollListener({BuildContext context}) {
    if(!isLoading){
      if (controller.position.pixels == controller.position.maxScrollExtent) {
        if(perPage<int.parse(reviewBrandModel.pagination.total)){
          print("LOADMORE REVIEW");
          perPage+=10;
          isLoadMore=true;
          notifyListeners();
        }
      }
    }
  }

}