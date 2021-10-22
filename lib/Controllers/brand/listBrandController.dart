import 'package:bestfranchise/Controllers/baseController.dart';
import 'package:bestfranchise/Models/Brand/listBrandModel.dart';
import 'package:flutter/cupertino.dart';

class ListBrandController with ChangeNotifier {
  ListBrandModel listBrandModel;
  bool isLoading = true;
  bool isLoadMore = false;
  int perPage = 10;
  String idCategoryBrand="";
  setCategoryBrand(contex,input){
    idCategoryBrand=input;
    isLoading=true;
    loadBrand(context: contex);
    notifyListeners();
  }

  Future loadBrand({BuildContext context}) async {
    if (listBrandModel == null) isLoading = true;
    String url = "brand?page=1&status=1&perpage=$perPage";
    if(idCategoryBrand!=""){
      url+="&category=$idCategoryBrand";
    }
    final res = await BaseController().get(url: url, context: context);
    if (res["data"].length > 0) {
      ListBrandModel result = ListBrandModel.fromJson(res);
      listBrandModel = result;
    } else {
      listBrandModel = null;
    }
    isLoading = false;
    isLoadMore = false;
    notifyListeners();
  }

  loadMoreBrand(BuildContext context) {
    if (perPage < int.parse(listBrandModel.pagination.total)) {
      isLoadMore = true;
      perPage += 10;
      loadBrand(context: context);
    } else {
      isLoadMore = false;
    }
    notifyListeners();
  }
}
