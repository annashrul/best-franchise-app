import 'package:bestfranchise/Configs/colorConfig.dart';
import 'package:bestfranchise/Configs/stringConfig.dart';
import 'package:bestfranchise/Controllers/brand/listBrandController.dart';
import 'package:bestfranchise/Helpers/general/generalHelper.dart';
import 'package:bestfranchise/Views/component/general/cardImageTitleSubtitleComponent.dart';
import 'package:bestfranchise/Views/component/general/loadingComponent.dart';
import 'package:bestfranchise/Views/component/general/noDataComponent.dart';
import 'package:bestfranchise/Views/component/general/searchComponent.dart';
import 'package:bestfranchise/Views/component/general/touchEffectComponent.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screen_scaler/flutter_screen_scaler.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class ModalBrandComponent extends StatefulWidget {
  final void Function(dynamic data) callback;
  ModalBrandComponent({this.callback});
  @override
  _ModalBrandComponentState createState() => _ModalBrandComponentState();
}

class _ModalBrandComponentState extends State<ModalBrandComponent> {
  ScrollController controller;
  void scrollListener() {
    final product = Provider.of<ListBrandController>(context, listen: false);
    if (!product.isLoadingModal) {
      if (controller.position.pixels == controller.position.maxScrollExtent) {
        product.loadMoreModalBrand(context);
      }
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final brand = Provider.of<ListBrandController>(context,listen: false);
    brand.loadBrandModal(context: context);
    controller = new ScrollController()..addListener(scrollListener);


  }
  @override
  void dispose() {
    super.dispose();
    controller.removeListener(scrollListener);

  }


  @override
  Widget build(BuildContext context) {
    ScreenScaler scale = new ScreenScaler()..init(context);
    final brand = Provider.of<ListBrandController>(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.transparent,
      floatingActionButton: brand.isLoadMoreModal?CupertinoActivityIndicator():SizedBox(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body:Padding(
        padding: scale.getPaddingLTRB(2,1,2,0),
        child: Column(
          children: [
            SearchComponent(
              hintText: "Cari brand disini ..",
              callback: (e){
                brand.setAnySearchBrandModal(context, e);
              },
            ),
            SizedBox(height: scale.getHeight(1)),
            brand.isLoadingModal?BaseLoadingLoop(
              total: 5,
              child: LoadingCardImageTitleSubTitle(),
            ):brand.modalBrandModel==null?NoDataComponent():Expanded(
              child: ListView.separated(
                  controller: controller,
                  itemBuilder: (context,index){
                    final val=brand.modalBrandModel.data[index];
                    return CardImageTitleSubtitleComponent(
                      img: val.logo,
                      title: val.title,
                      subTitle: val.caption,
                      otherChild: Row(
                        children: [
                          Text("Total Outlet : ${val.totalOutlet}",style: Theme.of(context).textTheme.headline3.copyWith(color: ColorConfig.greyPrimary),),
                        ],
                      ),
                      callback: (){
                        widget.callback(val.toJson());
                        Navigator.of(context).pop();
                      },
                    );
                  },
                  separatorBuilder:  (context,index){return SizedBox();},
                  itemCount: brand.modalBrandModel.data.length
              ),
            )
          ],
        ),
      ),
    );

  }
}
