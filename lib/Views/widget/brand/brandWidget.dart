import 'package:bestfranchise/Configs/colorConfig.dart';
import 'package:bestfranchise/Configs/routeConfig.dart';
import 'package:bestfranchise/Helpers/general/generalHelper.dart';
import 'package:bestfranchise/Views/component/general/cardImageTitleSubtitleComponent.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screen_scaler/flutter_screen_scaler.dart';

class BrandWidget extends StatefulWidget {
  @override
  _BrandWidgetState createState() => _BrandWidgetState();
}

class _BrandWidgetState extends State<BrandWidget> {
  @override
  Widget build(BuildContext context) {
    List dataTab = [{"title":"Minuman"},{"title":"Makanan"},{"title":"Retail"},{"title":"Otomotif"},{"title":"Jasa"}];
    List<Widget> tabView = [];
    for(int i=0;i<dataTab.length;i++){
      tabView.add(buildContent());
    }
    return DefaultTabController(
        length: dataTab.length,
        child: Scaffold(
          appBar: GeneralHelper.appBarWithTab(
              context: context,
              title: "BEST Brand & Franchise",
              dataTab: dataTab
          ),
          body: TabBarView(
            children:tabView,
          ),
        )
    );
  }
  Widget buildContent(){
    ScreenScaler scale= ScreenScaler()..init(context);
    return ListView.separated(
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
    );
  }
}
