import 'dart:async';

import 'package:bestfranchise/Configs/formConfig.dart';
import 'package:bestfranchise/Configs/routeConfig.dart';
import 'package:bestfranchise/Configs/stringConfig.dart';
import 'package:bestfranchise/Controllers/baseController.dart';
import 'package:bestfranchise/Controllers/user/userController.dart';
import 'package:bestfranchise/Databases/coreDatabase.dart';
import 'package:bestfranchise/Databases/tableDatabase.dart';
import 'package:bestfranchise/Helpers/general/generalHelper.dart';
import 'package:bestfranchise/Views/widget/auth/otpWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class AuthController with ChangeNotifier{
  dynamic dataOtp;
  int timeCounter = 0;
  bool timeUpFlag = false;
  Timer timer;
  String countryCode="";
  String otpCode="";
  CoreDatabases db = new CoreDatabases();
  timerUpdate() {
    timer = Timer(const Duration(seconds: 1), () async {
      timeCounter--;
      if (timeCounter != 0){
        timerUpdate();
        notifyListeners();
      }
      else{
        timeCounter=0;
        timeUpFlag = true;
        timer.cancel();
        notifyListeners();
      }
    });
  }

  void setTimer(input){
    timeCounter=input;
    // timerUpdate();
    timeUpFlag=!timeUpFlag;
    notifyListeners();
  }
  setCountryCode(input){
    countryCode=input;
    notifyListeners();
  }
  setDataOtp(input){
    dataOtp=input;
    notifyListeners();
  }
  Future login(BuildContext context,dynamic data,bool isRedirect)async{
    String phone=data["mobile_no"];
    // String countryCode=data["countryCode"];
    // print(phone.length);
    if(phone==""){
      GeneralHelper.toast(msg: "Nomor handphone tidak boleh kosong");
    }
    else if(phone.length<FormConfig.minLengthPhone){
      GeneralHelper.toast(msg: "Nomor handphone terlalu pendek");
    }
    else{
      if(phone[0]=="0"){
        String replaceIndex0 =phone[0].replaceAll("0","");
        phone = replaceIndex0+phone.substring(1,phone.length);
      }
      print("#################### PHONE NUMBER ${phone.length}");
      final bodyOtp={"mobile_no":"${isRedirect?countryCode+phone:data["mobile_no"]}","type":"0","name": "Sep juna"};
      final res=await sendOtp(context,bodyOtp);
      setDataOtp(bodyOtp);
      otpCode = res["data"]["temp_otp"];
      if(res!=null){
        if(isRedirect){
          Navigator.of(context).push(
              CupertinoPageRoute(builder: (_) => OtpWidget(
                callback: (code)async{
                  print("###################################");
                  print("################################### $otpCode === $code");
                  print("###################################");
                  if(res["data"]["temp_otp"]=="$code"){
                    final resLogin = await BaseController().post(
                        url: "auth/signin",
                        data: {
                          "mobile_no":"$countryCode$phone",
                          "code_otp":res["data"]["temp_otp"]
                        },
                        context: context
                    );
                    final dataUser={
                      "${UserTable.idUser}":resLogin["data"]["id"].toString(),
                      "${UserTable.token}":resLogin["data"]["token"].toString(),
                      "${UserTable.fullname}":resLogin["data"]["fullname"].toString(),
                      "${UserTable.mobile_no}":resLogin["data"]["mobile_no"].toString(),
                      "${UserTable.photo}":resLogin["data"]["photo"].toString(),
                      "${UserTable.cover}":resLogin["data"]["cover"].toString(),
                      "${UserTable.email}":resLogin["data"]["email"].toString(),
                      "${UserTable.referral}":resLogin["data"]["referral"].toString(),
                      "${UserTable.status}":resLogin["data"]["status"].toString(),
                      "${UserTable.statusRoleApp}":"${StringConfig.masukKeAplikasi}"
                    };
                    final user = Provider.of<UserController>(context,listen: false);
                    final checkUser=await db.getData(UserTable.TABLE_NAME);
                    if(checkUser.length>0){
                      await db.delete(UserTable.TABLE_NAME);
                      await db.insert(UserTable.TABLE_NAME, dataUser);
                    }else{
                      await db.insert(UserTable.TABLE_NAME, dataUser);
                    }
                    user.setDataUser(dataUser);
                    Navigator.of(context).pushNamedAndRemoveUntil(RoutePath.mainWidget, (route) => false,arguments: StringConfig.tabHome);
                  }
                },
                isTrue: true,
                otp: res["data"]["temp_otp"],
              ))
          );
        }
        else{
          print("RESPONSE SEND-OTP $res");
          setTimer(10);
          timerUpdate();
          notifyListeners();
        }
      }
    }
  }
  Future sendOtp(BuildContext context,field)async{
    final res = await BaseController().post(
      url: "auth/sendotp",
      data:field,
      context:context
    );
    return res;
  }

}