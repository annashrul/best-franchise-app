import 'package:bestfranchise/Controllers/news/listNewsController.dart';
import 'package:bestfranchise/Controllers/news/newsController.dart';
import 'package:bestfranchise/Helpers/general/generalHelper.dart';
import 'package:bestfranchise/Views/component/general/loadingComponent.dart';
import 'package:bestfranchise/Views/component/general/noDataComponent.dart';
import 'package:bestfranchise/Views/component/news/sectionOneNewsComponent.dart';
import 'package:bestfranchise/Views/component/news/sectionThreeNewsComponent.dart';
import 'package:bestfranchise/Views/component/news/sectionTwoNewsComponent.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screen_scaler/flutter_screen_scaler.dart';
import 'package:provider/provider.dart';
import 'package:sticky_headers/sticky_headers.dart';

class NewsWidget extends StatefulWidget {
  @override
  _NewsWidgetState createState() => _NewsWidgetState();
}

class _NewsWidgetState extends State<NewsWidget>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final news = Provider.of<NewsController>(context, listen: false);
    news.loadNews(context, null);
    news.loadNewsAll(context, null);
    news.loadNewsCat(context, 0, null);
  }

  @override
  Widget build(BuildContext context) {
    ScreenScaler scale = ScreenScaler()..init(context);
    final news = Provider.of<NewsController>(context);
    return Scaffold(
      appBar: GeneralHelper.appBarWithImage(context: context),
      body: ListView(
        children: [
          SizedBox(height: scale.getHeight(1)),
          Container(
            margin: scale.getMarginLTRB(2, 0, 0, 0),
            child: news.isLoading
                ? LoadingCardRounded()
                : news.newsAllModel == null
                    ? NoDataComponent()
                    : SectionOneNewsComponent(news.newsAllModel),
          ),
          StickyHeader(
              header: SectionTwoNewsComponent(news.newsCatModel),
              content: news.isLoading
                  ? BaseLoadingLoop(
                      child: LoadingCardRounded(),
                    )
                  : news.newsModel == null
                      ? NoDataComponent()
                      : SectionThreeNewsComponent(news.newsModel)),
          SizedBox(
              height: scale.getHeight(10), child: CupertinoActivityIndicator()),
        ],
      ),
    );
  }
}
