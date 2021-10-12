import 'package:bestfranchise/Configs/routeConfig.dart';
import 'package:bestfranchise/Views/component/general/touchEffectComponent.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screen_scaler/flutter_screen_scaler.dart';

class BestBrandAndFranchiseComponent extends StatefulWidget {
  @override
  _BestBrandAndFranchiseComponentState createState() => _BestBrandAndFranchiseComponentState();
}

class _BestBrandAndFranchiseComponentState extends State<BestBrandAndFranchiseComponent> {
  @override
  Widget build(BuildContext context) {
    ScreenScaler scale= ScreenScaler()..init(context);

    return Container(
      height: scale.getHeight(5),
      child: ListView.separated(
        physics: ClampingScrollPhysics(),
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: 30,
        itemBuilder: (context,index){
          return InTouchWidget(
              radius: 100,
              callback: ()=>Navigator.of(context).pushNamed(RoutePath.detailBrandWidget,arguments: {"id":""}),
              child: CircleAvatar(
                radius: 32,
                backgroundImage: NetworkImage("https://www.pngarea.com/pngm/136/7901075_veg-burger-png-siapa-guadalajara-png-download.png"),
              )
          );
        },
        separatorBuilder: (context,index){return SizedBox(width: scale.getWidth(1),);},
      ),
    );
  }
}
