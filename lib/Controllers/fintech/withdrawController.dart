
import 'package:bestfranchise/Helpers/general/generalHelper.dart';
import 'package:flutter/cupertino.dart';

class WithdrawController with ChangeNotifier{
  TextEditingController noRekeningController = new TextEditingController();
  TextEditingController atasNameController = new TextEditingController();
  TextEditingController bankController = new TextEditingController();


  Future store()async{
    if(noRekeningController.text==""){
      return GeneralHelper.toast(msg: "No rekening tidak boleh kosong");
    }
    if(atasNameController.text==""){
      return GeneralHelper.toast(msg: "Atas nama tidak boleh kosong");
    }
    if(bankController.text==""){
      return GeneralHelper.toast(msg: "Bank tidak boleh kosong");
    }
    notifyListeners();
  }

}