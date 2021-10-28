import 'package:bestfranchise/Controllers/baseController.dart';
import 'package:bestfranchise/Databases/coreDatabase.dart';
import 'package:bestfranchise/Databases/tableDatabase.dart';
import 'package:bestfranchise/Models/user/userModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class UserController with ChangeNotifier {
  UserModel userModel;
  dynamic dataUser;
  CoreDatabases db = new CoreDatabases();
  var isLoadingDet = true;
  setDataUser(input) {
    dataUser = input;
    notifyListeners();
  }

  Future getDataUser() async {
    final res = await db.getData(UserTable.TABLE_NAME);
    print(res.length);
    if (res.length > 0) {
      setDataUser(res[0]);
    }
    notifyListeners();
  }

  loadUserDet(BuildContext context, id) async {
    if (userModel == null) isLoadingDet = true;
    final res =
        await BaseController().get(url: "member/get/$id", context: context);
    print("############## ${res["data"]}");
    // if (!res["data"].isEmpty) {

    final user = Provider.of<UserController>(context, listen: false);
    UserModel result = UserModel.fromJson(res);
    userModel = result;
    isLoadingDet = false;
    final dataUser = {
      "${UserTable.idUser}": user.dataUser[UserTable.idUser],
      "${UserTable.token}": user.dataUser[UserTable.token],
      "${UserTable.fullname}": result.data.fullname,
      "${UserTable.mobile_no}": result.data.mobileNo,
      "${UserTable.photo}": result.data.photo,
      "${UserTable.cover}": result.data.cover,
      "${UserTable.email}": result.data.email,
      "${UserTable.referral}": result.data.referral,
      "${UserTable.status}": result.data.status,
      "${UserTable.location}": result.data.location,
      "${UserTable.statusRoleApp}": user.dataUser[UserTable.statusRoleApp]
    };

    await db.update(UserTable.TABLE_NAME, "idUser",user.dataUser[UserTable.idUser], dataUser);
    user.setDataUser(dataUser);
    notifyListeners();
  }
}
