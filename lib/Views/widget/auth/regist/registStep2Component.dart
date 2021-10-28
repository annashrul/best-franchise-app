import 'package:bestfranchise/Configs/routeConfig.dart';
import 'package:bestfranchise/Controllers/auth/authController.dart';
import 'package:bestfranchise/Controllers/regist/registController.dart';
import 'package:bestfranchise/Helpers/general/generalHelper.dart';
import 'package:bestfranchise/Views/component/general/buttonComponent.dart';
import 'package:bestfranchise/Views/component/general/fieldComponent.dart';
import 'package:bestfranchise/Views/widget/auth/regist/wrapperComponentRegister.dart';
import 'package:bestfranchise/Views/widget/auth/secureCodeWidget.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screen_scaler/flutter_screen_scaler.dart';
import 'package:provider/provider.dart';

class RegistStep2Widget extends StatefulWidget {
  @override
  _RegistStep2WidgetState createState() => _RegistStep2WidgetState();
}

class _RegistStep2WidgetState extends State<RegistStep2Widget> {
  TextEditingController nameController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    ScreenScaler scale = ScreenScaler()..init(context);
    final regist = Provider.of<AuthController>(context);
    return WrapperComponentRegister(
      callback: (){
        if (nameController.text == "") {
          return GeneralHelper.toast(msg: "Nam lengkap tidak boleh kosong");
        }

        regist.setName(nameController.text);
        Navigator.of(context).pushNamed(RoutePath.registerWidget3);
      },
      step: 2,
      caption: "Untuk mengenal lebih jauh, silahkan masukkan Nama Lengkap kamu ya !",
      child: FieldComponent(
        controller: nameController,
        labelText: "Nama Lengkap",
        maxLength: 50,
        keyboardType: TextInputType.text,
      ),
    );
  }
}
