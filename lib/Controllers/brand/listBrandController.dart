import 'package:bestfranchise/Controllers/baseController.dart';
import 'package:bestfranchise/Models/Brand/brandHomeModel.dart';
import 'package:bestfranchise/Models/Brand/listBrandModel.dart';
import 'package:bestfranchise/Models/Brand/modalBrandModel.dart';
import 'package:flutter/cupertino.dart';

class ListBrandController with ChangeNotifier {
  ListBrandModel listBrandModel;
  BrandHomeModel brandHomeModel;
  ModalBrandModel modalBrandModel;
  bool isLoading = true,isLoadingHome=true,isLoadingModal=true;
  bool isLoadMore = false,isLoadMoreModal=false;
  int perPage = 10,perPageModal=10;
  String idCategoryBrand="",anySearchBrandModal="";
  String idBrand="";
  setIdBrand(input){
    idBrand=input;
    notifyListeners();
  }
  setAnySearchBrandModal(BuildContext context,input){
    anySearchBrandModal=input;
    loadBrandModal(context: context);
    notifyListeners();
  }
  setCategoryBrand(contex,input){
    idCategoryBrand=input;
    // isLoading=true;
    loadBrand(context: contex);
    notifyListeners();
  }
  Future loadBrand({BuildContext context}) async {
    if (listBrandModel == null) isLoading = true;
    String url = "brand?page=1&status=1&perpage=$perPage";
    if(idCategoryBrand!="")url+="&category=$idCategoryBrand";
    final res = await BaseController().get(url: url, context: context);
    isLoading = false;
    isLoadMore = false;
    print(res["data"].length);
    if (res["data"].length > 0) {
      ListBrandModel result = ListBrandModel.fromJson(res);
      listBrandModel = result;
      notifyListeners();
    } else {
      listBrandModel = null;
      notifyListeners();
    }
  }
  Future loadBrandHome({BuildContext context}) async {
    if (brandHomeModel == null) isLoadingHome = true;
    String url = "brand?page=1&status=1&perpage=10";
    final res = await BaseController().get(url: url, context: context);
    if (res["data"].length > 0) {
      BrandHomeModel result = BrandHomeModel.fromJson(res);
      brandHomeModel = result;
    } else {
      brandHomeModel = null;
    }
    isLoadingHome = false;
    notifyListeners();
  }
  Future loadBrandModal({BuildContext context}) async {
    if (modalBrandModel == null) isLoadingModal = true;
    String url = "brand?page=1&status=1&perpage=$perPageModal";
    if(anySearchBrandModal!="") url+="&q=$anySearchBrandModal";
    final res = await BaseController().get(url: url, context: context);
    if (res["data"].length > 0) {
      ModalBrandModel result = ModalBrandModel.fromJson(res);
      modalBrandModel = result;
    } else {
      modalBrandModel = null;
    }
    isLoadingModal = false;
    isLoadMoreModal=false;
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
  loadMoreModalBrand(BuildContext context) {
    if (perPageModal < int.parse(modalBrandModel.pagination.total)) {
      isLoadMoreModal = true;
      perPageModal += 10;
      loadBrandModal(context: context);
    } else {
      isLoadMoreModal = false;
    }
    notifyListeners();
  }

}
