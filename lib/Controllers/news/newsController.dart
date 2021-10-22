import 'package:bestfranchise/Controllers/baseController.dart';
import 'package:bestfranchise/Models/news/newsCatModel.dart';
import 'package:bestfranchise/Models/news/newsDetModel.dart';
import 'package:bestfranchise/Models/news/newsModel.dart';
import 'package:flutter/cupertino.dart';

class NewsController with ChangeNotifier {
  NewsModel newsModel;
  NewsDetModel newsDetModel;
  NewsCatModel newsCatModel;
  bool isLoading = true;
  bool isLoadingDet = true;
  bool isLoadingCat = true;
  int perPage = 10;
  int indexCategoryActive = 0;

  loadNews(BuildContext context, id) async {
    // var getId = '';
    print("=========== $id");
    var q = '';
    if (id != null && id != '') {
      // getId = id;
      q += "&category=$id";
    }
    if (newsModel == null) isLoading = true;

    final res = await BaseController().get(
        url: "content?page=1&perpage=$perPage&status=1" + q, context: context);
    print("############## ${res["data"].length}");
    if (res["data"].length > 0) {
      NewsModel result = NewsModel.fromJson(res);
      newsModel = result;
    } else {
      newsModel = null;
    }
    isLoading = false;
    notifyListeners();
  }

  loadNewsDet(BuildContext context, id) async {
    if (newsDetModel == null) isLoadingDet = true;
    final res =
        await BaseController().get(url: "content/get/$id", context: context);
    print("############## ${res["data"]}");
    if (!res["data"].isEmpty) {
      NewsDetModel result = NewsDetModel.fromJson(res);
      newsDetModel = result;
    } else {
      newsDetModel = null;
    }
    isLoadingDet = false;
    notifyListeners();
  }

  loadNewsCat(BuildContext context, input, id) async {
    indexCategoryActive = input;
    loadNews(context, id);
    if (newsCatModel == null) isLoadingCat = true;
    final res = await BaseController().get(
        url: "category/list/berita?page=1&perpage=$perPage&status=1",
        context: context);
    print("############## ${res["data"].length}");
    if (res["data"].length > 0) {
      NewsCatModel result = NewsCatModel.fromJson(res);
      newsCatModel = result;
    } else {
      newsCatModel = null;
    }
    isLoadingCat = false;
    notifyListeners();
  }
}
