import 'package:bestfranchise/Controllers/baseController.dart';
import 'package:bestfranchise/Models/news/newsAllModel.dart';
import 'package:bestfranchise/Models/news/newsCatModel.dart';
import 'package:bestfranchise/Models/news/newsDetModel.dart';
import 'package:bestfranchise/Models/news/newsModel.dart';
import 'package:flutter/cupertino.dart';

class NewsController with ChangeNotifier {
  NewsModel newsModel;
  NewsAllModel newsAllModel;
  NewsDetModel newsDetModel;
  NewsCatModel newsCatModel;
  bool isLoading = true;
  bool isLoadingAll = true;
  bool isLoadingDet = true;
  bool isLoadingCat = true;
  bool isLoadMoreList = true;
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

    isLoadMoreList = false;
    isLoading = false;
    if (res["data"].length > 0) {
      NewsModel result = NewsModel.fromJson(res);
      newsModel = result;
    } else {
      newsModel = null;
    }
    isLoading = false;
    notifyListeners();
  }

  loadMore(BuildContext context, id) {
    if (perPage < int.parse(newsModel.pagination.total)) {
      isLoadMoreList = true;
      perPage += 10;
      loadNews(context, id);
    } else {
      isLoadMoreList = false;
    }
    notifyListeners();
  }

  loadNewsAll(BuildContext context, id) async {
    if (newsAllModel == null) isLoadingAll = true;

    final res = await BaseController()
        .get(url: "content?page=1&perpage=$perPage&status=1", context: context);
    print("############## ${res["data"].length}");
    if (res["data"].length > 0) {
      NewsAllModel result = NewsAllModel.fromJson(res);
      newsAllModel = result;
    } else {
      newsAllModel = null;
    }
    isLoadingAll = false;
    notifyListeners();
  }

  loadNewsDet(BuildContext context, id) async {
   isLoadingDet = true;
    final res =
        await BaseController().get(url: "content/get/$id", context: context);
    print("############## ${res["data"]}");
    // if (!res["data"].isEmpty) {
    NewsDetModel result = NewsDetModel.fromJson(res);
    newsDetModel = result;
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
