import 'package:bestfranchise/Configs/colorConfig.dart';
import 'package:bestfranchise/Configs/routeConfig.dart';
import 'package:bestfranchise/Controllers/brand/favoriteBrandController.dart';
import 'package:bestfranchise/Controllers/brand/listBrandController.dart';
import 'package:bestfranchise/Helpers/general/generalHelper.dart';
import 'package:bestfranchise/Views/component/general/cardImageTitleSubtitleComponent.dart';
import 'package:bestfranchise/Views/component/general/loadingComponent.dart';
import 'package:bestfranchise/Views/component/general/modalAcitonComponent.dart';
import 'package:bestfranchise/Views/component/general/noDataComponent.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screen_scaler/flutter_screen_scaler.dart';
import 'package:provider/provider.dart';

class BrandFavoriteWidget extends StatefulWidget {
  @override
  _BrandFavoriteWidgetState createState() => _BrandFavoriteWidgetState();
}

class _BrandFavoriteWidgetState extends State<BrandFavoriteWidget> {
  ScrollController controller;
  void scrollListener() {
    final fav = Provider.of<FavoriteBrandController>(context, listen: false);
    if (!fav.isLoading) {
      if (controller.position.pixels == controller.position.maxScrollExtent) {
        fav.loadMore(context);
      }
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final fav = Provider.of<FavoriteBrandController>(context,listen: false);
    fav.loadData(context: context);
    controller = new ScrollController()..addListener(scrollListener);
  }
  @override
  void dispose() {
    super.dispose();
    controller.removeListener(scrollListener);
  }
  @override
  Widget build(BuildContext context) {
    ScreenScaler scale= ScreenScaler()..init(context);
    final fav = Provider.of<FavoriteBrandController>(context);
    final brand = Provider.of<ListBrandController>(context,listen: false);

    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: fav.isLoadMore?CupertinoActivityIndicator():SizedBox(),
      appBar: GeneralHelper.appBarGeneral(
        context: context,
        title: "Brand & Franchise Favoirte"
      ),
      body: fav.isLoading?BaseLoadingLoop(
        child: LoadingCardImageTitleSubTitle(),
      ):fav.favoriteBrandModel==null?NoDataComponent():ListView.separated(
          controller: controller,
          padding: scale.getPadding(1,2),
          primary: false,
          shrinkWrap: true,
          itemBuilder: (context,index){
            final val = fav.favoriteBrandModel.data[index];
            return CardImageTitleSubtitleComponent(
              img: val.logo,
              title: val.title,
              subTitle:val.caption,
              otherChild: Row(
                children: [
                  Text("Total Outlet : ${GeneralHelper().formatter.format(int.parse(val.totalOutlet))}",style: Theme.of(context).textTheme.headline3.copyWith(color: ColorConfig.greyPrimary,fontWeight: FontWeight.w600),),
                ],
              ),
              callback: (){
                GeneralHelper.modal(
                  context: context,
                  child: ModalActionComponent(
                    data: [
                      {"title":"Lihat detail brand","action":(){
                        brand.setIdBrand(val.id);
                        Navigator.of(context).pushNamed(RoutePath.detailBrandWidget,arguments: {
                          "id":val.id
                        });
                      }},
                      {"title":"Hapus favorite","action":()async{
                        await fav.delete(context: context,id: val.id);
                      }},
                    ],
                  )
                );

              },
            );
          },
          separatorBuilder: (context,index){return SizedBox();},
          itemCount:fav.favoriteBrandModel.data.length
      ),
    );
  }
}
