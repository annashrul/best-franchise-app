import 'package:bestfranchise/Helpers/general/generalHelper.dart';
import 'package:bestfranchise/Models/Slider/galleryHomeModel.dart';
import 'package:bestfranchise/Views/component/home/bestGalleryViewComponent.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screen_scaler/flutter_screen_scaler.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class BestGalleryComponent extends StatefulWidget {
  final List<Datum> valGl;
  BestGalleryComponent(this.valGl);

  @override
  _BestGalleryComponentState createState() => _BestGalleryComponentState();
}

class _BestGalleryComponentState extends State<BestGalleryComponent> {
  @override
  Widget build(BuildContext context) {
    ScreenScaler scale = ScreenScaler()..init(context);
    return StaggeredGridView.countBuilder(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      // primary: true,
      physics: NeverScrollableScrollPhysics(),
      crossAxisCount: 3,
      itemCount: widget.valGl.length,
      itemBuilder: (BuildContext context, int index) {
        final val = widget.valGl[index];
        return InkWell(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.network(
              val.photo,
              fit: BoxFit.cover,
              height: scale.getHeight(12),
            ),
          ),
          onTap: () => {
            GeneralHelper.modal(
                context: context,
                child: Container(
                  height: scale.getHeight(85),
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(10)),
                  child: BestGalleryViewComponent(val.photo),
                ))
          },
        );
      },
      staggeredTileBuilder: (int index) => new StaggeredTile.fit(1),
      mainAxisSpacing: 5.0,
      crossAxisSpacing: 5.0,
    );
  }
}
