import 'package:bestfranchise/Configs/colorConfig.dart';
import 'package:bestfranchise/Configs/routeConfig.dart';
import 'package:bestfranchise/Configs/stringConfig.dart';
import 'package:bestfranchise/Controllers/slider/sliderHomeController.dart';
import 'package:bestfranchise/Views/component/general/touchEffectComponent.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screen_scaler/flutter_screen_scaler.dart';
import 'package:provider/provider.dart';

class BusinessPlaceComponent extends StatefulWidget {
  @override
  _BusinessPlaceComponentState createState() => _BusinessPlaceComponentState();
}

class _BusinessPlaceComponentState extends State<BusinessPlaceComponent> {


  @override
  Widget build(BuildContext context) {
    ScreenScaler scale = ScreenScaler()..init(context);
    return Container(
      margin: scale.getMarginLTRB(0, 0, 0, 0),
      height: scale.getHeight(15),
      child: ListView.separated(
        padding: EdgeInsets.zero,
        physics: ClampingScrollPhysics(),
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: 3,
        itemBuilder: (context, index) {
          return InTouchWidget(
              radius: 10,
              callback: () {
                Navigator.of(context).pushNamed(RoutePath.managerWidget);
              },
              child: Container(
                decoration: BoxDecoration(
                    color: Color(0xFFE4767F),
                    borderRadius: BorderRadius.circular(10)),
                // padding: scale.getPadding(0.5,1),
                width: scale.getWidth(80),
                child: Padding(
                  padding: scale.getPadding(1, 2),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: scale.getWidth(40),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Bingun Pengelola ?",
                              style: Theme.of(context).textTheme.headline1,
                            ),
                            Text(
                              "Masalah penting ketika ingin mulai usaha, salah satunya adalah modal",
                              style: Theme.of(context)
                                  .textTheme
                                  .headline2
                                  .copyWith(color: Colors.black45),
                            ),
                            SizedBox(height: scale.getHeight(1)),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    InkWell(
                                        child: new Text(
                                          'Klik di sini    ',
                                          style: TextStyle(
                                            color: ColorConfig.blackPrimary,
                                            fontSize: 20,
                                          ),
                                        ),
                                        onTap: () => {}),
                                    Image.asset(
                                      StringConfig.imgLocal +
                                          "icRightArrow.png",
                                      scale: 1.5,
                                    ),
                                  ]),
                            ),
                          ],
                        ),
                      ),
                      Image.asset(StringConfig.imgLocal + "solusi1.png")
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
