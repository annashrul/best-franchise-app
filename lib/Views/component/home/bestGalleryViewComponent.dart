import 'package:flutter/material.dart';
import 'package:flutter_screen_scaler/flutter_screen_scaler.dart';
import 'package:photo_view/photo_view.dart';

class BestGalleryViewComponent extends StatefulWidget {
  final String valGl;
  BestGalleryViewComponent(this.valGl);

  @override
  _BestGalleryViewComponentState createState() =>
      _BestGalleryViewComponentState();
}

class _BestGalleryViewComponentState extends State<BestGalleryViewComponent> {
  @override
  Widget build(BuildContext context) {
    ScreenScaler scale = ScreenScaler()..init(context);
    return Container(
        child: PhotoView(
      imageProvider: NetworkImage(widget.valGl),
    ));
  }
}
