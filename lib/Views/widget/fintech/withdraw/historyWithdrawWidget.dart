import 'package:bestfranchise/Configs/colorConfig.dart';
import 'package:bestfranchise/Configs/stringConfig.dart';
import 'package:bestfranchise/Helpers/general/generalHelper.dart';
import 'package:bestfranchise/Views/component/general/touchEffectComponent.dart';
import 'package:bestfranchise/Views/component/reward/cardHeaderReward.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screen_scaler/flutter_screen_scaler.dart';

class HistoryWithdrawWidget extends StatefulWidget {
  @override
  _HistoryWithdrawWidgetState createState() => _HistoryWithdrawWidgetState();
}

class _HistoryWithdrawWidgetState extends State<HistoryWithdrawWidget> {
  @override
  Widget build(BuildContext context) {
    ScreenScaler scale = new ScreenScaler()..init(context);
    return Scaffold(
      appBar: GeneralHelper.appBarGeneral(
        context: context,
        title: "History Withdraw",
        actions: [
          InkResponse(
            onTap: (){},
            child: Image.asset(StringConfig.imgLocal+"calender.png"),
          )
        ]
      ),
      body: Padding(
        padding: scale.getPadding(1,2),
        child: Column(
          children: [
            CardHeaderReward(
              img: "royaltiBlack",
              title: "Withdraw Kamu",
              reward: "5,000,000",
              desc:"Saldo di atas adalah penggabungan antara komisi dan royalti saat ini.",
            ),
            SizedBox(height: scale.getHeight(1),),
            Expanded(
              child: Scrollbar(
                child: ListView.separated(
                    padding: EdgeInsets.zero,
                    itemBuilder: (context,index){
                      return Card(
                        margin:scale.getMarginLTRB(0,0,0,0.5),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        elevation: 1,
                        child: InTouchWidget(
                          radius: 15,
                          callback: (){},
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                padding:scale.getPaddingLTRB(2,1,0,1),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Container(
                                      width: scale.getWidth(55),
                                      child: Row(
                                        children: [
                                          Text("Date : 2021-01-01",style: Theme.of(context).textTheme.headline1.copyWith(fontWeight: FontWeight.w500,color: ColorConfig.greyPrimary),maxLines: 1,),
                                          SizedBox(width: scale.getWidth(1),),
                                          Icon( index%2==0?Icons.info:Icons.check_circle,color: index%2==0?ColorConfig.yellowPrimary:ColorConfig.greenPrimary,size: scale.getTextSize(10),)
                                        ],
                                      ),
                                    ),
                                    Container(
                                      width: scale.getWidth(55),
                                      child: Text("Bank BCA A/N Kayla Andhara Sani",style: Theme.of(context).textTheme.headline1.copyWith(fontWeight: FontWeight.w500),maxLines: 1),
                                    ),
                                  ],
                                ),
                              ),
                              Align(
                                child: Container(
                                  padding: scale.getPadding(2,2),
                                  child: Column(
                                    children: [
                                      Text("2,000,000",style: Theme.of(context).textTheme.headline2.copyWith(color:Colors.white,fontWeight: FontWeight.w500)),
                                    ],
                                  ),
                                  decoration: BoxDecoration(
                                      color: index%2==0?ColorConfig.yellowPrimary:ColorConfig.greenPrimary.withOpacity(0.7),
                                      borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(15),
                                        bottomRight: Radius.circular(15),
                                      )
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (context,index){return SizedBox();},
                    itemCount: 100
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
