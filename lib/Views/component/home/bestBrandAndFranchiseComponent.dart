import 'package:bestfranchise/Configs/routeConfig.dart';
import 'package:bestfranchise/Configs/stringConfig.dart';
import 'package:bestfranchise/Models/Brand/listBrandModel.dart';
import 'package:bestfranchise/Views/component/general/loadingComponent.dart';
import 'package:bestfranchise/Views/component/general/touchEffectComponent.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screen_scaler/flutter_screen_scaler.dart';

class BestBrandAndFranchiseComponent extends StatefulWidget {
  final List<Datum> valBr;
  final bool isLoading;
  BestBrandAndFranchiseComponent(this.valBr, this.isLoading);

  @override
  _BestBrandAndFranchiseComponentState createState() =>
      _BestBrandAndFranchiseComponentState();
}

class _BestBrandAndFranchiseComponentState
    extends State<BestBrandAndFranchiseComponent> {
  @override
  Widget build(BuildContext context) {
    ScreenScaler scale = ScreenScaler()..init(context);

    return Container(
      height: scale.getHeight(5),
      child: ListView.separated(
        physics: ClampingScrollPhysics(),
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: widget.valBr.length,
        itemBuilder: (context, index) {
          final val = widget.valBr[index];
          return InTouchWidget(
              radius: 100,
              callback: () => Navigator.of(context).pushNamed(
                  RoutePath.detailBrandWidget,
                  arguments: {"id": val.id}),
              child: CircleAvatar(
                radius: 32,
                child: ClipOval(
                  child: Image.network(
                    val.logo,
                    fit: BoxFit.cover,
                    width: scale.getWidth(100),
                    height: scale.getHeight(100),
                  ),
                ),
              ));
        },
        separatorBuilder: (context, index) {
          return SizedBox(
            width: scale.getWidth(1),
          );
        },
      ),
    );
  }
}
