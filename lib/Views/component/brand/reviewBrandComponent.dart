import 'package:bestfranchise/Configs/colorConfig.dart';
import 'package:bestfranchise/Controllers/brand/reviewBrandController.dart';
import 'package:bestfranchise/Helpers/general/generalHelper.dart';
import 'package:bestfranchise/Views/component/general/cardImageTitleSubtitleComponent.dart';
import 'package:bestfranchise/Views/component/general/loadingComponent.dart';
import 'package:bestfranchise/Views/component/general/noDataComponent.dart';
import 'package:bestfranchise/Views/component/general/titleComponent.dart';
import 'package:bestfranchise/Views/component/general/touchEffectComponent.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screen_scaler/flutter_screen_scaler.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class ReviewBrandComponent extends StatefulWidget {
  final String idBrand;
  ReviewBrandComponent({this.idBrand});
  @override
  _ReviewBrandComponentState createState() => _ReviewBrandComponentState();
}

class _ReviewBrandComponentState extends State<ReviewBrandComponent> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final reviewBrand = Provider.of<ReviewBrandController>(context,listen: false);
    reviewBrand.loadReviewBrand(context: context,idBrand: widget.idBrand);
    initializeDateFormatting('id');


  }

  @override
  Widget build(BuildContext context) {
    ScreenScaler scale = new ScreenScaler()..init(context);
    final reviewBrand = Provider.of<ReviewBrandController>(context);
    if(reviewBrand.isLoading){
      return BaseLoadingLoop(child: LoadingCardImageTitleSubTitle());
    }
    if(reviewBrand.reviewBrandModel==null){
      return NoDataComponent();
    }
    return Column(
      children: [
        SizedBox(height: scale.getHeight(0.5),),
        Padding(
          padding: scale.getPadding(0,2),
          child:  TitleComponent(
            callback: (){
              if(reviewBrand.reviewBrandModel.data.length>4){
                GeneralHelper.modalGeneral(
                    context: context,
                    child: Container(
                      height: scale.getHeight(70),
                      child: ModalAllReviewComponentBrand(idBrand: widget.idBrand),
                    )
                );
              }

            },
            title: "Review Terbaru",
          ),
        ),
        ListView.separated(
            padding: scale.getPadding(1,2),
            primary: false,
            shrinkWrap: true,
            itemBuilder: (context,index){
              final val = reviewBrand.reviewBrandModel.data[index];
              return CardImageTitleSubtitleComponent(
                img: val.photo,
                title: val.member,
                subTitle: val.message,
                otherChild: Align(
                  alignment: Alignment.centerRight,
                  child: Text("${DateFormat.yMMMMEEEEd('id').format(DateTime.now())}",style: Theme.of(context).textTheme.headline3.copyWith(color: ColorConfig.greyPrimary),),
                ),
                callback: (){},
              );
            },
            separatorBuilder: (context,index){return SizedBox();},
            itemCount: reviewBrand.reviewBrandModel.data.length
        )
      ],
    );
  }
}

class ModalAllReviewComponentBrand extends StatefulWidget {
  final String idBrand;
  ModalAllReviewComponentBrand({this.idBrand});
  @override
  _ModalAllReviewComponentBrandState createState() => _ModalAllReviewComponentBrandState();
}

class _ModalAllReviewComponentBrandState extends State<ModalAllReviewComponentBrand> {
  ScrollController controller;
  void scrollListener() {
    final review = Provider.of<ReviewBrandController>(context, listen: false);
    if (!review.isLoadingAllReviewBrand) {
      if (controller.position.pixels == controller.position.maxScrollExtent) {
        review.loadMoreAllReviewBrand(context,widget.idBrand);
      }
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final review = Provider.of<ReviewBrandController>(context,listen: false);
    review.loadAllReviewBrand(context: context,idBrand: widget.idBrand);
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
    final review = Provider.of<ReviewBrandController>(context);
    return Scaffold(
      appBar: GeneralHelper.appBarGeneral(context: context,title: "Semua Review"),
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.transparent,
      floatingActionButton: review.isLoadMoreAllReviewBrand?CupertinoActivityIndicator():SizedBox(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body:review.isLoadingAllReviewBrand?BaseLoadingLoop(
        child: LoadingCardImageTitleSubTitle(),
      ):review.allReviewBrandModel==null?NoDataComponent():ListView.separated(
          padding: scale.getPadding(1,2),
          controller: controller,
          itemBuilder: (context,index){

            final val = review.allReviewBrandModel.data[index];
            return CardImageTitleSubtitleComponent(
              img: val.photo,
              title: val.member,
              subTitle: val.message,
              otherChild: Align(
                alignment: Alignment.centerRight,
                child: Text("${DateFormat.yMMMMEEEEd('id').format(DateTime.now())}",style: Theme.of(context).textTheme.headline3.copyWith(color: ColorConfig.greyPrimary),),
              ),
              callback: (){},
            );
          },
          separatorBuilder: (context,index){return SizedBox();},
          itemCount:review.allReviewBrandModel.data.length
      ),
    );

  }
}

