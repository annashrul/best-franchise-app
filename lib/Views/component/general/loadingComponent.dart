import 'package:flutter/material.dart';
import 'package:flutter_screen_scaler/flutter_screen_scaler.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:shimmer/shimmer.dart';


class BaseLoading extends StatelessWidget {
  final double height;
  final double width;
  final double radius;

  BaseLoading({@required this.height,@required this.width,this.radius=10});
  @override
  Widget build(BuildContext context) {
    ScreenScaler scale = ScreenScaler()..init(context);
    return Shimmer.fromColors(
      baseColor: Theme.of(context).unselectedWidgetColor,
      highlightColor: Colors.grey[100],
      enabled: true,
      child: Container(
        margin: scale.getMarginLTRB(0, 0,0,0.1),
        width:scale.getWidth(this.width),
        height: scale.getHeight(this.height),
        decoration: BoxDecoration(
            color:Colors.grey[200],
            borderRadius: BorderRadius.all(Radius.circular(this.radius))
        ),
      ),
    );

  }
}



class LoadingCardImageTitleSubTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ScreenScaler scale= ScreenScaler()..init(context);
    return Card(
      margin:scale.getMarginLTRB(0,0,0,1),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      elevation: 1,
      child: Container(
        padding: scale.getPadding(0.5,2),
        child: Row(
          children: [
            BaseLoading(height:5, width:12,radius: 100),
            SizedBox(width: scale.getWidth(2)),
            Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                      ],
                    ),
                    BaseLoading(height:1, width:50),
                    BaseLoading(height:1, width:50),
                  ],
                )
            )
          ],
        ),
      ),
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
      padding: scale.getPadding(1,2),
      itemBuilder: (context,index){
        return Card(
          margin:scale.getMarginLTRB(0,0,0,0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          // elevation: 0.5,
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                BaseLoading(height: 20, width: 100,radius: 10),
                Padding(
                  padding: scale.getPadding(1,2),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BaseLoading(height: 1, width: 20,radius: 10),
                      BaseLoading(height: 1, width: 30,radius: 10),
                      BaseLoading(height: 1, width: 40,radius: 10),
                    ],
                  ),
                )
              ],
            ),
          )
        );
      },
      itemCount: 10,
    );
  }
}


