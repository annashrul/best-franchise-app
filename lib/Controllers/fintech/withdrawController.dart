import 'package:bestfranchise/Controllers/baseController.dart';
import 'package:bestfranchise/Helpers/general/generalHelper.dart';
import 'package:bestfranchise/Models/withdraw/withdrawModel.dart';
import 'package:flutter/cupertino.dart';

class WithdrawController with ChangeNotifier {
  TextEditingController noRekeningController = new TextEditingController();
  TextEditingController atasNameController = new TextEditingController();
  TextEditingController bankController = new TextEditingController();
  WithdrawModel withdrawModel;
  bool isLoading = true;
  int perPage = 10;

  Future loadWithdraw({BuildContext context}) async {
    if (withdrawModel == null) isLoading = true;
    final res = await BaseController().get(
        url: "transaction/withdrawal?page=1&perpage=$perPage&status=1",
        context: context);
    print("############## ${res["data"].length}");
    if (res["data"].length > 0) {
      WithdrawModel result = WithdrawModel.fromJson(res);
      withdrawModel = result;
    } else {
      withdrawModel = null;
    }
    isLoading = false;
    notifyListeners();
  }

  Future store() async {
    if (noRekeningController.text == "") {
      return GeneralHelper.toast(msg: "No rekening tidak boleh kosong");
    }
    if (atasNameController.text == "") {
      return GeneralHelper.toast(msg: "Atas nama tidak boleh kosong");
    }
    if (bankController.text == "") {
      return GeneralHelper.toast(msg: "Bank tidak boleh kosong");
    }
    notifyListeners();
  }
}
