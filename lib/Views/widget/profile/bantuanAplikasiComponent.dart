import 'package:bestfranchise/Configs/stringConfig.dart';
import 'package:bestfranchise/Helpers/general/generalHelper.dart';
import 'package:bestfranchise/Views/component/reward/cardHeaderReward.dart';
import 'package:flutter/material.dart';
class BantuanApliaskiWidget extends StatefulWidget {
  @override
  _BantuanApliaskiWidgetState createState() => _BantuanApliaskiWidgetState();
}

class _BantuanApliaskiWidgetState extends State<BantuanApliaskiWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GeneralHelper.appBarGeneral(
          context: context,
          title: "Bantuan Aplikasi"
      ),
      body: ListView(
        children: [
          CardHeaderReward(
            img: StringConfig.imgLocal+"tandaTanya.png",
            title: "Frequently Ask Question",
            desc: "Ada yang dapat kami bantu ?",
          )
        ],
      ),
    );
  }
}
