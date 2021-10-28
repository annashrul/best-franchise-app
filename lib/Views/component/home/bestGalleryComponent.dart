import 'package:bestfranchise/Models/Slider/galleryHomeModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screen_scaler/flutter_screen_scaler.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:lightbox/lightbox.dart';

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
    List<String> img = [];
    for (var i = 0; i < widget.valGl.length; i++) {
      img.add(widget.valGl[i].photo);
    }
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
            Navigator.push(
                context,
                LightBoxRoute(
                    builder: (BuildContext context) {
                      return LightBox(
                        img,
                        imageType: ImageType.URL,
                        initialIndex: index,
                      );
                    },
                    dismissible: false))
          },
        );
      },
      staggeredTileBuilder: (int index) => new StaggeredTile.fit(1),
      mainAxisSpacing: 5.0,
      crossAxisSpacing: 5.0,
    );
  }
}
