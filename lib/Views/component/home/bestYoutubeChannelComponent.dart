import 'package:bestfranchise/Configs/stringConfig.dart';
import 'package:bestfranchise/Helpers/general/generalHelper.dart';
import 'package:bestfranchise/Models/Slider/sliderHomeYtModel.dart';
import 'package:bestfranchise/Views/component/general/touchEffectComponent.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screen_scaler/flutter_screen_scaler.dart';
import 'package:url_launcher/url_launcher.dart';

class BestYoutubeChannelComponent extends StatefulWidget {
  final List<Datum> valYt;
  BestYoutubeChannelComponent(this.valYt);

  @override
  _BestYoutubeChannelComponentState createState() =>
      _BestYoutubeChannelComponentState();
}

class _BestYoutubeChannelComponentState
    extends State<BestYoutubeChannelComponent> {
  @override
  Widget build(BuildContext context) {
    ScreenScaler scale = ScreenScaler()..init(context);

    return Container(
      margin: scale.getMarginLTRB(0, 0, 0, 0),
      height: scale.getHeight(19),
      width: scale.getWidth(40),
      child: ListView.separated(
        padding: EdgeInsets.zero,
        physics: ClampingScrollPhysics(),
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: widget.valYt.length,
        itemBuilder: (context, index) {
          final val = widget.valYt[index];
          return InTouchWidget(
              radius: 10,
              callback: () => GeneralHelper.jumpToBrowser(url: val.link),
              child: Container(
                width: scale.getWidth(40),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        val.banner,
                        fit: BoxFit.fitHeight,
                        width: scale.getWidth(40),
                        // height: scale.getHeight(15),
                      ),
                    ),
                    SizedBox(height: scale.getHeight(1)),
                    Padding(
                      padding: scale.getPadding(0, 0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            val.title,
                            style: Theme.of(context).textTheme.headline2,
                          ),
                          Text(
                            val.caption,
                            maxLines: 3,
                            style: Theme.of(context)
                                .textTheme
                                .headline3
                                .copyWith(color: Colors.black45),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ));
        },
        separatorBuilder: (context, index) {
          return SizedBox(width: scale.getWidth(1));
        },
      ),
    );
  }
}
