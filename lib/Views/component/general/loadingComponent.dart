import 'package:flutter/material.dart';
import 'package:flutter_screen_scaler/flutter_screen_scaler.dart';
import 'package:shimmer/shimmer.dart';


class BaseLoading extends StatelessWidget {
  final double height;
  final double width;
  final double radius;

  BaseLoading({@required this.height,@required this.width,this.radius=10});
  @override
  Widget build(BuildContext context) {
    ScreenScaler scale = ScreenScaler()..init(context);
    return Shimmer.fromColors(
      baseColor: Theme.of(context).unselectedWidgetColor,
      highlightColor: Colors.grey[100],
      enabled: true,
      child: Container(
        margin: scale.getMarginLTRB(0, 0,0,0.1),
        width:scale.getWidth(this.width),
        height: scale.getHeight(this.height),
        decoration: BoxDecoration(
            color:Colors.grey[200],
            borderRadius: BorderRadius.all(Radius.circular(this.radius))
        ),
      ),
    );

  }
}

