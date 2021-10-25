import 'package:bestfranchise/Controllers/baseController.dart';
import 'package:bestfranchise/Models/Reward/listMutasiKomisiModel.dart';
import 'package:flutter/cupertino.dart';

class KomisiController with ChangeNotifier {
  ListMutasiKomisiModel listMutasiKomisiModel;
  bool isLoadingList = true;

  Future loadData({BuildContext context}) async {
    if (listMutasiKomisiModel == null) isLoadingList = true;
    final res = await BaseController()
        .get(url: "transaction/report/mutasi_bonus/komisi", context: context);
    if (res["data"].length > 0) {
      ListMutasiKomisiModel result = ListMutasiKomisiModel.fromJson(res);
      listMutasiKomisiModel = result;
    } else {
      listMutasiKomisiModel = null;
    }
    isLoadingList = false;
    notifyListeners();
  }
}
