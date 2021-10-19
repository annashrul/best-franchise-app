import 'package:bestfranchise/Configs/colorConfig.dart';
import 'package:bestfranchise/Models/Slider/sliderHomeTestiModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screen_scaler/flutter_screen_scaler.dart';

class BestTestimoniComponent extends StatefulWidget {
  final List<Datum> valTs;
  BestTestimoniComponent(this.valTs);

  @override
  _BestTestimoniComponentState createState() => _BestTestimoniComponentState();
}

class _BestTestimoniComponentState extends State<BestTestimoniComponent> {
  @override
  Widget build(BuildContext context) {
    ScreenScaler scale = ScreenScaler()..init(context);

    return Container(
      margin: scale.getMarginLTRB(0, 0, 0, 0),
      height: scale.getHeight(20),
      child: ListView.separated(
        padding: EdgeInsets.zero,
        physics: ClampingScrollPhysics(),
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: widget.valTs.length,
        itemBuilder: (context, index) {
          final val = widget.valTs[index];
          return Container(
            margin: EdgeInsets.only(right: 1),
            width: scale.getWidth(40),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                color: Colors.white,
                border: Border.all(color: Colors.grey[200])),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundImage: NetworkImage(val.photo),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: List.generate(
                      val.rating,
                      (index) => Icon(
                            Icons.star,
                            size: scale.getTextSize(9),
                            color: Colors.yellow,
                          )),
                ),
                Container(
                  padding: scale.getPadding(0, 1),
                  child: Text(
                    val.caption,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 3,
                    textAlign: TextAlign.center,
                    style: Theme.of(context)
                        .textTheme
                        .headline3
                        .copyWith(color: ColorConfig.greyPrimary),
                  ),
                )
              ],
            ),
          );
        },
        separatorBuilder: (context, index) {
          return SizedBox(width: scale.getWidth(1));
        },
      ),
    );
  }
}
