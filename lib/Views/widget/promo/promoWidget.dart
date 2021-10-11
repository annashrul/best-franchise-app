import 'package:bestfranchise/Configs/colorConfig.dart';
import 'package:bestfranchise/Configs/stringConfig.dart';
import 'package:bestfranchise/Helpers/general/generalHelper.dart';
import 'package:bestfranchise/Views/component/general/buttonComponent.dart';
import 'package:bestfranchise/Views/component/general/touchEffectComponent.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screen_scaler/flutter_screen_scaler.dart';

class PromoWidget extends StatefulWidget {
  @override
  _PromoWidgetState createState() => _PromoWidgetState();
}

class _PromoWidgetState extends State<PromoWidget> {
  @override
  Widget build(BuildContext context) {
    ScreenScaler scale= ScreenScaler()..init(context);
    return Scaffold(
      appBar: GeneralHelper.appBarWithImage(context: context,desc: "Promo untuk kamu"),
      body: ListView.separated(
          padding: scale.getPadding(1,2),
          itemBuilder: (context,index){
            return InkWell(
              onTap: (){},
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(15.0),
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                        color: Colors.grey[400],
                        blurRadius: 0.0,
                        offset: Offset(0.1, 1.0),
                      ),
                    ]
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.only(topLeft:Radius.circular(10),topRight:Radius.circular(10),bottomRight: Radius.circular(0),bottomLeft: Radius.circular(0)),
                      child: Image.asset(StringConfig.imgLocal+"promoImage.png",height: scale.getHeight(10),width: double.infinity,fit: BoxFit.cover,),
                    ),
                    Padding(
                      padding: scale.getPadding(1,2),
                      child: Wrap(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Diskon 25% OFF",style: Theme.of(context).textTheme.headline1),
                              Text("Expired : 2021-11-01",style: Theme.of(context).textTheme.headline2),
                            ],
                          ),
                          Text("Diskon untuk Brand : Burhot, RFC dan Rocket Coffee",style: Theme.of(context).textTheme.headline2.copyWith(color: ColorConfig.greyPrimary)),
                          SizedBox(height: scale.getHeight(2)),
                          SizedBox(
                            width: scale.getWidth(30),
                            child: ButtonComponent(
                              height: 3,
                              labelColor: Colors.white,
                              backgroundColor: ColorConfig.bluePrimary,
                              label: "Pakai saja".toUpperCase(),
                              callback: (){},
                            ),
                          )
                        ],
                      ),
                    )

                  ],
                ),
              ),
            );
          },
          separatorBuilder: (context,index){return SizedBox(height: scale.getHeight(1));},
          itemCount: 30
      ),
      // ********************** LOADMORE **********************//
      // bottomNavigationBar: Container(
      //   height: scale.getHeight(10),
      //   child: CupertinoActivityIndicator(),
      // ),
    );
  }
}
