import 'package:bestfranchise/Configs/routeConfig.dart';
import 'package:bestfranchise/Helpers/general/generalHelper.dart';
import 'package:bestfranchise/Views/component/general/backgroundIconComponent.dart';
import 'package:bestfranchise/Views/component/general/qrCodeComponent.dart';
import 'package:bestfranchise/Views/component/general/searchComponent.dart';
import 'package:bestfranchise/Views/component/general/touchEffectComponent.dart';
import 'package:bestfranchise/Views/component/home/rewardCardComponent.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_screen_scaler/flutter_screen_scaler.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shimmer/shimmer.dart';

class BaseLoading extends StatelessWidget {
  final double height;
  final double width;
  final double radius;

  BaseLoading({@required this.height, @required this.width, this.radius = 10});
  @override
  Widget build(BuildContext context) {
    ScreenScaler scale = ScreenScaler()..init(context);
    return Shimmer.fromColors(
      baseColor: Theme.of(context).unselectedWidgetColor,
      highlightColor: Colors.grey[100],
      enabled: true,
      child: Container(
        margin: scale.getMarginLTRB(0, 0, 0, 0.1),
        width: scale.getWidth(this.width),
        height: scale.getHeight(this.height),
        decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.all(Radius.circular(this.radius))),
      ),
    );
  }
}

class BaseLoadingLoop extends StatelessWidget {
  final Widget child;
  final int total;
  BaseLoadingLoop({this.child,this.total=10});
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        padding: EdgeInsets.zero,
        primary: false,
        shrinkWrap: true,
        itemBuilder: (context,index){
          return child;
        },
        separatorBuilder: (context,index){return Divider();},
        itemCount: this.total
    );
  }
}


class LoadingCardImageTitleSubTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ScreenScaler scale = ScreenScaler()..init(context);
    return Card(
      margin: scale.getMarginLTRB(0, 0, 0, 1),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      elevation: 1,
      child: Container(
        padding: scale.getPadding(0.5, 2),
        child: Row(
          children: [
            BaseLoading(height: 5, width: 12, radius: 100),
            SizedBox(width: scale.getWidth(2)),
            Expanded(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [],
                ),
                BaseLoading(height: 1, width: 50),
                BaseLoading(height: 1, width: 50),
              ],
            ))
          ],
        ),
      ),
    );
  }
}

class LoadingSlider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ScreenScaler scale = ScreenScaler()..init(context);
    return Stack(
      alignment: AlignmentDirectional.bottomEnd,
      children: <Widget>[
        CarouselSlider(
          options: CarouselOptions(
            autoPlay: true,
            autoPlayInterval: Duration(seconds: 5),
            viewportFraction: 1.0,
            // height: scale.getHeight(21),
          ),
          items: [
            Container(
              margin: scale.getMarginLTRB(0, 0, 0, 0),
              // height: scale.getHeight(25),
              child: Shimmer.fromColors(
                baseColor: Theme.of(context).unselectedWidgetColor,
                highlightColor: Colors.grey[100],
                enabled: true,
                child: Container(
                  width: scale.getWidth(100),
                  color: Colors.red,
                ),
              ),
            ),
          ],
        ),
        Positioned(
          bottom: 25,
          right: 10,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                width: 10.0,
                height: 3.0,
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(100),
                    ),
                    color: Theme.of(context).hintColor),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class LoadingReward extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ScreenScaler scale = ScreenScaler()..init(context);
    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: scale.getMarginLTRB(0, 21, 0, 0),
            padding: scale.getPadding(0, 2),
            child: Card(
              margin: EdgeInsets.zero,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              elevation: 1,
              child: Container(
                padding: scale.getPadding(1, 2),
                width: double.infinity,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: SearchComponent(hintText: ""),
                        ),
                        SizedBox(width: scale.getWidth(1)),
                        Card(
                          margin: EdgeInsets.zero,
                          elevation: 4,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(100.0),
                          ),
                          child: InTouchWidget(
                              radius: 100,
                              callback: () {
                                GeneralHelper.modal(
                                    context: context,
                                    child: Container(
                                      height: scale.getHeight(90),
                                      child: QrCodeComponent(),
                                    ));
                              },
                              child: Container(
                                padding: scale.getPadding(0.5,  1.1),
                                child: BackgroundIconComponent(
                                    child: Icon(
                                      FontAwesome5Solid.qrcode,
                                      color: Colors.white,
                                      size: scale.getTextSize(14),
                                    )
                                ),
                              )),
                        ),
                        SizedBox(width: scale.getWidth(1)),
                        Card(
                          margin: EdgeInsets.zero,
                          elevation: 4,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(100.0),
                          ),
                          child: InTouchWidget(
                              radius: 100,
                              callback: () => Navigator.of(context)
                                  .pushNamed(RoutePath.notifWidget),
                              child: Container(
                                padding: scale.getPadding(0.5,  1.1),
                                child: BackgroundIconComponent(
                                  child: Icon(
                                    FontAwesome5Solid.bell,
                                    color: Colors.white,
                                    size: scale.getTextSize(14),
                                  )
                                ),
                              )),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: scale.getHeight(1),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Shimmer.fromColors(
                          baseColor: Theme.of(context).unselectedWidgetColor,
                          highlightColor: Colors.grey[100],
                          enabled: true,
                          child: RewardCardComponent(
                              img: "poin", title: "Jumlah Poin", desc: ""),
                        ),
                        Shimmer.fromColors(
                          baseColor: Theme.of(context).unselectedWidgetColor,
                          highlightColor: Colors.grey[100],
                          enabled: true,
                          child: RewardCardComponent(
                              img: "poin", title: "Jumlah Poin", desc: ""),
                        ),
                        Shimmer.fromColors(
                          baseColor: Theme.of(context).unselectedWidgetColor,
                          highlightColor: Colors.grey[100],
                          enabled: true,
                          child: RewardCardComponent(
                              img: "poin", title: "Jumlah Poin", desc: ""),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ]);
  }
}

