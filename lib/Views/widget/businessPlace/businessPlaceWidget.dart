import 'package:bestfranchise/Configs/colorConfig.dart';
import 'package:bestfranchise/Configs/stringConfig.dart';
import 'package:bestfranchise/Helpers/general/generalHelper.dart';
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

      appBar:GeneralHelper.appBarGeneral(context: context,title: "Informasi tempat usaha"),
      floatingActionButton: SizedBox(
        width: double.infinity,
        child: Container(
          padding: scale.getPadding(1,2),
          child: FlatButton(
              padding: scale.getPadding(1,0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(100.0),
              ),
              color: ColorConfig.redPrimary,
              onPressed:(){},
              child: Text("Whatsapp kami",style: Theme.of(context).textTheme.headline1.copyWith(color: Colors.white),)
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      body: Padding(
        padding: scale.getPadding(0,2),
        child: Center(
          child: Column(
            // padding: scale.getPadding(0, 2),
            // shrinkWrap: true,
            // scrollDirection: Axis.vertical,
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

            ],
          ),
        ),
      ),
    );
  }
}
