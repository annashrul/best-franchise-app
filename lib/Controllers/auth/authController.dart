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

class AuthController with ChangeNotifier {
  dynamic dataOtp;
  String phoneNumber;
  String name;
  String referralCode;
  String pin;

  int timeCounter = 0;
  bool timeUpFlag = false;
  Timer timer;
  String countryCode = "";
  String otpCode = "";
  CoreDatabases db = new CoreDatabases();
  setPhoneNumber(input) {
    phoneNumber = input;
    notifyListeners();
  }

  setName(input) {
    name = input;
    notifyListeners();
  }

  setReferralCode(input) {
    referralCode = input;
    notifyListeners();
  }

  setPin(input) {
    pin = input;
    notifyListeners();
  }

  timerUpdate() {
    timer = Timer(const Duration(seconds: 1), () async {
      timeCounter--;
      if (timeCounter != 0) {
        timerUpdate();
        notifyListeners();
      } else {
        timeCounter = 0;
        timeUpFlag = true;
        timer.cancel();
        notifyListeners();
      }
    });
  }

  void setTimer(input) {
    timeCounter = input;
    timeUpFlag = !timeUpFlag;
    notifyListeners();
  }

  setCountryCode(input) {
    countryCode = input;
    notifyListeners();
  }

  setDataOtp(input) {
    dataOtp = input;
    notifyListeners();
  }

  Future login(BuildContext context, dynamic data, bool isRedirect) async {
    String phone = data["mobile_no"];
    if (phone == "") {
      GeneralHelper.toast(msg: "Nomor handphone tidak boleh kosong");
    } else if (phone.length < FormConfig.minLengthPhone) {
      GeneralHelper.toast(msg: "Nomor handphone terlalu pendek");
    } else {
      if (phone[0] == "0") {
        String replaceIndex0 = phone[0].replaceAll("0", "");
        phone = replaceIndex0 + phone.substring(1, phone.length);
      }
      final bodyOtp = {
        "mobile_no": "${isRedirect ? countryCode + phone : data["mobile_no"]}",
        "type": "0",
        "name": "Sep juna"
      };
      final res = await sendOtp(context, bodyOtp);
      Navigator.of(context).push(CupertinoPageRoute(
          builder: (_) => OtpWidget(
                callback: (code) async {
                  if (otpCode == "$code") {
                    final resLogin = await BaseController().post(
                        url: "auth/signin",
                        data: {
                          "mobile_no": "$countryCode$phone",
                          "code_otp": otpCode
                        },
                        context: context);
                    final dataUser = {
                      "${UserTable.idUser}": resLogin["data"]["id"].toString(),
                      "${UserTable.token}":
                          resLogin["data"]["token"].toString(),
                      "${UserTable.fullname}":
                          resLogin["data"]["fullname"].toString(),
                      "${UserTable.mobile_no}":
                          resLogin["data"]["mobile_no"].toString(),
                      "${UserTable.photo}":
                          resLogin["data"]["photo"].toString(),
                      "${UserTable.cover}":
                          resLogin["data"]["cover"].toString(),
                      "${UserTable.email}":
                          resLogin["data"]["email"].toString(),
                      "${UserTable.referral}":
                          resLogin["data"]["referral"].toString(),
                      "${UserTable.status}":
                          resLogin["data"]["status"].toString(),
                      "${UserTable.location}":
                          resLogin["data"]["location"].toString(),
                      "${UserTable.statusRoleApp}":
                          "${StringConfig.masukKeAplikasi}"
                    };
                    final user =
                        Provider.of<UserController>(context, listen: false);
                    final checkUser = await db.getData(UserTable.TABLE_NAME);
                    if (checkUser.length > 0) {
                      await db.delete(UserTable.TABLE_NAME);
                      await db.insert(UserTable.TABLE_NAME, dataUser);
                    } else {
                      await db.insert(UserTable.TABLE_NAME, dataUser);
                    }
                    user.setDataUser(dataUser);
                    Navigator.of(context).pushNamedAndRemoveUntil(
                        RoutePath.mainWidget, (route) => false,
                        arguments: StringConfig.tabHome);
                  }
                },
                isTrue: true,
                otp: res["data"]["temp_otp"],
              )));
    }
  }

  Future sendOtp(BuildContext context, field) async {
    final res = await BaseController()
        .post(url: "auth/sendotp", data: field, context: context);
    otpCode = res["data"]["temp_otp"];
    setDataOtp(field);
    timerUpdate();
    setTimer(10);
    notifyListeners();
    return res;
  }

  Future register(BuildContext context) async {
    final bodyOtp = {"mobile_no": phoneNumber, "type": "1", "name": name};
    final resOtp = await sendOtp(context, bodyOtp);
    if (resOtp != null) {
      Navigator.of(context).push(CupertinoPageRoute(
          builder: (_) => OtpWidget(
                callback: (code) async {
                  if (otpCode == "$code") {
                    final dataRegister = {
                      "fullname": name,
                      "mobile_no": phoneNumber,
                      "pin": pin,
                      "code_otp": otpCode,
                      "sponsor_referral": referralCode
                    };
                    final resRegister = await BaseController().post(
                        url: "auth/signup",
                        data: dataRegister,
                        context: context);
                    if (resRegister != null) {
                      final dataUser = {
                        "${UserTable.idUser}":
                            resRegister["data"]["id"].toString(),
                        "${UserTable.token}":
                            resRegister["data"]["token"].toString(),
                        "${UserTable.fullname}":
                            resRegister["data"]["fullname"].toString(),
                        "${UserTable.mobile_no}":
                            resRegister["data"]["mobile_no"].toString(),
                        "${UserTable.photo}":
                            resRegister["data"]["photo"].toString(),
                        "${UserTable.cover}":
                            resRegister["data"]["cover"].toString(),
                        "${UserTable.email}":
                            resRegister["data"]["email"].toString(),
                        "${UserTable.referral}":
                            resRegister["data"]["referral"].toString(),
                        "${UserTable.status}":
                            resRegister["data"]["status"].toString(),
                        "${UserTable.location}":
                            resRegister["data"]["location"].toString(),
                        "${UserTable.statusRoleApp}":
                            "${StringConfig.masukKeAplikasi}"
                      };
                      final user =
                          Provider.of<UserController>(context, listen: false);
                      final checkUser = await db.getData(UserTable.TABLE_NAME);
                      if (checkUser.length > 0) {
                        await db.delete(UserTable.TABLE_NAME);
                        await db.insert(UserTable.TABLE_NAME, dataUser);
                      } else {
                        await db.insert(UserTable.TABLE_NAME, dataUser);
                      }
                      user.setDataUser(dataUser);
                      Navigator.of(context).pushNamedAndRemoveUntil(
                          RoutePath.mainWidget, (route) => false,
                          arguments: StringConfig.tabHome);
                    }
                  }
                },
                isTrue: true,
                otp: resOtp["data"]["temp_otp"],
              )));
    }
  }
}
