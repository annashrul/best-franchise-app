import 'package:bestfranchise/Configs/stringConfig.dart';
import 'package:bestfranchise/Views/widget/auth/secureCodeWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screen_scaler/flutter_screen_scaler.dart';

class PinWidget extends StatefulWidget {
  final void Function(int pin) callback;
  PinWidget({this.callback});
  @override
  _PinWidgetState createState() => _PinWidgetState();
}

class _PinWidgetState extends State<PinWidget> {
  @override
  Widget build(BuildContext context) {
    ScreenScaler scale= ScreenScaler()..init(context);
    return Scaffold(
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
              Text("Masukkan PIN anda",style: Theme.of(context).textTheme.headline1),
              SizedBox(height: scale.getHeight(1)),
              Text("Untuk memastikan akun ini benar milik kamu, mohon masukkan 6 Digit kode PIN kamu",style: Theme.of(context).textTheme.headline3,textAlign: TextAlign.center,),
              SecureCodeWidget(
                  isTrue: true,
                  passLength: 6,
                  borderColor: Theme.of(context).textTheme.subtitle1.color,
                  passCodeVerify: (passcode) async {
                    String code='';
                    for (int i = 0; i < passcode.length; i++) {
                      code+= passcode[i].toString();
                    }
                    widget.callback(int.parse(code));
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
