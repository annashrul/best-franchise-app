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

class RegistWidget extends StatefulWidget {
  Function callback;
  RegistWidget({this.callback});
  @override
  _RegistWidgetState createState() => _RegistWidgetState();
}

class _RegistWidgetState extends State<RegistWidget> {
  int step = 0;

  @override
  Widget build(BuildContext context) {
    ScreenScaler scale = ScreenScaler()..init(context);
    final regist = Provider.of<RegistController>(context);
    return Scaffold(
      bottomNavigationBar: Container(
        padding: scale.getPadding(3, 2),
        child: ButtonComponent(
          label: step != 3 ? "Lanjutkan" : "Selesai",
          callback: () {
            _visibilitymethod(step == 0
                ? 1
                : step == 1
                    ? 2
                    : 3);
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
                    "Langkah " + (step + 1).toString(),
                    style: Theme.of(context)
                        .textTheme
                        .headline1
                        .copyWith(fontSize: 24),
                  ),
                  Text(
                    step == 0
                        ? "Silahkan masukkan nomor handphone tanpa menuliskan angka nol terlebih dahulu."
                        : step == 1
                            ? "Untuk mengenal lebih jauh, silahkan masukkan Nama Lengkap kamu ya !"
                            : step == 2
                                ? "Masukkan kode referal kamu"
                                : "Silahkan ketik 6 Digit Pin sebagai password kamu untuk masuk ke aplikasi ini.",
                    style: Theme.of(context).textTheme.headline2,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: scale.getHeight(2),
            ),
            Visibility(
              visible: step == 0,
              child: Container(
                width: double.infinity,
                padding: scale.getPadding(0, 2),
                decoration: BoxDecoration(
                    border: Border.all(color: Color(0xFF1E2188)),
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: scale.getWidth(20),
                      child: CountryCodePicker(
                        onChanged: (CountryCode countryCode) {},
                        initialSelection: 'ID',
                        favorite: ['+62', 'ID'],
                        showCountryOnly: true,
                        showOnlyCountryWhenClosed: false,
                        alignLeft: true,
                        textStyle: Theme.of(context).textTheme.headline2,
                      ),
                    ),
                    Container(
                      width: scale.getWidth(50),
                      child: TextFormField(
                        style: Theme.of(context).textTheme.headline2,
                        // controller: _noHpController,
                        maxLines: 1,
                        autofocus: false,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintStyle: Theme.of(context)
                                .textTheme
                                .headline2
                                .copyWith(color: Color(0xFFD0CACA)),
                            hintText: "Masukan Nomor Handphone"),
                        keyboardType: TextInputType.number,
                        textInputAction: TextInputAction.done,
                        inputFormatters: <TextInputFormatter>[
                          WhitelistingTextInputFormatter.digitsOnly
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Visibility(
              visible: step == 1,
              child: FieldComponent(
                controller: regist.namaController,
                labelText: "Nama Lengkap",
              ),
            ),
            Visibility(
              visible: step == 2,
              child: FieldComponent(
                controller: regist.referralController,
                labelText: "Kode Refreral",
              ),
            ),
            Visibility(
              visible: step == 3,
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

  void _visibilitymethod(val) {
    setState(() {
      step = val;
      if (val == 3) {
        Navigator.of(context).pushNamed(RoutePath.verifWidget);
      }
    });
  }
}
