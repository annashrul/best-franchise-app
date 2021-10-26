import 'package:flutter/material.dart';
import 'package:flutter_screen_scaler/flutter_screen_scaler.dart';

class BackgroundIconComponent extends StatelessWidget {
  BackgroundIconComponent({this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    ScreenScaler scale = ScreenScaler()..init(context);

    return ShaderMask(
      blendMode: BlendMode.srcIn,
      shaderCallback: (Rect bounds) => LinearGradient(
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
      ).createShader(bounds),
      child:SizedBox(
        width: scale.getTextSize(15),
        height: scale.getTextSize(15),
        child: child,
      )
    );
  }
}
class GradientIcon extends StatelessWidget {
  GradientIcon(
      this.icon,
      this.size,
      this.gradient,
      );

  final IconData icon;
  final double size;
  final Gradient gradient;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      child: SizedBox(
        width: size * 1.2,
        height: size * 1.2,
        child: Icon(
          icon,
          size: size,
          color: Colors.white,
        ),
      ),
      shaderCallback: (Rect bounds) {
        final Rect rect = Rect.fromLTRB(0, 0, size, size);
        return gradient.createShader(rect);
      },
    );
  }
}