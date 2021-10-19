import 'dart:async';

import 'package:bestfranchise/Configs/colorConfig.dart';
import 'package:bestfranchise/Configs/stringConfig.dart';
import 'package:bestfranchise/Controllers/auth/authController.dart';
import 'package:bestfranchise/Views/component/general/buttonComponent.dart';
import 'package:bestfranchise/Views/widget/auth/secureCodeWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screen_scaler/flutter_screen_scaler.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class OtpWidget extends StatefulWidget {
  Function(String otp) callback;
  bool isTrue;
  String otp;
  OtpWidget({this.callback,this.isTrue,this.otp});
  @override
  _OtpWidgetState createState() => _OtpWidgetState();
}

class _OtpWidgetState extends State<OtpWidget> {

  @override
  void initState() {
    super.initState();
    // timeCounter = 120;
    // _timerUpdate();
    final auth = Provider.of<AuthController>(context, listen: false);
    auth.timerUpdate();
    auth.timeCounter=10;
  }

  @override
  Widget build(BuildContext context) {
    ScreenScaler scale= ScreenScaler()..init(context);
    final auth=Provider.of<AuthController>(context);
    print("############## DATA OTP = ${auth.dataOtp}");
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: scale.getPadding(2,7),
        child: ButtonComponent(
          labelColor: Colors.white,
          backgroundColor: ColorConfig.blueSecondary,
          label:"kirim ulang kode OTP ${!auth.timeUpFlag ?'dalam ${auth.timeCounter} detik':''}",
          callback: ()async{
            if(auth.timeUpFlag){
              print(auth.dataOtp);
              final res = await auth.login(context,auth.dataOtp,false);
              // if(res!=null){
              //   // auth.timeUpFlag=!auth.timeUpFlag;
              //   // auth.timeCounter=120;
              //   // _timerUpdate();
              //   widget.otp=res["data"]["temp_otp"];
              //   setState(() {});
              // }
            }
          },
        ),
      ),
      body:  Container(
        alignment: Alignment.center,
        padding: scale.getPadding(5, 6),
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(StringConfig.imgLocal+"backgroundForm.png")
            )
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(child: Image.asset(StringConfig.imgLocal+"logo.png",height: scale.getHeight(10))),
              SizedBox(height: scale.getHeight(5)),
              Text("Masukkan Kode OTP (${auth.otpCode})",style: Theme.of(context).textTheme.headline1),
              SizedBox(height: scale.getHeight(1)),
              Text("Untuk memastikan akun ini benar milik kamu, mohon masukkan 4 Digit kode OTP yang kami kirim melaui SMS ke Nomor Handphone yang kamu daftarkan.",style: Theme.of(context).textTheme.headline3,textAlign: TextAlign.center,),
              SecureCodeWidget(
                  isTrue: true,
                  passLength: 4,
                  borderColor: Theme.of(context).textTheme.subtitle1.color,
                  passCodeVerify: (passcode) async {
                    String code='';
                    for (int i = 0; i < passcode.length; i++) {
                      code+= passcode[i].toString();
                    }
                    await widget.callback(code);
                    return false;
                  },
                  onSuccess: () async{
                    // widget.callback();
                  }
              )
            ],
          ),
        ),
      ),

    );
  }
}
