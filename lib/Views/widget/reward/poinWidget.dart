import 'package:bestfranchise/Configs/routeConfig.dart';
import 'package:bestfranchise/Views/component/reward/wrapperRewardComponent.dart';
import 'package:flutter/material.dart';

class PoinWidget extends StatefulWidget {
  @override
  _PoinWidgetState createState() => _PoinWidgetState();
}

class _PoinWidgetState extends State<PoinWidget> {
  @override
  Widget build(BuildContext context) {
    return WrapperRewardComponent(
      titleCard: "Poin",
      imgCard: "poinBlack",
      rewardCard: "1000",
      descCard: "Poin didapat dari setiap register yang menggunakan referal kamu",
      callbackBottomButton: ()=>Navigator.of(context).pushNamed(RoutePath.redeemPoinWidget),
    );
  }
}