class LoadingCardRounded extends StatelessWidget {
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
        itemCount: 9,
        itemBuilder: (context, index) {
          return InTouchWidget(
              radius: 10,
              callback: () => Navigator.of(context).pushNamed(
                  RoutePath.detailBrandWidget,
                  arguments: {"id": ""}),
              child: Container(
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Shimmer.fromColors(
                      baseColor: Theme.of(context).unselectedWidgetColor,
                      highlightColor: Colors.grey[100],
                      enabled: true,
                      child: Container(
                        // height: scale.getHeight(12),
                        width: scale.getWidth(100),
                        color: Colors.red,
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
                        color: Colors.transparent,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Shimmer.fromColors(
                            baseColor: Theme.of(context).unselectedWidgetColor,
                            highlightColor: Colors.grey[100],
                            enabled: true,
                            child: Text(
                              "",
                              style: Theme.of(context)
                                  .textTheme
                                  .headline2
                                  .copyWith(color: Colors.white),
                            ),
                          ),
                          Shimmer.fromColors(
                            baseColor: Theme.of(context).unselectedWidgetColor,
                            highlightColor: Colors.grey[100],
                            enabled: true,
                            child: Text("",
                                maxLines: 2,
                                style: Theme.of(context)
                                    .textTheme
                                    .headline3
                                    .copyWith(color: Colors.white54)),
                          ),
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

class LoadingGridNine extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ScreenScaler scale = ScreenScaler()..init(context);
    return StaggeredGridView.countBuilder(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      // primary: true,
      physics: NeverScrollableScrollPhysics(),
      crossAxisCount: 3,
      itemCount: 9,
      itemBuilder: (BuildContext context, int index) {
        return Shimmer.fromColors(
          baseColor: Theme.of(context).unselectedWidgetColor,
          highlightColor: Colors.grey[100],
          enabled: true,
          child: Container(
            height: scale.getHeight(12),
            width: scale.getWidth(100),
            color: Colors.red,
          ),
        );
      },
      staggeredTileBuilder: (int index) => new StaggeredTile.fit(1),
      mainAxisSpacing: 5.0,
      crossAxisSpacing: 5.0,
    );
  }
}

class ProductBrandLoading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ScreenScaler scale = new ScreenScaler()..init(context);
    return new StaggeredGridView.countBuilder(
      primary: false,
      shrinkWrap: true,
      crossAxisCount: 4,
      staggeredTileBuilder: (int index) => new StaggeredTile.fit(2),
      mainAxisSpacing: 15.0,
      crossAxisSpacing: 15.0,
      padding: scale.getPadding(1, 2),
      itemBuilder: (context, index) {
        return Card(
            margin: scale.getMarginLTRB(0, 0, 0, 0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            // elevation: 0.5,
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  BaseLoading(height: 20, width: 100, radius: 10),
                  Padding(
                    padding: scale.getPadding(1, 2),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        BaseLoading(height: 1, width: 20, radius: 10),
                        BaseLoading(height: 1, width: 30, radius: 10),
                        BaseLoading(height: 1, width: 40, radius: 10),
                      ],
                    ),
                  )
                ],
              ),
            ));
      },
      itemCount: 10,
    );
  }
}

class LoadingCardImageCircular extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ScreenScaler scale = ScreenScaler()..init(context);
    return Container(
      height: scale.getHeight(5),
      child: ListView.separated(
        physics: ClampingScrollPhysics(),
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (context, index) {
          return Shimmer.fromColors(
              baseColor: Theme.of(context).unselectedWidgetColor,
              highlightColor: Colors.grey[100],
              enabled: true,
              child: CircleAvatar(
                radius: 32,
                backgroundColor: Colors.grey,
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
