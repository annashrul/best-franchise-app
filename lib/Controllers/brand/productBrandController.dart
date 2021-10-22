
import 'package:bestfranchise/Controllers/baseController.dart';
import 'package:bestfranchise/Models/Brand/detailBrandModel.dart';
import 'package:bestfranchise/Models/Brand/productBrandModel.dart';
import 'package:flutter/cupertino.dart';

class ProductBrandController with ChangeNotifier{
  ProductBrandModel productBrandModel;
  bool isLoading=true;
  bool isLoadMore=false;
  int perPage=10;
  ScrollController controller;

  loadProductBrand({BuildContext context,String idBrand})async{
    if(productBrandModel==null) isLoading=true;
    final res=await BaseController().get(url: "product?page=1&perpage=$perPage&status=1&brand=$idBrand",context: context);
    if(res["data"].length>0){
      ProductBrandModel result = ProductBrandModel.fromJson(res);
      productBrandModel = result;
    }
    else{
      productBrandModel=null;
    }

    isLoading=false;
    isLoadMore=false;
    notifyListeners();
  }

  void scrollListener({BuildContext context}) {
    if(!isLoading){
      if (controller.position.pixels == controller.position.maxScrollExtent) {
        if(perPage<int.parse(productBrandModel.pagination.total)){
          print("LOADMORE PRODUK");
          perPage+=10;
          isLoadMore=true;
          notifyListeners();
        }
      }
    }
  }

}