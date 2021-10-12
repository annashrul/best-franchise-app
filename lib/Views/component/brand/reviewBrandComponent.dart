import 'package:bestfranchise/Configs/colorConfig.dart';
import 'package:bestfranchise/Views/component/general/cardImageTitleSubtitleComponent.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screen_scaler/flutter_screen_scaler.dart';

class ReviewBrandComponent extends StatefulWidget {
  @override
  _ReviewBrandComponentState createState() => _ReviewBrandComponentState();
}

class _ReviewBrandComponentState extends State<ReviewBrandComponent> {
  @override
  Widget build(BuildContext context) {
    ScreenScaler scale = new ScreenScaler()..init(context);
    return ListView.separated(
      padding: scale.getPadding(1,2),
        primary: false,
        shrinkWrap: true,
        itemBuilder: (context,index){
          return CardImageTitleSubtitleComponent(
            img: "",
            title: "Annisa Putri",
            subTitle: "Outletnya bersih, rapih , pelayanannya mantapp, rekcommended banget deh.. sukses selalu",
            otherChild: Align(
              alignment: Alignment.centerRight,
              child: Text("Date : 2020-01-01  19:00:00 WIB",style: Theme.of(context).textTheme.headline3.copyWith(color: ColorConfig.greyPrimary),),
            ),
          );
        },
        separatorBuilder: (context,index){return SizedBox();},
        itemCount: 10
    );
  }
}
