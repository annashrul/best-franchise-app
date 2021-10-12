import 'package:bestfranchise/Configs/colorConfig.dart';
import 'package:bestfranchise/Configs/stringConfig.dart';
import 'package:bestfranchise/Helpers/general/generalHelper.dart';
import 'package:bestfranchise/Views/component/general/buttonComponent.dart';
import 'package:bestfranchise/Views/component/general/touchEffectComponent.dart';
import 'package:bestfranchise/Views/component/reward/wrapperRewardComponent.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screen_scaler/flutter_screen_scaler.dart';

class RoyaltiWidget extends StatefulWidget {
  @override
  _RoyaltiWidgetState createState() => _RoyaltiWidgetState();
}

class _RoyaltiWidgetState extends State<RoyaltiWidget> {
  @override
  Widget build(BuildContext context) {
    ScreenScaler scale = ScreenScaler()..init(context);
    return WrapperRewardComponent(
      titleCard: "Royalti",
      imgCard: "royaltiBlack",
      rewardCard: "5000000",
      descCard: "Royalti yang kamu dapat dari setiap omset referal dan orang yang kamu ajak telah menjadi franchise kami.",
      callbackBottomButton: (){},
    );

  }
}
