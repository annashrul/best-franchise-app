import 'package:bestfranchise/Configs/routeConfig.dart';
import 'package:bestfranchise/Configs/stringConfig.dart';
import 'package:bestfranchise/Helpers/general/generalHelper.dart';
import 'package:bestfranchise/Models/news/newsModel.dart';
import 'package:bestfranchise/Views/component/general/touchEffectComponent.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screen_scaler/flutter_screen_scaler.dart';
import 'package:share/share.dart';

class SectionThreeNewsComponent extends StatefulWidget {
  final NewsModel newsModel;
  SectionThreeNewsComponent(this.newsModel);

  @override
  _SectionThreeNewsComponentState createState() =>
      _SectionThreeNewsComponentState();
}

class _SectionThreeNewsComponentState extends State<SectionThreeNewsComponent> {
  @override
  Widget build(BuildContext context) {
    ScreenScaler scale = ScreenScaler()..init(context);
    return ListView.separated(
      padding: scale.getPadding(1, 2),
      primary: false,
      shrinkWrap: true,
      itemCount: widget.newsModel.data.length,
      itemBuilder: (BuildContext context, int index) {
        final val = widget.newsModel.data[index];
        return InTouchWidget(
            radius: 10,
            callback: () {
              Navigator.of(context).pushNamed(RoutePath.detailNewsWidget,
                  arguments: {"id": val.id});
            },
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                  border: Border.all(color: Colors.grey[200], width: 1)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    child: Image.network(
                      val.photo,
                      height: scale.getHeight(16),
                      width: scale.getWidth(40),
                      fit: BoxFit.fitHeight,
                    ),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        bottomLeft: Radius.circular(10)),
                  ),
                  Expanded(
                      child: Padding(
                    padding: scale.getPadding(1, 2),
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
                          style: Theme.of(context)
                              .textTheme
                              .headline3
                              .copyWith(color: Colors.black45),
                        ),
                        SizedBox(height: scale.getHeight(1)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            InkWell(
                                onTap: () {
                                  Share.shareFiles([val.photo],
                                      subject: val.title);
                                },
                                child: Image.asset(
                                    StringConfig.imgLocal + "shareWhite.png")),
                            Text(
                              val.user +
                                  " : " +
                                  GeneralHelper.myDate(val.createdAt),
                              style: Theme.of(context).textTheme.headline3,
                            ),
                          ],
                        )
                      ],
                    ),
                  )),
                ],
              ),
            ));
      },
      separatorBuilder: (context, index) {
        return SizedBox(height: scale.getHeight(1));
      },
    );
  }
}
