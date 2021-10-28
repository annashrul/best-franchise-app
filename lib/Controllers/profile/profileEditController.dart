import 'package:bestfranchise/Configs/formConfig.dart';
import 'package:bestfranchise/Controllers/baseController.dart';
import 'package:bestfranchise/Controllers/user/userController.dart';
import 'package:bestfranchise/Databases/coreDatabase.dart';
import 'package:bestfranchise/Databases/tableDatabase.dart';
import 'package:bestfranchise/Helpers/general/generalHelper.dart';
import 'package:bestfranchise/Views/component/general/modalSuccessComponent.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class ProfileEditController with ChangeNotifier {
  CoreDatabases db = new CoreDatabases();
  TextEditingController idReferralController = new TextEditingController();
  TextEditingController fullname = new TextEditingController();
  TextEditingController noHpController = new TextEditingController();
  TextEditingController emailController = new TextEditingController();
  TextEditingController addressController = new TextEditingController();

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
    // if (field["mobile_no"] == "") {
    //   return GeneralHelper.toast(msg: "No Telpon tidak boleh kosong");
    // }
    if (field["email"] == "") {
      return GeneralHelper.toast(msg: "Email tidak boleh kosong");
    }
    if (field["address"] == "") {
      return GeneralHelper.toast(msg: "Alamat lengkap tidak boleh kosong");
    }
    final data = {
      "fullname": field["fullname"],
      // "mobile_no": field["mobile_no"],
      "email": field["email"],
      "location": field["address"],
    };

    final user = Provider.of<UserController>(context, listen: false);

    print("========+===" + user.dataUser.toString());
    final res = await BaseController().put(
        url: "member/${user.dataUser[UserTable.idUser]}",
        data: data,
        context: context);
    if (res != null) {
      print(res);
      final dataUser = {
        "${UserTable.idUser}": user.dataUser[UserTable.idUser],
        "${UserTable.token}": user.dataUser[UserTable.token],
        "${UserTable.fullname}": field["fullname"],
        "${UserTable.mobile_no}": user.dataUser[UserTable.mobile_no],
        "${UserTable.photo}": user.dataUser[UserTable.photo],
        "${UserTable.cover}": user.dataUser[UserTable.cover],
        "${UserTable.email}": field["email"],
        "${UserTable.referral}": user.dataUser[UserTable.referral],
        "${UserTable.status}": user.dataUser[UserTable.status],
        "${UserTable.location}": field["address"],
        "${UserTable.statusRoleApp}": user.dataUser[UserTable.statusRoleApp]
      };

      await db.update(UserTable.TABLE_NAME, "idUser",user.dataUser[UserTable.idUser], dataUser);
      user.setDataUser(dataUser);
      user.getDataUser();
      GeneralHelper.modalGeneral(context: context, child: ModalSuccessComponent(callback: ()=>Navigator.of(context).pop()));
    }
    notifyListeners();
  }
}
