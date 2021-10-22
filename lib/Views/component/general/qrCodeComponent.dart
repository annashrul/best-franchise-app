import 'package:bestfranchise/Configs/stringConfig.dart';
import 'package:bestfranchise/Views/component/general/touchEffectComponent.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screen_scaler/flutter_screen_scaler.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';

class QrCodeComponent extends StatefulWidget {
  @override
  _QrCodeComponentState createState() => _QrCodeComponentState();
}

class _QrCodeComponentState extends State<QrCodeComponent> {
  @override
  Widget build(BuildContext context) {
    ScreenScaler scale = ScreenScaler()..init(context);
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(StringConfig.imgLocal+"backgroundForm.png")
          )
        ),
        child: Center(
          child: ListView(
            shrinkWrap: true,
            padding: scale.getPadding(1,10),
            children: [
              Text("Your QR Code",style: Theme.of(context).textTheme.headline1.copyWith(fontSize: 24),textAlign: TextAlign.center,),
              SizedBox(height: scale.getHeight(2),),
              Center(
                child: PrettyQr(
                  typeNumber: 3,
                  size: scale.getHeight(30),
                  data: 'https://www.google.ru',
                  errorCorrectLevel: 1,
                  roundEdges: true,
                ),
              ),
              SizedBox(height: scale.getHeight(2),),
              Text("Scan QR Code ini ketika kamu belanja di franchise kami dan dapatkan diskon menarik setiap pembelanjaannya.",style: Theme.of(context).textTheme.headline2,textAlign: TextAlign.center,)
            ],
          ),
        ),
      ),
    );
  }
}
