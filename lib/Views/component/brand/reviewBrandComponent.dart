import 'package:bestfranchise/Configs/colorConfig.dart';
import 'package:bestfranchise/Controllers/brand/reviewBrandController.dart';
import 'package:bestfranchise/Views/component/general/cardImageTitleSubtitleComponent.dart';
import 'package:bestfranchise/Views/component/general/loadingComponent.dart';
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

    return ListView.separated(
      padding: scale.getPadding(1,2),
        primary: false,
        shrinkWrap: true,
        itemBuilder: (context,index){
          if(reviewBrand.isLoading){
            return LoadingCardImageTitleSubTitle();
          }
          final val = reviewBrand.reviewBrandModel.data[index];
          return CardImageTitleSubtitleComponent(
            img: val.photo,
            title: val.member,
            subTitle: val.message,
            otherChild: Align(
              alignment: Alignment.centerRight,
              child: Text("${DateFormat.yMMMMEEEEd('id').format(DateTime.now())}",style: Theme.of(context).textTheme.headline3.copyWith(color: ColorConfig.greyPrimary),),
            ),
          );
        },
        separatorBuilder: (context,index){return SizedBox();},
        itemCount: reviewBrand.isLoading?10:reviewBrand.reviewBrandModel.data.length
    );
  }
}
