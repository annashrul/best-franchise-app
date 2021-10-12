import 'package:bestfranchise/Configs/routeConfig.dart';
import 'package:bestfranchise/Helpers/general/generalHelper.dart';
import 'package:bestfranchise/Views/component/reward/wrapperRewardComponent.dart';
import 'package:flutter/material.dart';

class KomisiWidget extends StatefulWidget {
  @override
  _KomisiWidgetState createState() => _KomisiWidgetState();
}

class _KomisiWidgetState extends State<KomisiWidget> {
  @override
  Widget build(BuildContext context) {
    return WrapperRewardComponent(
      titleCard: "Komisi",
      imgCard: "komisiBlack",
      rewardCard: "1000000",
      descCard: "Komisi yang kamu dapat dari setiap referal dan orang yang kamu ajak telah menjadi franchise kami.",
      callbackBottomButton: ()=>Navigator.of(context).pushNamed(RoutePath.formWithdrawWidget),
    );
  }
}
