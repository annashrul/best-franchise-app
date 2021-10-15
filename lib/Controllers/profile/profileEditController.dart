import 'package:bestfranchise/Helpers/general/generalHelper.dart';
import 'package:flutter/cupertino.dart';

class ProfileEditController with ChangeNotifier {
  TextEditingController idReferralController = new TextEditingController();
  TextEditingController namaController = new TextEditingController();
  TextEditingController noHpController = new TextEditingController();
  TextEditingController emailController = new TextEditingController();
  TextEditingController addressController = new TextEditingController();

  Future store() async {
    if (idReferralController.text == "") {
      return GeneralHelper.toast(msg: "ID Referral tidak boleh kosong");
    }
    if (namaController.text == "") {
      return GeneralHelper.toast(msg: "Nama Lengkap tidak boleh kosong");
    }
    if (noHpController.text == "") {
      return GeneralHelper.toast(msg: "Nomor Handphone tidak boleh kosong");
    }
    if (emailController.text == "") {
      return GeneralHelper.toast(msg: "Alamat Email tidak boleh kosong");
    }
    if (addressController.text == "") {
      return GeneralHelper.toast(msg: "Alamat Tinggal tidak boleh kosong");
    }
    notifyListeners();
  }
}
