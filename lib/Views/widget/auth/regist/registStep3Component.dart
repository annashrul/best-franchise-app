import 'package:bestfranchise/Configs/routeConfig.dart';
import 'package:bestfranchise/Controllers/auth/authController.dart';
import 'package:bestfranchise/Controllers/regist/registController.dart';
import 'package:bestfranchise/Helpers/general/generalHelper.dart';
import 'package:bestfranchise/Views/component/general/buttonComponent.dart';
import 'package:bestfranchise/Views/component/general/fieldComponent.dart';
import 'package:bestfranchise/Views/widget/auth/regist/wrapperComponentRegister.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screen_scaler/flutter_screen_scaler.dart';
import 'package:provider/provider.dart';

class RegistStep3Widget extends StatefulWidget {
  Function callback;
  RegistStep3Widget({this.callback});
  @override
  _RegistStep3WidgetState createState() => _RegistStep3WidgetState();
}

class _RegistStep3WidgetState extends State<RegistStep3Widget> {
  TextEditingController referralCodeController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    ScreenScaler scale = ScreenScaler()..init(context);
    final regist = Provider.of<AuthController>(context);
    return WrapperComponentRegister(
      callback: (){
        if (referralCodeController.text == "") {
          return GeneralHelper.toast(msg: "Kode referral tidak boleh kosong");
        }
        regist.setReferralCode(referralCodeController.text);
        Navigator.of(context).pushNamed(RoutePath.registerWidget4);
      },
      step: 3,
      caption: "Masukkan kode referral kamu",
      child: FieldComponent(
        controller: referralCodeController,
        labelText: "Kode Referral",
        maxLength: 50,
        keyboardType: TextInputType.text,
      ),
    );
  }
}
