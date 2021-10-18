import 'package:bestfranchise/Configs/routeConfig.dart';
import 'package:bestfranchise/Controllers/regist/registController.dart';
import 'package:bestfranchise/Views/component/general/buttonComponent.dart';
import 'package:bestfranchise/Views/component/general/fieldComponent.dart';
import 'package:bestfranchise/Views/widget/auth/secureCodeWidget.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screen_scaler/flutter_screen_scaler.dart';
import 'package:provider/provider.dart';

class RegistStep2Widget extends StatefulWidget {
  Function callback;
  RegistStep2Widget({this.callback});
  @override
  _RegistStep2WidgetState createState() => _RegistStep2WidgetState();
}

class _RegistStep2WidgetState extends State<RegistStep2Widget> {
  @override
  Widget build(BuildContext context) {
    ScreenScaler scale = ScreenScaler()..init(context);
    final regist = Provider.of<RegistController>(context);
    return Scaffold(
      bottomNavigationBar: Container(
        padding: scale.getPadding(3, 2),
        child: ButtonComponent(
          label: "Lanjutkan",
          callback: () {
            Navigator.of(context).pushNamed(RoutePath.registerWidget3);
          },
        ),
      ),
      body: Padding(
        padding: scale.getPadding(3, 2),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: scale.getHeight(2),
            ),
            ClipOval(
              child: Container(
                color: Colors.black, // button color
                padding: scale.getPadding(0.4, 1),
                child: Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(
              height: scale.getHeight(2),
            ),
            Padding(
              padding: scale.getPadding(0, 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Membuat Akun Baru",
                    style: Theme.of(context)
                        .textTheme
                        .headline1
                        .copyWith(fontSize: 24),
                  ),
                  SizedBox(
                    height: scale.getHeight(1),
                  ),
                  Text(
                    "Langkah 2",
                    style: Theme.of(context).textTheme.headline1,
                  ),
                  Text(
                    "Untuk mengenal lebih jauh, silahkan masukkan Nama Lengkap kamu ya !",
                    style: Theme.of(context).textTheme.headline2,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: scale.getHeight(2),
            ),
            FieldComponent(
              controller: regist.namaController,
              labelText: "Nama Lengkap",
            ),
          ],
        ),
      ),
    );
  }
}
