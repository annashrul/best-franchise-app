import 'package:bestfranchise/Configs/stringConfig.dart';
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
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      // primary: true,
      physics: NeverScrollableScrollPhysics(),
      crossAxisCount: 3,
      itemCount:  9,
      itemBuilder: (BuildContext context, int index) {
        return  ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Image.asset(
            StringConfig.imgLocal+"g${index+1}.jpg",
            fit: BoxFit.cover,
            height: scale.getHeight(12),
          ),
        );
      },
      staggeredTileBuilder: (int index) => new StaggeredTile.fit(1),
      mainAxisSpacing: 5.0,
      crossAxisSpacing: 5.0,
    );
  }
}
