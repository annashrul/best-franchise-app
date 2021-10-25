import 'package:bestfranchise/Controllers/baseController.dart';
import 'package:bestfranchise/Models/Reward/listMutasiKomisiModel.dart';
import 'package:flutter/cupertino.dart';

class KomisiController with ChangeNotifier {
  ListMutasiKomisiModel listMutasiKomisiModel;
  bool isLoadingList = true;
  bool isLoadMoreList = false;
  int perPage = 10;
  Future loadData({BuildContext context}) async {
    if (listMutasiKomisiModel == null) isLoadingList = true;
    final res = await BaseController().get(
        url: "transaction/report/mutasi_bonus/komisi?perpage=$perPage",
        context: context);
    if (res["data"].length > 0) {
      ListMutasiKomisiModel result = ListMutasiKomisiModel.fromJson(res);
      listMutasiKomisiModel = result;
    } else {
      listMutasiKomisiModel = null;
    }
    isLoadMoreList = false;
    isLoadingList = false;
    notifyListeners();
  }

  loadMore(BuildContext context) {
    if (perPage < int.parse(listMutasiKomisiModel.pagination.total)) {
      isLoadMoreList = true;
      perPage += 10;
      loadData(context: context);
    } else {
      isLoadMoreList = false;
    }
    notifyListeners();
  }
}
