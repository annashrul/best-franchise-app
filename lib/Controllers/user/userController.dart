import 'package:bestfranchise/Databases/coreDatabase.dart';
import 'package:bestfranchise/Databases/tableDatabase.dart';
import 'package:flutter/cupertino.dart';

class UserController with ChangeNotifier{
  dynamic dataUser;
  CoreDatabases db;
  setDataUser(input){
    dataUser=input;
    notifyListeners();
  }
  Future getDataUser()async{
    final res=await db.getData(UserTable.TABLE_NAME);
    print(res);
    notifyListeners();
  }
}