import 'package:bestfranchise/Configs/colorConfig.dart';
import 'package:bestfranchise/Configs/routeConfig.dart';
import 'package:bestfranchise/Helpers/general/generalHelper.dart';
import 'package:bestfranchise/Models/Slider/sliderHomeSolusiModel.dart';
import 'package:bestfranchise/Views/component/general/touchEffectComponent.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screen_scaler/flutter_screen_scaler.dart';

class BestSolusiComponent extends StatefulWidget {
  final List<Datum> valSl;
  BestSolusiComponent(this.valSl);

  @override
  _BestSolusiComponentState createState() => _BestSolusiComponentState();
}

class _BestSolusiComponentState extends State<BestSolusiComponent> {
  @override
  Widget build(BuildContext context) {
    ScreenScaler scale = ScreenScaler()..init(context);
    List data = [
      {"title": "Bungung Modal"},
      {"title": "Bingung Tempat"},
      {"title": "Bingung Pengelola"},
    ];
    return Container(
      margin: scale.getMarginLTRB(0, 0, 0, 0),
      height: scale.getHeight(13),
      child: ListView.separated(
        padding: EdgeInsets.zero,
        physics: ClampingScrollPhysics(),
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: widget.valSl.length,
        itemBuilder: (context, index) {
          final val = widget.valSl[index];
          return InTouchWidget(
              radius: 10,
              callback: () {
                if (val.route == "pengelola") {
                  Navigator.of(context).pushNamed(RoutePath.managerWidget);
                } else if (val.route == "tempat") {
                  Navigator.of(context)
                      .pushNamed(RoutePath.businessPlaceWidget);
                } else if (val.route == "modal") {
                  Navigator.of(context).pushNamed(
                      RoutePath.capitalSubmissionWidget,
                      arguments: {});
                } else {
                  Navigator.of(context)
                      .pushNamed(RoutePath.joinWidget, arguments: {});
                }
              },
              child: Container(
                decoration: BoxDecoration(
                    color: val.bgColor == "-"
                        ? Color(0xFFCEDAFA)
                        : HexColor(val.bgColor),
                    borderRadius: BorderRadius.circular(10)),
                // padding: scale.getPadding(0.5,1),
                width: scale.getWidth(70),
                child: Padding(
                  padding: scale.getPadding(1, 2),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: scale.getWidth(30),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              val.title,
                              style: Theme.of(context).textTheme.headline2,
                            ),
                            Text(
                              val.caption,
                              style: Theme.of(context)
                                  .textTheme
                                  .headline3
                                  .copyWith(color: Colors.black45),
                            ),
                            Text(
                              "Klik disini",
                              style: Theme.of(context)
                                  .textTheme
                                  .headline2
                                  .copyWith(color: ColorConfig.bluePrimary),
                            ),
                          ],
                        ),
                      ),
                      Image.network(val.banner)
                    ],
                  ),
                ),
                // child: R,
              ));
        },
        separatorBuilder: (context, index) {
          return SizedBox(width: scale.getWidth(1));
        },
      ),
    );
  }
}
