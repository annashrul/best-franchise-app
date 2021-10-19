import 'package:bestfranchise/Databases/coreDatabase.dart';
import 'package:bestfranchise/Databases/tableDatabase.dart';
import 'package:flutter/cupertino.dart';

class UserController with ChangeNotifier{
  dynamic dataUser;
  CoreDatabases db = new CoreDatabases();
  setDataUser(input){
    dataUser=input;
    notifyListeners();
  }
  Future getDataUser()async{
    final res=await db.getData(UserTable.TABLE_NAME);
    print(res.length);
    if(res.length>0){
      setDataUser(res[0]);
    }
    notifyListeners();
  }
}