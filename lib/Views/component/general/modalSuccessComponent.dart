import 'package:bestfranchise/Configs/colorConfig.dart';
import 'package:bestfranchise/Configs/stringConfig.dart';
import 'package:bestfranchise/Helpers/general/generalHelper.dart';
import 'package:bestfranchise/Views/component/general/buttonComponent.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screen_scaler/flutter_screen_scaler.dart';

class ModalSuccessComponent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ScreenScaler scale = ScreenScaler()..init(context);
    return Container(
      height: scale.getHeight(50),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(StringConfig.imgLocal+"success.png"),
            Padding(
              padding: scale.getPadding(0,3),
              child: ButtonComponent(
                labelColor: Colors.white,
                backgroundColor: ColorConfig.blueSecondary,
                label: "Kembali",
                callback: ()=>GeneralHelper.backToMain(context: context,tab: StringConfig.tabHome),
              ),
            )
          ],
        ),
      ),
    );
  }
}
