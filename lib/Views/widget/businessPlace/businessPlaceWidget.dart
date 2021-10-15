import 'package:bestfranchise/Configs/colorConfig.dart';
import 'package:bestfranchise/Configs/stringConfig.dart';
import 'package:bestfranchise/Views/component/businessPlace/businessPlaceComponent.dart';
import 'package:bestfranchise/Views/component/general/buttonComponent.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screen_scaler/flutter_screen_scaler.dart';

class BusinessPlaceWidget extends StatefulWidget {
  @override
  _BusinessPlaceWidgetState createState() => _BusinessPlaceWidgetState();
}

class _BusinessPlaceWidgetState extends State<BusinessPlaceWidget> {
  @override
  Widget build(BuildContext context) {
    ScreenScaler scale = ScreenScaler()..init(context);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: Text(
          "Informasi Tempat Usaha",
          style: Theme.of(context).textTheme.headline1,
        ),
      ),
      body: Center(
        child: ListView(
          padding: scale.getPadding(1, 2),
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          children: [
            Image.asset(StringConfig.imgLocal + "businessPlace.png"),
            Text(
              "Kamu tidak usah khawatir mengenai tempat jualanmu, konsultasikan dengan kami saja.\n\nSilahkan chat admin kami untuk informasi lebih lengkapnya ya !",
              style: Theme.of(context).textTheme.bodyText1,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: scale.getHeight(2)),
            BusinessPlaceComponent(),
            SizedBox(height: scale.getHeight(1)),
            ButtonComponent(
              label: "Whatsapp kami",
              labelColor: Colors.white,
              backgroundColor: ColorConfig.redPrimary,
              callback: () {},
            )
          ],
        ),
      ),
    );
  }
}
