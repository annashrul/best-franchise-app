import 'package:bestfranchise/Configs/colorConfig.dart';
import 'package:bestfranchise/Configs/routeConfig.dart';
import 'package:bestfranchise/Controllers/brand/detailBrandController.dart';
import 'package:bestfranchise/Controllers/brand/listBrandController.dart';
import 'package:bestfranchise/Controllers/category/categoryBrandController.dart';
import 'package:bestfranchise/Helpers/general/generalHelper.dart';
import 'package:bestfranchise/Views/component/general/cardImageTitleSubtitleComponent.dart';
import 'package:bestfranchise/Views/component/general/loadingComponent.dart';
import 'package:bestfranchise/Views/component/general/noDataComponent.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screen_scaler/flutter_screen_scaler.dart';
import 'package:provider/provider.dart';

class BrandWidget extends StatefulWidget {
  @override
  _BrandWidgetState createState() => _BrandWidgetState();
}

class _BrandWidgetState extends State<BrandWidget> with SingleTickerProviderStateMixin  {

  TabController _tabController;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
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
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final category = Provider.of<CategoryBrandController>(context,listen: false);
      category.loadCategoryBrand(context: context).then((value){
        final brand = Provider.of<ListBrandController>(context,listen: false);
        brand.setCategoryBrand(context,category.categoryBrandModel.data[0].id);
        brand.loadBrand(context: context);
      });

      controller = new ScrollController()..addListener(scrollListener);
      final detail = Provider.of<DetailBrandController>(context,listen: false);
      detail.setIndexTabActive(0);
    });
  }


  @override
  Widget build(BuildContext context) {
    ScreenScaler scale= ScreenScaler()..init(context);
    final brand = Provider.of<ListBrandController>(context);
    final category = Provider.of<CategoryBrandController>(context);
    List dataTab = [];
    List<Widget> tabView = [];
    int lengthCategory=category.isLoading?1:category.categoryBrandModel==null?0:category.categoryBrandModel.data.length;
    for(int i=0;i<lengthCategory;i++){
      dataTab.add({"title":category.isLoading?"loading ..":category.categoryBrandModel.data[i].title});
      tabView.add(brand.isLoading?BaseLoadingLoop(child: LoadingCardImageTitleSubTitle()):brand.listBrandModel==null?NoDataComponent():buildContent(context));
    }
    return DefaultTabController(
        initialIndex:  0,
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
            dataTab: dataTab,
            callback: (i){
              brand.setCategoryBrand(context,category.categoryBrandModel.data[i].id);
            }
          ),
          body: brand.isLoading?BaseLoadingLoop(child: LoadingCardImageTitleSubTitle()):brand.listBrandModel==null?NoDataComponent():TabBarView(
            physics: NeverScrollableScrollPhysics(),
            children:tabView,
          ),
        )
    );
  }
  Widget buildContent(BuildContext context){
    final brand = Provider.of<ListBrandController>(context);
    ScreenScaler scale= ScreenScaler()..init(context);


    return ListView.builder(
      padding: scale.getPadding(1,2),
        controller: controller,
        itemBuilder: (context,index){
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
              brand.setIdBrand(val.id);
              Navigator.of(context).pushNamed(RoutePath.detailBrandWidget,arguments: {
                "id":val.id
              });
            },
          );
        },
        itemCount:brand.listBrandModel.data.length
    );
  }
}
