import 'package:bestfranchise/Configs/colorConfig.dart';
import 'package:bestfranchise/Configs/stringConfig.dart';
import 'package:bestfranchise/Views/component/general/buttonComponent.dart';
import 'package:bestfranchise/Views/component/home/bestSolusiComponent.dart';
import 'package:bestfranchise/Views/component/manager/managerComponent.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screen_scaler/flutter_screen_scaler.dart';

class ManagerWidget extends StatefulWidget {
  @override
  _ManagerWidgetState createState() => _ManagerWidgetState();
}

class _ManagerWidgetState extends State<ManagerWidget> {
  @override
  Widget build(BuildContext context) {
    ScreenScaler scale = ScreenScaler()..init(context);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: Text(
          "Informasi Pengelola",
          style: Theme.of(context).textTheme.headline1,
        ),
      ),
      body: Center(
        child: ListView(
          padding: scale.getPadding(1, 2),
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          children: [
            Image.asset(StringConfig.imgLocal + "imageManager.png"),
            Text(
              "Bingung mengelola usaha kamu? Yuk konsultasikan kepada kami, karena kami mempunyai orang yang handal untuk memajukan bisnis kamu.",
              style: Theme.of(context).textTheme.bodyText1,

              textAlign: TextAlign.center,
            ),
            SizedBox(height: scale.getHeight(2)),
            ManagerComponent(),
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
