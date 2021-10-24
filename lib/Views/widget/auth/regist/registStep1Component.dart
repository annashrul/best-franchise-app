import 'package:bestfranchise/Configs/formConfig.dart';
import 'package:bestfranchise/Configs/routeConfig.dart';
import 'package:bestfranchise/Configs/stringConfig.dart';
import 'package:bestfranchise/Controllers/auth/authController.dart';
import 'package:bestfranchise/Controllers/regist/registController.dart';
import 'package:bestfranchise/Helpers/general/generalHelper.dart';
import 'package:bestfranchise/Views/component/general/buttonComponent.dart';
import 'package:bestfranchise/Views/component/general/fieldComponent.dart';
import 'package:bestfranchise/Views/component/general/touchEffectComponent.dart';
import 'package:bestfranchise/Views/widget/auth/regist/wrapperComponentRegister.dart';
import 'package:bestfranchise/Views/widget/auth/secureCodeWidget.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screen_scaler/flutter_screen_scaler.dart';
import 'package:provider/provider.dart';

class RegistStep1Widget extends StatefulWidget {
  Function callback;
  RegistStep1Widget({this.callback});
  @override
  _RegistStep1WidgetState createState() => _RegistStep1WidgetState();
}

class _RegistStep1WidgetState extends State<RegistStep1Widget> {
  TextEditingController noHpController = new TextEditingController();
  String countryCode="62";
  @override
  Widget build(BuildContext context) {
    final register = Provider.of<AuthController>(context);
    return WrapperComponentRegister(
      callback: (){
        if (noHpController.text == "") {
          return GeneralHelper.toast(msg: "Nomor Handphone tidak boleh kosong");
        }
        String phone = FormConfig.validatePhoneNumber(countryCode,noHpController.text);
        if(phone.length<FormConfig.minLengthPhone){
          return GeneralHelper.toast(msg: "Nomor Handphone terlalu pendek");
        }
        register.setPhoneNumber(countryCode+noHpController.text);
        Navigator.of(context).pushNamed(RoutePath.registerWidget2);
      },
      step: 1,
      caption:"Silahkan masukkan nomor handphone tanpa menuliskan angka nol terlebih dahulu.",
      child: FieldComponent(
        controller: noHpController,
        labelText: "Masukan Nomor Handphone",
        isPhone: true,
        maxLength: FormConfig.maxLengthPhone,
        keyboardType: TextInputType.number,
        onTapCountry: (code){
          countryCode=code;
          setState(() {});
        },
      ),
    );
  }
}
