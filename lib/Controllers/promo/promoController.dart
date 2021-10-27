import 'package:bestfranchise/Controllers/baseController.dart';
import 'package:bestfranchise/Models/Promo/promoModel.dart';
import 'package:flutter/cupertino.dart';

class PromoController with ChangeNotifier {
  PromoModel promoModel;
  bool isLoading = true;
  bool isLoadingCat = true;
  bool isLoadMoreList = true;
  int perPage = 10;

  loadPromo({BuildContext context}) async {
    if (promoModel == null) isLoading = true;
    final res = await BaseController()
        .get(url: "promo?page=1&perpage=$perPage&status=1", context: context);
    print("############## ${res["data"].length}");
    isLoadMoreList = false;
    isLoading = false;
    if (res["data"].length > 0) {
      PromoModel result = PromoModel.fromJson(res);
      promoModel = result;
    } else {
      promoModel = null;
    }
    isLoading = false;
    notifyListeners();
  }

  loadMore(BuildContext context) {
    if (perPage < int.parse(promoModel.pagination.total)) {
      isLoadMoreList = true;
      perPage += 10;
      loadPromo(context: context);
    } else {
      isLoadMoreList = false;
    }
    notifyListeners();
  }
}
