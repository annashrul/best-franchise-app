import 'package:bestfranchise/Configs/colorConfig.dart';
import 'package:bestfranchise/Views/component/general/touchEffectComponent.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screen_scaler/flutter_screen_scaler.dart';

class ButtonComponent extends StatelessWidget {
  final String label;
  final Color backgroundColor;
  final Color labelColor;
  final void Function() callback;
  final double height;
  ButtonComponent({this.label,this.backgroundColor,this.labelColor,this.callback,this.height=4});
  @override
  Widget build(BuildContext context) {
    ScreenScaler scale = ScreenScaler()..init(context);
    return InkWell(
      radius: 100,
      onTap:callback,
      child: Container(
        height: scale.getHeight(this.height),
        width: scale.getWidth(100),
        padding: scale.getPadding(0, 2),
        decoration: BoxDecoration(
            color: this.backgroundColor==null?Colors.white:backgroundColor,
            borderRadius: const BorderRadius.all(
              Radius.circular(100),
            ),
            shape: BoxShape.rectangle,
            boxShadow: [
                BoxShadow(
                  color: Colors.grey[200],
                  spreadRadius: 1,
                  blurRadius: 0,
                  offset: Offset(0, 3),
                )
              // BoxShadow(
              //   color: Colors.grey,
              //   spreadRadius: 100,
              //   blurRadius: 0,
              //   offset: Offset(20, 0), // changes position of shadow
              // ),
              // BoxShadow(
              //   color: Colors.grey[400],
              //   blurRadius: 0.0,
              //   offset: Offset(4.4, 4.4),
              // ),
              // BoxShadow(
              //   color: Colors.black.withOpacity(0.2),
              //   spreadRadius: 10,
              //   blurRadius: 12,
              //   offset: Offset(1, 10),
              // )
            ]
        ),
        child: Center(
          child: Text(this.label,style: Theme.of(context).textTheme.headline1.copyWith(color: labelColor==null?ColorConfig.blackPrimary:labelColor)),
        ),
      ),
    );
  }
}
