
import 'package:bestfranchise/Controllers/baseController.dart';
import 'package:bestfranchise/Models/Brand/allReviewBrandModel.dart';
import 'package:bestfranchise/Models/Brand/detailBrandModel.dart';
import 'package:bestfranchise/Models/Brand/productBrandModel.dart';
import 'package:bestfranchise/Models/Brand/reviewBrandModel.dart';
import 'package:flutter/cupertino.dart';

class ReviewBrandController with ChangeNotifier{
  ReviewBrandModel reviewBrandModel;
  AllReviewBrandModel allReviewBrandModel;
  bool isLoading=true,isLoadingAllReviewBrand=true;
  bool isLoadMoreAllReviewBrand=false;
  int perPage=5,perPageAllReviewBrand=10;

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
    notifyListeners();
  }
  loadAllReviewBrand({BuildContext context,String idBrand})async{
    if(allReviewBrandModel==null) isLoadingAllReviewBrand=true;
    final res=await BaseController().get(url: "brand/review/$idBrand?page=1&perpage=$perPageAllReviewBrand",context: context);
    if(res["data"].length>0){
      AllReviewBrandModel result = AllReviewBrandModel.fromJson(res);
      allReviewBrandModel = result;
    }
    else{
      allReviewBrandModel=null;
    }
    isLoadingAllReviewBrand=false;
    isLoadMoreAllReviewBrand=false;
    notifyListeners();
  }
  loadMoreAllReviewBrand(BuildContext context,String idBrand) {
    if (perPageAllReviewBrand < int.parse(allReviewBrandModel.pagination.total)) {
      isLoadMoreAllReviewBrand = true;
      perPageAllReviewBrand += 10;
      loadAllReviewBrand(context: context,idBrand: idBrand);
    } else {
      isLoadMoreAllReviewBrand = false;
    }
    notifyListeners();
  }



}