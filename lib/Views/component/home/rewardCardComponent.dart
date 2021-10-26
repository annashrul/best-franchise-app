import 'dart:ui';

import 'package:bestfranchise/Configs/routeConfig.dart';
import 'package:bestfranchise/Configs/stringConfig.dart';
import 'package:bestfranchise/Configs/ui_icons.dart';
import 'package:bestfranchise/Controllers/reward/komisiController.dart';
import 'package:bestfranchise/Helpers/general/generalHelper.dart';
import 'package:bestfranchise/Icons/best_icon_icons.dart';
import 'package:bestfranchise/Models/Home/rewardModel.dart';
import 'package:bestfranchise/Views/component/general/backgroundIconComponent.dart';
import 'package:bestfranchise/Views/component/general/qrCodeComponent.dart';
import 'package:bestfranchise/Views/component/general/searchComponent.dart';
import 'package:bestfranchise/Views/component/general/touchEffectComponent.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_screen_scaler/flutter_screen_scaler.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class RewardComponent extends StatefulWidget {
  final String bonusPoin;
  final String bonusKomisi;
  final String bonusRoyalti;
  final dynamic val;

  final void Function() callback;
  RewardComponent(this.val,
      {this.callback, this.bonusPoin, this.bonusKomisi, this.bonusRoyalti});
  @override
  _RewardComponentState createState() => _RewardComponentState();
}

class _RewardComponentState extends State<RewardComponent> {
  @override
  Widget build(BuildContext context) {
    ScreenScaler scale = ScreenScaler()..init(context);
    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: scale.getMarginLTRB(0, 21, 0, 0),
            padding: scale.getPadding(0, 2),
            child: Card(
              margin: EdgeInsets.zero,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              elevation: 1,
              child: Container(
                padding: scale.getPadding(1, 2),
                width: double.infinity,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: SearchComponent(hintText: ""),
                        ),
                        SizedBox(width: scale.getWidth(1)),
                        buildCardIcon(
                            icon: FontAwesome5Solid.qrcode,
                            callback: () {
                              GeneralHelper.modal(
                                  context: context,
                                  child: Container(
                                    height: scale.getHeight(70),
                                    child: QrCodeComponent(),
                                  ));
                            }),
                        SizedBox(width: scale.getWidth(1)),
                        buildCardIcon(
                            icon: FontAwesome5Solid.bell,
                            callback: () => Navigator.of(context)
                                .pushNamed(RoutePath.notifWidget)),
                      ],
                    ),
                    SizedBox(
                      height: scale.getHeight(1),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        RewardCardComponent(
                          img: "poin",
                          title: "Jumlah Poin",
                          desc: GeneralHelper()
                              .formatter
                              .format(int.parse(widget.val["poin"])),
                          icon: FontAwesome5Solid.database,
                        ),
                        RewardCardComponent(
                          img: "komisi",
                          title: "Komisi",
                          desc: GeneralHelper()
                              .formatter
                              .format(int.parse(widget.val["saldo_komisi"])),
                          icon: FontAwesome5Solid.wallet,
                        ),
                        RewardCardComponent(
                          img: "royalti",
                          title: "Royalti",
                          desc: GeneralHelper()
                              .formatter
                              .format(int.parse(widget.val["saldo_royalti"])),
                          icon: FontAwesome5Solid.money_bill_alt,
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ]);
  }

  Widget buildCardIcon({IconData icon, void Function() callback}) {
    ScreenScaler scale = ScreenScaler()..init(context);
    return Card(
      margin: EdgeInsets.zero,
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(100.0),
      ),
      child: InTouchWidget(
          radius: 100,
          callback: callback,
          child: Container(
            padding: scale.getPadding(0.5, 1.1),
            child: BackgroundIconComponent(
                child: Icon(
              icon,
              color: Colors.white,
              size: scale.getTextSize(14),
            )),
          )),
    );
  }
}

class RewardCardComponent extends StatelessWidget {
  final String img;
  final String title;
  final String desc;
  final IconData icon;

  RewardCardComponent(
      {this.img,
      this.title,
      this.desc,
      this.icon = FontAwesome5Solid.database});
  @override
  Widget build(BuildContext context) {
    ScreenScaler scale = ScreenScaler()..init(context);
    return InTouchWidget(
        callback: () {
          print(this.img + "Widget");
          Navigator.of(context).pushNamed("/" + this.img + "Widget");
        },
        child: Container(
          // width: scale.getWidth(26),
          padding: scale.getPadding(0, 0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Icon(icon,color: Color(0xFFC881F3).withOpacity(0.671875)),
              BackgroundIconComponent(
                child: Icon(icon, color: Colors.grey[200]),
              ),
              // Image.asset(
              //   StringConfig.imgLocal + "${this.img}.png",
              //   height: scale.getHeight(2),
              // ),
              SizedBox(width: scale.getWidth(2)),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(this.title,
                      style: Theme.of(context)
                          .textTheme
                          .headline2
                          .copyWith(color: Colors.black45)),
                  Text(this.desc, style: Theme.of(context).textTheme.headline2),
                ],
              )
            ],
          ),
        ));
  }
}
