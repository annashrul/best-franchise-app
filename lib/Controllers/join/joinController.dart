import 'package:bestfranchise/Helpers/general/generalHelper.dart';
import 'package:flutter/cupertino.dart';

class JoinController with ChangeNotifier {
  TextEditingController namaPemilikController = new TextEditingController();
  TextEditingController noTelponController = new TextEditingController();
  TextEditingController lokasiJualan = new TextEditingController();
  TextEditingController tipeController = new TextEditingController();

  Future store() async {
    if (namaPemilikController.text == "") {
      return GeneralHelper.toast(msg: "Nama pemilik tidak boleh kosong");
    }
    if (noTelponController.text == "") {
      return GeneralHelper.toast(msg: "Nomor Handphone tidak boleh kosong");
    }
    if (lokasiJualan.text == "") {
      return GeneralHelper.toast(msg: "Lokasi Jualan tidak boleh kosong");
    }
    if (tipeController.text == "") {
      return GeneralHelper.toast(msg: "Tipe Investasi tidak boleh kosong");
    }
    notifyListeners();
  }
}
