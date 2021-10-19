import 'package:bestfranchise/Configs/formConfig.dart';
import 'package:bestfranchise/Controllers/baseController.dart';
import 'package:bestfranchise/Helpers/general/generalHelper.dart';
import 'package:bestfranchise/Views/widget/auth/otpWidget.dart';
import 'package:flutter/cupertino.dart';

class AuthController with ChangeNotifier{
  dynamic dataOtp;

  setDataOtp(input){
    dataOtp=input;
    notifyListeners();
  }
  Future login(BuildContext context,dynamic data)async{
    String phone=data["phone"];
    String countryCode=data["countryCode"];
    if(phone==""){
      GeneralHelper.toast(msg: "Nomor handphone tidak boleh kosong");
    }
    else if(phone.length<FormConfig.minLengthPhone){
      GeneralHelper.toast(msg: "Nomor handphone terlalu pendek");
    }
    else{
      if(phone[0]=="0"){
        String replaceIndex0 = phone[0].replaceAll("0","");
        phone = replaceIndex0+phone.substring(1,phone.length);
      }
      final res=await sendOtp(context, countryCode+phone, "0");
      if(res!=null){
        Navigator.of(context).push(
          CupertinoPageRoute(builder: (_) => OtpWidget(
            callback: (code){
              if(res["data"]["temp_otp"]=="$code"){
                print("BERHASIL");
              }
            },
            isTrue: false,
            otp: res["data"]["temp_otp"],
          ))
        );
      }
      print(res);
      print(countryCode+phone);
    }
    notifyListeners();
  }


  Future sendOtp(BuildContext context,phone,type)async{
    final data={
      "mobile_no":phone,
      "type":"$type",
      "name":""
    };
    final res = await BaseController().post(
      url: "auth/sendotp",
      data:data,
      context:context
    );
    setDataOtp(data);
    return res;
  }

}