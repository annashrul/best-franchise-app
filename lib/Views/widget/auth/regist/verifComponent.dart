import 'package:bestfranchise/Configs/routeConfig.dart';
import 'package:bestfranchise/Views/component/general/buttonComponent.dart';
import 'package:bestfranchise/Views/widget/auth/secureCodeWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screen_scaler/flutter_screen_scaler.dart';

class VerifWidget extends StatefulWidget {
  Function callback;
  VerifWidget({this.callback});
  @override
  _VerifWidgetState createState() => _VerifWidgetState();
}

class _VerifWidgetState extends State<VerifWidget> {
  @override
  Widget build(BuildContext context) {
    ScreenScaler scale = ScreenScaler()..init(context);
    return Scaffold(
      bottomNavigationBar: Container(
        padding: scale.getPadding(3, 2),
        child: ButtonComponent(
          label: "Verifikasi",
          callback: () {
            Navigator.of(context).pushNamed(RoutePath.mainWidget);
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
                    "Verifikasi Akun",
                    style: Theme.of(context)
                        .textTheme
                        .headline1
                        .copyWith(fontSize: 24),
                  ),
                  SizedBox(
                    height: scale.getHeight(1),
                  ),
                  Text(
                    "Masukkan Kode Verifikasi",
                    style: Theme.of(context)
                        .textTheme
                        .headline1
                        .copyWith(fontSize: 24),
                  ),
                  Text(
                    "Untuk memastikan akun ini benar milik kamu, mohon masukkan 4 Digit kode yang kami kirim melaui SMS ke Nomor Handphone yang kamu daftarkan.",
                    style: Theme.of(context).textTheme.headline2,
                  ),
                ],
              ),
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
                          passLength: 4,
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
