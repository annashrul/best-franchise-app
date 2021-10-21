import 'dart:ui';

import 'package:bestfranchise/Configs/colorConfig.dart';
import 'package:bestfranchise/Configs/routeConfig.dart';
import 'package:bestfranchise/Configs/stringConfig.dart';
import 'package:bestfranchise/Helpers/general/generalHelper.dart';
import 'package:bestfranchise/Helpers/svg.dart';
import 'package:bestfranchise/Models/Home/rewardModel.dart';
import 'package:bestfranchise/Views/component/general/qrCodeComponent.dart';
import 'package:bestfranchise/Views/component/general/searchComponent.dart';
import 'package:bestfranchise/Views/component/general/touchEffectComponent.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screen_scaler/flutter_screen_scaler.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RewardComponent extends StatefulWidget {
  final String bonusPoin;
  final String bonusKomisi;
  final String bonusRoyalti;
  final Datum val;

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
                        Card(
                          margin: EdgeInsets.zero,
                          elevation: 4,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(100.0),
                          ),
                          child: InTouchWidget(
                              radius: 100,
                              callback: () {
                                GeneralHelper.modal(
                                    context: context,
                                    child: Container(
                                      height: scale.getHeight(90),
                                      child: QrCodeComponent(),
                                    ));
                              },
                              child: Container(
                                padding: scale.getPadding(1, 2),
                                child: RadiantGradientMask(
                                  child: SvgPicture.asset(
                                    "assets/svg/QR_Code.svg",
                                    height: scale.getHeight(2),
                                    color: Colors.white,
                                  ),
                                ),
                              )),
                        ),
                        SizedBox(width: scale.getWidth(1)),
                        Card(
                          margin: EdgeInsets.zero,
                          elevation: 4,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(100.0),
                          ),
                          child: InTouchWidget(
                              radius: 100,
                              callback: () => Navigator.of(context)
                                  .pushNamed(RoutePath.notifWidget),
                              child: Container(
                                padding: scale.getPadding(0.5, 1),
                                child: Image.asset(
                                  StringConfig.imgLocal + "notif.png",
                                  scale: 1.5,
                                ),
                              )),
                        ),
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
                            desc: widget.val.bonusPoin),
                        RewardCardComponent(
                            img: "komisi",
                            title: "Komisi",
                            desc: widget.val.bonusKomisi),
                        RewardCardComponent(
                            img: "royalti",
                            title: "Royalti",
                            desc: widget.val.bonusKomisi),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ]);
  }
}

class RewardCardComponent extends StatelessWidget {
  final String img;
  final String title;
  final String desc;

  RewardCardComponent({this.img, this.title, this.desc});
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
            children: [
              Image.asset(
                StringConfig.imgLocal + "${this.img}.png",
                height: scale.getHeight(2),
              ),
              SizedBox(width: scale.getWidth(1)),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
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

class RadiantGradientMask extends StatelessWidget {
  RadiantGradientMask({this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) => LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          stops: [
            0.169951,
            0.494792,
            0.666667,
            1
          ],
          colors: [
            Color(0xFF7ABAF5),
            Color(0xFFC881F3).withOpacity(0.671875),
            Color(0xFFBD38B0).withOpacity(0.317708),
            Color(0xFFF10707)
          ]
          // center: Alignment.topRight,
          // radius: 0.5,
          // begin: Alignment.centerLeft,
          // end: Alignment.centerRight,
          // stops: [0.169951,0.494792,0.666667,1],
          // colors: [Color(0xFF7ABAF5),Color(0xFFC881F3).withOpacity(0.671875), Color(0xFFBD38B0).withOpacity(0.317708),Color(0xFFF10707)],
          // tileMode: TileMode.mirror,
          ).createShader(bounds),
      child: child,
    );
  }
}
