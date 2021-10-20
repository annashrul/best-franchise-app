import 'package:bestfranchise/Configs/colorConfig.dart';
import 'package:bestfranchise/Configs/routeConfig.dart';
import 'package:bestfranchise/Controllers/brand/listBrandController.dart';
import 'package:bestfranchise/Helpers/general/generalHelper.dart';
import 'package:bestfranchise/Views/component/general/cardImageTitleSubtitleComponent.dart';
import 'package:bestfranchise/Views/component/general/loadingComponent.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screen_scaler/flutter_screen_scaler.dart';
import 'package:provider/provider.dart';

class BrandWidget extends StatefulWidget {
  @override
  _BrandWidgetState createState() => _BrandWidgetState();
}

class _BrandWidgetState extends State<BrandWidget> {
  ScrollController controller;
  void scrollListener() {
    final brand = Provider.of<ListBrandController>(context, listen: false);
    if (!brand.isLoading) {
      if (controller.position.pixels == controller.position.maxScrollExtent) {
        brand.loadMoreBrand(context);
      }
    }
  }
  @override
  void dispose() {
    super.dispose();
    controller.removeListener(scrollListener);
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final brand = Provider.of<ListBrandController>(context,listen: false);
    brand.loadBrand(context: context);
    controller = new ScrollController()..addListener(scrollListener);
  }


  @override
  Widget build(BuildContext context) {
    List dataTab = [{"title":"Minuman"},{"title":"Makanan"},{"title":"Retail"},{"title":"Otomotif"},{"title":"Jasa"}];
    List<Widget> tabView = [];
    for(int i=0;i<dataTab.length;i++){
      tabView.add(buildContent());
    }
    ScreenScaler scale= ScreenScaler()..init(context);
    final brand = Provider.of<ListBrandController>(context);

    return DefaultTabController(
        length: dataTab.length,
        child: Scaffold(
          floatingActionButton: brand.isLoadMore?Padding(
            padding: scale.getPadding(1, 0),
            child: CupertinoActivityIndicator(),
          ):SizedBox(),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
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
    final brand = Provider.of<ListBrandController>(context);
    ScreenScaler scale= ScreenScaler()..init(context);
    return ListView.separated(
      padding: scale.getPadding(1,2),
        primary: false,
        shrinkWrap: true,
        itemBuilder: (context,index){
          if(brand.isLoading){
            return LoadingCardImageTitleSubTitle();
          }
          final val = brand.listBrandModel.data[index];
          return CardImageTitleSubtitleComponent(
            img: val.logo,
            title:val.title,
            subTitle: val.caption,
            otherChild: Row(
              children: [
                Text("Total Outlet : ${val.totalOutlet}",style: Theme.of(context).textTheme.headline3.copyWith(color: ColorConfig.greyPrimary),),
              ],
            ),
            callback: (){
              Navigator.of(context).pushNamed(RoutePath.detailBrandWidget,arguments: {
                "id":val.id
              });
            },
          );
        },
        separatorBuilder: (context,index){return SizedBox();},
        itemCount: brand.isLoading?10:brand.listBrandModel.data.length
    );
  }
}
