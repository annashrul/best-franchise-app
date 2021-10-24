import 'package:bestfranchise/Controllers/baseController.dart';
import 'package:bestfranchise/Helpers/general/generalHelper.dart';
import 'package:flutter/cupertino.dart';

class RegistController with ChangeNotifier {
  TextEditingController namaController = new TextEditingController();
  TextEditingController referralController = new TextEditingController();
  TextEditingController noTelponController = new TextEditingController();
  String phoneNumber;
  String name;
  String referralCode;
  String pin;
  setPhoneNumber(input){
    phoneNumber=input;
    notifyListeners();
  }
  setName(input){
    name=input;
    notifyListeners();
  }
  setReferralCode(input){
    referralCode=input;
    notifyListeners();
  }
  setPin(input){
    pin=input;
    notifyListeners();
  }


  Future store(BuildContext context) async {
    print(phoneNumber);
    print(name);
    print(referralCode);
    print(pin);
    final dataOtp={
      "mobile_no":phoneNumber,
      "type":"1",
      "name":name
    };

    final res = await BaseController().post(url: "auth/sendotp",data: dataOtp,context: context);

    notifyListeners();
  }
}
