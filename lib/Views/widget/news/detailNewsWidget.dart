import 'package:bestfranchise/Configs/colorConfig.dart';
import 'package:bestfranchise/Configs/stringConfig.dart';
import 'package:bestfranchise/Controllers/news/newsController.dart';
import 'package:bestfranchise/Helpers/general/generalHelper.dart';
import 'package:bestfranchise/Views/component/general/loadingComponent.dart';
import 'package:bestfranchise/Views/component/general/noDataComponent.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screen_scaler/flutter_screen_scaler.dart';
import 'package:provider/provider.dart';

class DetailNewsWidget extends StatefulWidget {
  final dynamic obj;
  DetailNewsWidget({this.obj});
  @override
  _DetailNewsWidgetState createState() => _DetailNewsWidgetState();
}

class _DetailNewsWidgetState extends State<DetailNewsWidget> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final news = Provider.of<NewsController>(context, listen: false);
    news.loadNewsDet(context, widget.obj["id"]);
  }

  @override
  Widget build(BuildContext context) {
    ScreenScaler scale = ScreenScaler()..init(context);
    final news = Provider.of<NewsController>(context, listen: false);
    // final val = news.newsDetModel.data;
    return Scaffold(
      appBar: GeneralHelper.appBarGeneral(
          context: context,
          title: news.newsDetModel == null
              ? "Loading"
              : news.newsDetModel.data.title),
      body: news.isLoadingDet
          ? LoadingNewsDetail()
          : news.newsDetModel == null
              ? NoDataComponent()
              : Stack(
                  children: [
                    Image.network(
                      news.newsDetModel.data.photo,
                      fit: BoxFit.cover,
                      alignment: Alignment.center,
                      width: scale.getWidth(100),
                    ),
                    Container(
                      margin: scale.getMarginLTRB(0, 20, 0, 0),
                      height: scale.getHeight(70),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                          )),
                      child: ListView(
                        shrinkWrap: true,
                        padding: scale.getPadding(1, 2),
                        children: [
                          Text(
                            news.newsDetModel.data.title,
                            style: Theme.of(context).textTheme.headline2,
                          ),
                          SizedBox(height: scale.getHeight(1)),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                padding: scale.getPadding(0.5, 2),
                                decoration: BoxDecoration(
                                    color: ColorConfig.redPrimary,
                                    borderRadius: BorderRadius.circular(10)),
                                child: Text(
                                  "Kontibutor : " + news.newsDetModel.data.user,
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline2
                                      .copyWith(color: Colors.white),
                                ),
                              ),
                              Text(
                                  "Admin, " +
                                      GeneralHelper.myDate(
                                          news.newsDetModel.data.createdAt),
                                  style: Theme.of(context).textTheme.headline3)
                            ],
                          ),
                          SizedBox(height: scale.getHeight(1)),
                          Text(
                            news.newsDetModel.data.caption,
                            style: Theme.of(context)
                                .textTheme
                                .headline3
                                .copyWith(color: ColorConfig.greyPrimary),
                            textAlign: TextAlign.justify,
                          )
                        ],
                      ),
                    )
                  ],
                ),
    );
  }
}
