import 'package:bestfranchise/Configs/colorConfig.dart';
import 'package:bestfranchise/Configs/routeConfig.dart';
import 'package:bestfranchise/Helpers/general/generalHelper.dart';
import 'package:bestfranchise/Views/component/general/cardImageTitleSubtitleComponent.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screen_scaler/flutter_screen_scaler.dart';

class BrandFavoriteWidget extends StatefulWidget {
  @override
  _BrandFavoriteWidgetState createState() => _BrandFavoriteWidgetState();
}

class _BrandFavoriteWidgetState extends State<BrandFavoriteWidget> {
  @override
  Widget build(BuildContext context) {
    ScreenScaler scale= ScreenScaler()..init(context);

    return Scaffold(
      appBar: GeneralHelper.appBarGeneral(
        context: context,
        title: "Brand & Franchise Favoirte"
      ),
      body: ListView.separated(
          padding: scale.getPadding(1,2),
          primary: false,
          shrinkWrap: true,
          itemBuilder: (context,index){
            return CardImageTitleSubtitleComponent(
              img: "",
              title: "Burhot",
              subTitle: "Menu Favorit dari brand ini adalah burger gokil Sejak 2012",
              otherChild: Row(
                children: [
                  Text("Total Outlet : 10",style: Theme.of(context).textTheme.headline3.copyWith(color: ColorConfig.greyPrimary),),
                ],
              ),
              callback: (){
                Navigator.of(context).pushNamed(RoutePath.detailBrandWidget,arguments: {
                  "id":""
                });
              },
            );
          },
          separatorBuilder: (context,index){return SizedBox();},
          itemCount: 10
      ),
    );
  }
}
