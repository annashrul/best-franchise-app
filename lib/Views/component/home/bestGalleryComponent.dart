import 'package:bestfranchise/Views/component/general/touchEffectComponent.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screen_scaler/flutter_screen_scaler.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class BestGalleryComponent extends StatefulWidget {
  @override
  _BestGalleryComponentState createState() => _BestGalleryComponentState();
}

class _BestGalleryComponentState extends State<BestGalleryComponent> {
  @override
  Widget build(BuildContext context) {
    ScreenScaler scale= ScreenScaler()..init(context);
    return StaggeredGridView.countBuilder(
      padding: EdgeInsets.all(0.0),
      shrinkWrap: true,
      primary: false,
      crossAxisCount: 3,
      itemCount:  9,
      itemBuilder: (BuildContext context, int index) {
        return InTouchWidget(
            callback: (){},
            child: Image.network(
              "https://images.tokopedia.net/img/cache/700/product-1/2020/3/13/75617328/75617328_e5f8f60a-bb8d-4966-aa83-751e1ff11384_1080_1080",
              fit: BoxFit.cover,
              width: scale.getWidth(40),
              height: scale.getHeight(10),
            )
        );
      },
      staggeredTileBuilder: (int index) => new StaggeredTile.fit(1),
      mainAxisSpacing: 5.0,
      crossAxisSpacing: 5.0,
    );
  }
}
