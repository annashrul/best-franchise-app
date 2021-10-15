import 'package:bestfranchise/Helpers/general/generalHelper.dart';
import 'package:flutter/cupertino.dart';

class PinEditController with ChangeNotifier {
  TextEditingController pinOldController = new TextEditingController();
  TextEditingController pinNewController = new TextEditingController();
  TextEditingController pinConfirmController = new TextEditingController();

  Future store() async {
    if (pinOldController.text == "") {
      return GeneralHelper.toast(msg: "PIN lama tidak boleh kosong");
    }
    if (pinNewController.text == "") {
      return GeneralHelper.toast(msg: "PIN Baru tidak boleh kosong");
    }
    if (pinConfirmController.text == "") {
      return GeneralHelper.toast(msg: "Konfirmasi PIN tidak boleh kosong");
    }
    notifyListeners();
  }
}
