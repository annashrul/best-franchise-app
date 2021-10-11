import 'package:bestfranchise/Configs/colorConfig.dart';
import 'package:bestfranchise/Configs/stringConfig.dart';
import 'package:bestfranchise/Controllers/news/listNewsController.dart';
import 'package:bestfranchise/Helpers/general/generalHelper.dart';
import 'package:bestfranchise/Views/component/general/touchEffectComponent.dart';
import 'package:bestfranchise/Views/component/home/bestPaketHematComponent.dart';
import 'package:bestfranchise/Views/component/news/sectionOneNewsComponent.dart';
import 'package:bestfranchise/Views/component/news/sectionThreeNewsComponent.dart';
import 'package:bestfranchise/Views/component/news/sectionTwoNewsComponent.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screen_scaler/flutter_screen_scaler.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';
import 'package:sticky_headers/sticky_headers.dart';

class NewsWidget extends StatefulWidget {
  @override
  _NewsWidgetState createState() => _NewsWidgetState();
}

class _NewsWidgetState extends State<NewsWidget>  with SingleTickerProviderStateMixin{

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    ScreenScaler scale= ScreenScaler()..init(context);
    final news = Provider.of<ListNewsController>(context);
    return Scaffold(
      appBar: GeneralHelper.appBarWithImage(context: context),
      body: ListView(
        children: [
          SizedBox(height: scale.getHeight(1)),
          Container(
            margin: scale.getMarginLTRB(2,0,0, 0),
            child: SectionOneNewsComponent(),
          ),
          StickyHeader(
            header:SectionTwoNewsComponent(),
            content:SectionThreeNewsComponent()
          ),
          SizedBox(height: scale.getHeight(10),child: CupertinoActivityIndicator()),
        ],
      ),
    );
  }
}
