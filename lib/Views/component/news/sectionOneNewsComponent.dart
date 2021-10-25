import 'package:bestfranchise/Configs/routeConfig.dart';
import 'package:bestfranchise/Configs/stringConfig.dart';
import 'package:bestfranchise/Models/news/newsAllModel.dart';
import 'package:bestfranchise/Models/news/newsModel.dart';
import 'package:bestfranchise/Views/component/general/touchEffectComponent.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screen_scaler/flutter_screen_scaler.dart';

class SectionOneNewsComponent extends StatefulWidget {
  final NewsAllModel newsAllModel;
  SectionOneNewsComponent(this.newsAllModel);

  @override
  _SectionOneNewsComponentState createState() =>
      _SectionOneNewsComponentState();
}

class _SectionOneNewsComponentState extends State<SectionOneNewsComponent> {
  @override
  Widget build(BuildContext context) {
    ScreenScaler scale = ScreenScaler()..init(context);
    return Container(
      height: scale.getHeight(20),
      width: scale.getWidth(70),
      child: ListView.separated(
        padding: EdgeInsets.zero,
        physics: ClampingScrollPhysics(),
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: widget.newsAllModel.data.length,
        itemBuilder: (context, index) {
          final val = widget.newsAllModel.data[index];
          return InTouchWidget(
              radius: 10,
              callback: () {
                Navigator.of(context).pushNamed(RoutePath.detailNewsWidget,
                    arguments: {"id": val.id});
              },
              child: Container(
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        val.photo,
                        fit: BoxFit.cover,
                        width: scale.getWidth(70),
                      ),
                    ),
                    Container(
                      height: scale.getHeight(7),
                      padding: scale.getPadding(0.5, 2),
                      width: scale.getWidth(70),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(10),
                            bottomRight: Radius.circular(10)),
                        color: Colors.black54.withOpacity(0.7),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                              child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            // mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                val.title,
                                style: Theme.of(context)
                                    .textTheme
                                    .headline2
                                    .copyWith(color: Colors.white),
                              ),
                              Text(val.caption,
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline3
                                      .copyWith(color: Colors.white54))
                            ],
                          )),
                          SizedBox(width: scale.getWidth(1)),
                          Image.asset(StringConfig.imgLocal + "shareWhite.png")
                        ],
                      ),
                    )
                  ],
                ),
              ));
        },
        separatorBuilder: (context, index) {
          return SizedBox(
            width: scale.getWidth(1),
          );
        },
      ),
    );
  }
}
