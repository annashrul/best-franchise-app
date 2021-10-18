import 'package:bestfranchise/Configs/routeConfig.dart';
import 'package:bestfranchise/Controllers/regist/registController.dart';
import 'package:bestfranchise/Views/component/general/buttonComponent.dart';
import 'package:bestfranchise/Views/widget/auth/secureCodeWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screen_scaler/flutter_screen_scaler.dart';
import 'package:provider/provider.dart';

class RegistStep4Widget extends StatefulWidget {
  Function callback;
  RegistStep4Widget({this.callback});
  @override
  _RegistStep4WidgetState createState() => _RegistStep4WidgetState();
}

class _RegistStep4WidgetState extends State<RegistStep4Widget> {
  @override
  Widget build(BuildContext context) {
    ScreenScaler scale = ScreenScaler()..init(context);
    final regist = Provider.of<RegistController>(context);
    return Scaffold(
      bottomNavigationBar: Container(
        padding: scale.getPadding(3, 2),
        child: ButtonComponent(
          label: "Selesai",
          callback: () {
            Navigator.of(context).pushNamed(RoutePath.verifWidget);
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
                    "Langkah 4",
                    style: Theme.of(context).textTheme.headline1,
                  ),
                  Text(
                    "Silahkan ketik 6 Digit Pin sebagai password kamu untuk masuk ke aplikasi ini.",
                    style: Theme.of(context).textTheme.headline2,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: scale.getHeight(2),
            ),
            Expanded(
              child: Container(
                alignment: Alignment.center,
                padding: scale.getPadding(0, 6),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SecureCodeWidget(
                          isTrue: false,
                          passLength: 6,
                          borderColor:
                              Theme.of(context).textTheme.subtitle1.color,
                          passCodeVerify: (passcode) async {
                            String code = '';
                            for (int i = 0; i < passcode.length; i++) {
                              code += passcode[i].toString();
                            }
                            await widget.callback(code);
                            return false;
                          },
                          onSuccess: () async {
                            // widget.callback();
                          })
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
