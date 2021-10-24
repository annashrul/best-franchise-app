import 'package:bestfranchise/Configs/routeConfig.dart';
import 'package:bestfranchise/Controllers/auth/authController.dart';
import 'package:bestfranchise/Controllers/regist/registController.dart';
import 'package:bestfranchise/Helpers/general/generalHelper.dart';
import 'package:bestfranchise/Views/component/general/buttonComponent.dart';
import 'package:bestfranchise/Views/widget/auth/regist/wrapperComponentRegister.dart';
import 'package:bestfranchise/Views/widget/auth/secureCodeWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screen_scaler/flutter_screen_scaler.dart';
import 'package:provider/provider.dart';

class RegistStep4Widget extends StatefulWidget {
  @override
  _RegistStep4WidgetState createState() => _RegistStep4WidgetState();
}

class _RegistStep4WidgetState extends State<RegistStep4Widget> {
  String code = '';
  int codeLength=0;

  @override
  Widget build(BuildContext context) {
    ScreenScaler scale = ScreenScaler()..init(context);
    final regist = Provider.of<AuthController>(context);
    return WrapperComponentRegister(
      callback: (){
        print(code);
        if(codeLength<5){
          return GeneralHelper.toast(msg: "masukan 6 digit");
        }
        regist.setPin(code);
        regist.register(context);
        // Navigator.of(context).pushNamed(RoutePath.verifWidget);
      },
      step: 4,
      caption: "Silahkan ketik 6 Digit Pin sebagai password kamu untuk masuk ke aplikasi ini.",
      child: SecureCodeWidget(
          isTrue: false,
          passLength: 6,
          borderColor:Theme.of(context).textTheme.subtitle1.color,
          callbackOnDelete: (passcode){
            print("DELEYTE CODE $passcode ${codeLength--}");
            codeLength--;
            setState(() {});
          },
          passCodeVerify: (passcode) async {
            String pass="";
            for (int i = 0; i < passcode.length; i++) {
              pass += passcode[i].toString();
            }
            code=pass;
            codeLength=code.length-1;
            print(passcode);
            setState(() {});
            return true;
          },
          onSuccess: () async {
            print("SUKES");
            // widget.callback();
          }),
    );

  }
}
