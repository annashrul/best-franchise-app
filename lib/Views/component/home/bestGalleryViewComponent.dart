import 'package:bestfranchise/Models/Slider/galleryHomeModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screen_scaler/flutter_screen_scaler.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

class BestGalleryViewComponent extends StatefulWidget {
  final String valGl;
  final List<Datum> galleryItems;
  final int index;
  BestGalleryViewComponent(this.valGl, this.galleryItems, this.index);

  @override
  _BestGalleryViewComponentState createState() =>
      _BestGalleryViewComponentState();
}

class _BestGalleryViewComponentState extends State<BestGalleryViewComponent> {
  @override
  Widget build(BuildContext context) {
    ScreenScaler scale = ScreenScaler()..init(context);
    return Container(
      // height: scale.getHeight(context),
      // margin: EdgeInsets.only(left: 15, right: 15),
      // width: scale.getWidth(context),
      child: PhotoViewGallery.builder(
        itemCount: widget.galleryItems.length,
        builder: (context, index) {
          return PhotoViewGalleryPageOptions(
            imageProvider: NetworkImage(
              widget.galleryItems[index].photo,
            ),
            minScale: PhotoViewComputedScale.contained * 0.8,
            maxScale: PhotoViewComputedScale.covered * 2,
          );
        },
        scrollPhysics: BouncingScrollPhysics(),
        backgroundDecoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          color: Theme.of(context).canvasColor,
        ),
        enableRotation: true,
        pageController: PageController(initialPage: widget.index),
        loadingBuilder: (context, event) => Center(
          child: Container(
            width: 30.0,
            height: 30.0,
            child: CircularProgressIndicator(
              backgroundColor: Colors.orange,
              value: event == null
                  ? 0
                  : event.cumulativeBytesLoaded / event.expectedTotalBytes,
            ),
          ),
        ),
      ),
    );
  }
}
