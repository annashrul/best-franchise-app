import 'package:bestfranchise/Controllers/baseController.dart';
import 'package:bestfranchise/Controllers/user/userController.dart';
import 'package:bestfranchise/Databases/tableDatabase.dart';
import 'package:bestfranchise/Helpers/general/generalHelper.dart';
import 'package:bestfranchise/Views/component/general/modalSuccessComponent.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class ImagesProfileController with ChangeNotifier {
  TextEditingController pinOldController = new TextEditingController();
  TextEditingController pinNewController = new TextEditingController();
  TextEditingController pinConfirmController = new TextEditingController();

  Future store(BuildContext context, List dataPhoto) async {
    // for (int i = 0; i < dataPhoto.length; i++) {
    //   if (dataPhoto[i]["required"] == "true" && dataPhoto[i]["img"] == "") {
    //     GeneralHelper.toast(msg: "${dataPhoto[i]["title"]} tidak boleh kosong");
    //     print(dataPhoto[i]);
    //     return;
    //   }
    // }
    Map<dynamic, dynamic> field = {
      "photo": dataPhoto[0]["required"] == "true" && dataPhoto[0]["img"] == ""
          ? "-"
          : dataPhoto[0]["base64"].toString(),
      "cover": dataPhoto[1]["required"] == "true" && dataPhoto[1]["img"] == ""
          ? "-"
          : dataPhoto[1]["base64"].toString()
    };
    print(field);
    final user = Provider.of<UserController>(context, listen: false);

    print("========+===" + user.dataUser.toString());
    final res = await BaseController().put(
        url: "member/${user.dataUser[UserTable.idUser]}",
        data: field,
        context: context);
    if (res != null) {
      GeneralHelper.modal(context: context, child: ModalSuccessComponent());
    }
    notifyListeners();
  }
}
