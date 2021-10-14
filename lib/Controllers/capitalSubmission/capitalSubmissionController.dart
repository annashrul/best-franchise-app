import 'package:bestfranchise/Helpers/general/generalHelper.dart';
import 'package:flutter/cupertino.dart';

class CapitalSubmissionController with ChangeNotifier {
  TextEditingController namaPemilikController = new TextEditingController();
  TextEditingController noTelponController = new TextEditingController();
  TextEditingController lokasiJualan = new TextEditingController();
  TextEditingController brandController = new TextEditingController();
  TextEditingController investController = new TextEditingController();

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
    if (brandController.text == "") {
      return GeneralHelper.toast(msg: "Brand belum dipilih");
    }
    if (investController.text == "") {
      return GeneralHelper.toast(msg: "Investasi belum dipilih");
    }
    notifyListeners();
  }
}
