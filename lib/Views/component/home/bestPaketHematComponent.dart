import 'package:bestfranchise/Configs/routeConfig.dart';
import 'package:bestfranchise/Configs/stringConfig.dart';
import 'package:bestfranchise/Models/Slider/sliderHomePaketHematModel.dart';
import 'package:bestfranchise/Views/component/general/touchEffectComponent.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screen_scaler/flutter_screen_scaler.dart';

class BestPaketHemat extends StatefulWidget {
  final List<Datum> valPh;
  BestPaketHemat(this.valPh);

  @override
  _BestPaketHematState createState() => _BestPaketHematState();
}

class _BestPaketHematState extends State<BestPaketHemat> {
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
        itemCount: widget.valPh.length,
        itemBuilder: (context, index) {
          final val = widget.valPh[index];
          return InTouchWidget(
              radius: 10,
              callback: () => Navigator.of(context).pushNamed(
                  RoutePath.detailBrandWidget,
                  arguments: {"id": val.idRoute}),
              child: Container(
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        val.banner,
                        fit: BoxFit.fill,
                        width: scale.getWidth(80),
                      ),
                    ),
                    Container(
                      height: scale.getHeight(6.5),
                      padding: scale.getPadding(0.5, 2),
                      width: scale.getWidth(80),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(10),
                            bottomRight: Radius.circular(10)),
                        color: Colors.black54.withOpacity(0.9),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            val.title,
                            style: Theme.of(context)
                                .textTheme
                                .headline2
                                .copyWith(color: Colors.white),
                          ),
                          Text(val.caption,
                              maxLines: 2,
                              style: Theme.of(context)
                                  .textTheme
                                  .headline3
                                  .copyWith(color: Colors.white54))
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
