import 'package:bestfranchise/Configs/formConfig.dart';
import 'package:bestfranchise/Controllers/baseController.dart';
import 'package:bestfranchise/Controllers/user/userController.dart';
import 'package:bestfranchise/Databases/tableDatabase.dart';
import 'package:bestfranchise/Helpers/general/generalHelper.dart';
import 'package:bestfranchise/Views/component/general/modalSuccessComponent.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class ProfileEditController with ChangeNotifier {
  // TextEditingController idReferralController = new TextEditingController();
  TextEditingController fullname = new TextEditingController();
  // TextEditingController noHpController = new TextEditingController();
  // TextEditingController emailController = new TextEditingController();
  // TextEditingController addressController = new TextEditingController();

  // Future store() async {
  //   if (idReferralController.text == "") {
  //     return GeneralHelper.toast(msg: "ID Referral tidak boleh kosong");
  //   }
  //   if (namaController.text == "") {
  //     return GeneralHelper.toast(msg: "Nama Lengkap tidak boleh kosong");
  //   }
  //   if (noHpController.text == "") {
  //     return GeneralHelper.toast(msg: "Nomor Handphone tidak boleh kosong");
  //   }
  //   if (emailController.text == "") {
  //     return GeneralHelper.toast(msg: "Alamat Email tidak boleh kosong");
  //   }
  //   if (addressController.text == "") {
  //     return GeneralHelper.toast(msg: "Alamat Tinggal tidak boleh kosong");
  //   }
  //   notifyListeners();
  // }
  Future store({BuildContext context, Map<String, dynamic> field}) async {
    if (field["fullname"] == "") {
      return GeneralHelper.toast(msg: "Nama lengkap tidak boleh kosong");
    }
    final data = {
      "fullname": field["fullname"],
    };

    final user = Provider.of<UserController>(context, listen: false);

    print("========+===" + user.dataUser.toString());
    final res = await BaseController().put(
        url: "member/${user.dataUser[UserTable.idUser]}",
        data: data,
        context: context);
    if (res != null) {
      print(res);
      GeneralHelper.modal(context: context, child: ModalSuccessComponent());
    }
    notifyListeners();
  }
}
