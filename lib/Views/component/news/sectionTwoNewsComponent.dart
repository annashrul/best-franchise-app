import 'package:bestfranchise/Configs/colorConfig.dart';
import 'package:bestfranchise/Controllers/news/listNewsController.dart';
import 'package:bestfranchise/Controllers/news/newsController.dart';
import 'package:bestfranchise/Models/news/newsCatModel.dart';
import 'package:bestfranchise/Views/component/general/loadingComponent.dart';
import 'package:bestfranchise/Views/component/general/noDataComponent.dart';
import 'package:bestfranchise/Views/component/general/stickyHeaderComponent.dart';
import 'package:bestfranchise/Views/component/general/touchEffectComponent.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screen_scaler/flutter_screen_scaler.dart';
import 'package:provider/provider.dart';

class SectionTwoNewsComponent extends StatefulWidget {
  final NewsCatModel newsCatModel;
  SectionTwoNewsComponent(this.newsCatModel);

  @override
  _SectionTwoNewsComponentState createState() =>
      _SectionTwoNewsComponentState();
}

class _SectionTwoNewsComponentState extends State<SectionTwoNewsComponent> {
  @override
  Widget build(BuildContext context) {
    ScreenScaler scale = ScreenScaler()..init(context);
    final news = Provider.of<NewsController>(context);
    List dataTab = [];
    List<Widget> tabView = [];
    int lengthCategory = news.isLoadingCat
        ? 1
        : news.newsCatModel == null
            ? 0
            : news.newsCatModel.data.length;
    dataTab.add({"title": "Semua"});
    for (int i = 0; i < lengthCategory; i++) {
      dataTab.add({
        "title": news.isLoading ? "loading .." : news.newsCatModel.data[i].title
      });
    }
    return StickyHeaderComponent(
      data: dataTab,
      callback: (index) {
        news.loadNewsCat(context, index,
            index == 0 ? "" : news.newsCatModel.data[index - 1].id);
      },
      indexActive: news.indexCategoryActive,
    );
    // Container(
    //   height: scale.getHeight(5),
    //   child: ListView.separated(
    //       itemCount: widget.newsCatModel.data.length,
    //       padding: scale.getPadding(0, 0),
    //       scrollDirection: Axis.horizontal,
    //       shrinkWrap: true,
    //       separatorBuilder: (context, index) {
    //         return SizedBox();
    //       },
    //       itemBuilder: (context, index) {
    //         final val = widget.newsCatModel.data[index];
    //         return InTouchWidget(
    //             callback: () {
    //               news.loadNewsCat(context, index, val.id);
    //             },
    //             child: Wrap(
    //               children: [
    //                 Container(
    //                   padding: scale.getPadding(1, 0),
    //                   decoration: BoxDecoration(
    //                       color: Colors.white,
    //                       border: Border(
    //                           bottom: BorderSide(
    //                         color: index == news.indexCategoryActive
    //                             ? ColorConfig.redPrimary
    //                             : ColorConfig.greyPrimary,
    //                         width:
    //                             index == news.indexCategoryActive ? 3.0 : 0.0,
    //                       ))),
    //                   child: Container(
    //                     margin: scale.getMargin(0, 1),
    //                     child: Text(val.title,
    //                         style: Theme.of(context)
    //                             .textTheme
    //                             .headline2
    //                             .copyWith(
    //                                 color: index == news.indexCategoryActive
    //                                     ? ColorConfig.redPrimary
    //                                     : ColorConfig.greyPrimary)),
    //                   ),
    //                 ),
    //               ],
    //             ));
    //       }),
    // );
  }
}
