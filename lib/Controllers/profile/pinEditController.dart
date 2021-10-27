import 'package:bestfranchise/Controllers/baseController.dart';
import 'package:bestfranchise/Controllers/user/userController.dart';
import 'package:bestfranchise/Databases/tableDatabase.dart';
import 'package:bestfranchise/Helpers/general/generalHelper.dart';
import 'package:bestfranchise/Views/component/general/modalSuccessComponent.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class PinEditController with ChangeNotifier {
  TextEditingController pinOldController = new TextEditingController();
  TextEditingController pinNewController = new TextEditingController();
  TextEditingController pinConfirmController = new TextEditingController();

  Future store({BuildContext context, Map<String, dynamic> field}) async {
    if (field["pin"] == "") {
      return GeneralHelper.toast(msg: "PIN Lama tidak boleh kosong");
    }
    if (field["pin_new"] == "") {
      return GeneralHelper.toast(msg: "PIN Baru tidak boleh kosong");
    }
    if (field["pin_confirm"] == "") {
      return GeneralHelper.toast(msg: "Konfirmasi PIN tidak boleh kosong");
    }
    if (field["pin"].length<6) {
      return GeneralHelper.toast(msg: "PIN Lama kurang dari 6 digit");
    }
    if (field["pin_new"].length<6) {
      return GeneralHelper.toast(msg: "PIN Baru kurang dari 6 digit");
    }
    if (field["pin_confirm"].length<6) {
      return GeneralHelper.toast(msg: "Konfirmasi PIN kurang dari 6 digit");
    }
    if (field["pin_confirm"] != field["pin_new"]) {
      return GeneralHelper.toast(msg: "Konfirmasi PIN tidak sesuai");
    }
    final data = {
      "pin": field["pin_new"],
      "current_pin": field["pin"],
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
