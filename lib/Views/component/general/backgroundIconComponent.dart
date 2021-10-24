import 'package:flutter/material.dart';

class BackgroundIconComponent extends StatelessWidget {
  BackgroundIconComponent({this.child});
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
