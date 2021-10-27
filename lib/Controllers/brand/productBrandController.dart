
import 'package:bestfranchise/Controllers/baseController.dart';
import 'package:bestfranchise/Controllers/brand/detailBrandController.dart';
import 'package:bestfranchise/Controllers/brand/listBrandController.dart';
import 'package:bestfranchise/Models/Brand/detailBrandModel.dart';
import 'package:bestfranchise/Models/Brand/productBrandModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class ProductBrandController with ChangeNotifier{
  ProductBrandModel productBrandModel;
  bool isLoading=true;
  bool isLoadMore=false;
  int perPage=6;
  ScrollController controller;
  loadProductBrand({BuildContext context})async{
    final brand = Provider.of<ListBrandController>(context,listen: false);
    if(productBrandModel==null) isLoading=true;
    final res=await BaseController().get(url: "product?page=1&perpage=$perPage&status=1&brand=${brand.idBrand}",context: context);
    print(res);
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

  loadMoreProductBrand(BuildContext context) {
    if(productBrandModel!=null){
      if (perPage < int.parse(productBrandModel.pagination.total)) {
        isLoadMore = true;
        perPage += 10;
        loadProductBrand(context: context);
      } else {
        isLoadMore = false;
      }
    }
    notifyListeners();
  }

}