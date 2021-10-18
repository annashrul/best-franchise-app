import 'package:bestfranchise/Configs/colorConfig.dart';
import 'package:bestfranchise/Configs/stringConfig.dart';
import 'package:bestfranchise/Controllers/reward/poinController.dart';
import 'package:bestfranchise/Helpers/general/generalHelper.dart';
import 'package:bestfranchise/Views/component/general/dialogComponent.dart';
import 'package:bestfranchise/Views/component/general/touchEffectComponent.dart';
import 'package:bestfranchise/Views/component/reward/poin/notifRedeemPoinVoucherComponent.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screen_scaler/flutter_screen_scaler.dart';
import 'package:provider/provider.dart';

import 'notifRedeemPoinMerchandiseComponent.dart';

class ContentRedeemPoinComponent extends StatefulWidget {
  @override
  _ContentRedeemPoinComponentState createState() => _ContentRedeemPoinComponentState();
}

class _ContentRedeemPoinComponentState extends State<ContentRedeemPoinComponent> {
  @override
  Widget build(BuildContext context) {
    ScreenScaler scale = ScreenScaler()..init(context);
    final poin = Provider.of<PoinController>(context);

    return ListView.separated(
        padding: scale.getPadding(0,0),
        primary: false,
        shrinkWrap: true,
        itemBuilder: (context,index){
          return Card(
            margin:scale.getMarginLTRB(0,0,0,1),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            elevation: 1,
            child: InTouchWidget(
              radius: 15,
              callback: ()=>GeneralHelper.dialog(
                context: context,
                child: <Widget>[
                  poin.indexActive==0?NotifRedeemPoinMerchandiseComponent():NotifRedeemPoinVoucherComponent()
                ]
              ),
              child: Padding(
                padding: scale.getPadding(1,2),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius:40 ,
                      backgroundImage: NetworkImage(poin.indexActive==0?"https://cf.shopee.co.id/file/51d717300e3020ad6b895954c69a19ac":"http://www.franchiseglobal.com/images/posts/2018/02/02/rfc.JPG"),

                    ),
                    SizedBox(width: scale.getWidth(2),),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(poin.indexActive==0?"Tukarkan dengan charger Samsung tipe C (Original)":"Diskon 20 % berlaku untuk Dine in sekitaran Bandung Raya",style: Theme.of(context).textTheme.headline2.copyWith(fontWeight: Theme.of(context).textTheme.headline2.fontWeight),),
                          SizedBox(height: scale.getHeight(1),),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(poin.indexActive==0?"Harga":"Expired",style: Theme.of(context).textTheme.headline2.copyWith(color: ColorConfig.greyPrimary),),
                                  Text(poin.indexActive==0?"Rp 200,000":"September 2022",style: Theme.of(context).textTheme.headline2.copyWith(color: ColorConfig.greyPrimary),),
                                ],
                              ),
                              Container(
                                padding: scale.getPadding(0.5,1),
                                decoration: BoxDecoration(
                                    color: Color(0xFFFA3262),
                                    borderRadius: BorderRadius.circular(10)
                                ),
                                child: Row(
                                  children: [
                                    Image.asset(StringConfig.imgLocal+"poin.png",color: Colors.white,height: scale.getHeight(1),),
                                    SizedBox(width: scale.getWidth(0.5),),
                                    Text("40000",style: Theme.of(context).textTheme.headline2.copyWith(color:Colors.white)),
                                  ],
                                ),
                              )

                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        },
        separatorBuilder: (context,index){return SizedBox();},
        itemCount: 30
    );
  }
}
