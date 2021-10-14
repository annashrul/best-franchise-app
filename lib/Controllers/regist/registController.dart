import 'package:bestfranchise/Helpers/general/generalHelper.dart';
import 'package:flutter/cupertino.dart';

class RegistController with ChangeNotifier {
  TextEditingController namaController = new TextEditingController();
  TextEditingController referralController = new TextEditingController();
  TextEditingController noTelponController = new TextEditingController();

  Future store() async {
    if (namaController.text == "") {
      return GeneralHelper.toast(msg: "Nama Lengkap tidak boleh kosong");
    }
    if (referralController.text == "") {
      return GeneralHelper.toast(msg: "Kode Referral tidak boleh kosong");
    }
    if (noTelponController.text == "") {
      return GeneralHelper.toast(msg: "Nomor Handphone tidak boleh kosong");
    }
    notifyListeners();
  }
}
