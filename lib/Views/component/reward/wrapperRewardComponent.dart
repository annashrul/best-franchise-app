import 'package:bestfranchise/Configs/colorConfig.dart';
import 'package:bestfranchise/Configs/stringConfig.dart';
import 'package:bestfranchise/Helpers/general/generalHelper.dart';
import 'package:bestfranchise/Views/component/general/buttonComponent.dart';
import 'package:bestfranchise/Views/component/general/touchEffectComponent.dart';
import 'package:bestfranchise/Views/component/reward/cardHeaderReward.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screen_scaler/flutter_screen_scaler.dart';

class WrapperRewardComponent extends StatefulWidget {
  final void Function() callbackBottomButton;
  final String imgCard;
  final String titleCard;
  final String rewardCard;
  final String descCard;

  WrapperRewardComponent({
    this.callbackBottomButton,
    this.imgCard,
    this.titleCard,
    this.rewardCard,
    this.descCard,
  });

  @override
  _WrapperRewardComponentState createState() => _WrapperRewardComponentState();
}

class _WrapperRewardComponentState extends State<WrapperRewardComponent> {
  @override
  Widget build(BuildContext context) {
    ScreenScaler scale = ScreenScaler()..init(context);
    return Scaffold(
        appBar: GeneralHelper.appBarGeneral(context: context,title: "BEST ${widget.titleCard}",actions: <Widget>[
          InkResponse(
            onTap: (){},
            child: Image.asset(StringConfig.imgLocal+"calender.png"),
          )
        ]),
        floatingActionButton: SizedBox(
          width: double.infinity,
          child: Container(
            padding: scale.getPadding(1,2),
            child: FlatButton(
              padding: scale.getPadding(1,0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100.0),
                ),
                color: ColorConfig.redPrimary,
                onPressed:widget.callbackBottomButton,
                child: Text( widget.titleCard=="Poin"?"Redeem Poin":"Withdraw",style: Theme.of(context).textTheme.headline1.copyWith(color: Colors.white),)
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        body:Padding(
          padding: scale.getPaddingLTRB(2,1,2,0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CardHeaderReward(
                img: widget.imgCard,
                title: widget.titleCard,
                reward: widget.rewardCard,
                desc: widget.descCard,
              ),
              SizedBox(height: scale.getHeight(1)),
              Center(
                child: Column(
                  children: [
                    Text("Rekapitulasi ${widget.titleCard}",style: Theme.of(context).textTheme.headline1.copyWith(fontWeight: FontWeight.w400)),
                    Text("Kayla Andhara",style: Theme.of(context).textTheme.headline1.copyWith(fontSize: 24)),
                    SizedBox(height: scale.getHeight(0.2)),
                    CircleAvatar(
                      backgroundImage: NetworkImage(StringConfig.imgUser),
                      radius: 35,
                    ),
                    SizedBox(height: scale.getHeight(0.2)),
                    Image.asset(StringConfig.imgLocal+"arrowDownPurple.png")
                  ],
                ),
              ),
              Expanded(
                child: Scrollbar(
                  child: ListView.separated(
                      padding: EdgeInsets.zero,
                      itemBuilder: (context,index){
                        return Card(
                          margin:scale.getMarginLTRB(0,0,0,1),
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
                                  padding:scale.getPaddingLTRB(2,0,0,0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          CircleAvatar(
                                            backgroundImage: NetworkImage(StringConfig.imgUser),
                                            radius: 15,
                                          ),
                                          SizedBox(width: scale.getWidth(1),),
                                          Column(
                                            children: [
                                              Container(
                                                width: scale.getWidth(55),
                                                child: Text("Royalti untuk kamu : Rp. 150.000",style: Theme.of(context).textTheme.headline1.copyWith(fontWeight: FontWeight.w500),maxLines: 1,),
                                              ),
                                              Container(
                                                width: scale.getWidth(55),
                                                child: Text("Dari Outlet Atas nama Dhea Annisa ",style: Theme.of(context).textTheme.headline1.copyWith(fontWeight: FontWeight.w500),maxLines: 1),
                                              ),
                                            ],
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                          ),
                                        ],
                                      ),
                                      Container(
                                        width: scale.getWidth(60),
                                        height: scale.getHeight(1),
                                        child: Divider(),
                                      ),
                                      Row(
                                        children: [
                                          CircleAvatar(
                                            backgroundColor: Colors.transparent,
                                            radius: 15,
                                            child: Image.asset(StringConfig.imgLocal+"whatsApp.png"),
                                          ),
                                          SizedBox(width: scale.getWidth(1),),
                                          Container(
                                            width: scale.getWidth(50),
                                            child: Text("Ucapkan Terima kasih Yuk !",style: Theme.of(context).textTheme.headline2.copyWith(fontWeight: FontWeight.w500),maxLines: 1),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Align(
                                  child: Container(
                                    padding: scale.getPadding(widget.titleCard=="Poin"?3:1, 2),
                                    child: widget.titleCard=="Poin"?poinCard():royaltiAndKomisi(),
                                    decoration: BoxDecoration(
                                        color:widget.titleCard=="Poin"?Color(0xFFF0ABE1):Color(0xFFABF2B3),
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
                      itemCount: 10
                  ),
                ),
              ),
            ],
          ),
        )
    );
  }

  Widget poinCard(){
    return Column(
      children: [
        Text("Status",style: Theme.of(context).textTheme.headline2.copyWith(fontWeight: FontWeight.w500)),
        Text("Member",style: Theme.of(context).textTheme.headline2.copyWith(color: Colors.grey)),
      ],
    );
  }

  Widget royaltiAndKomisi(){
    return Column(
      children: [
        Text("BRAND",style: Theme.of(context).textTheme.headline1.copyWith(fontWeight: FontWeight.w500)),
        CircleAvatar(
          backgroundImage: AssetImage(StringConfig.imgLocal+"burhot.png"),
          radius: 20,
        ),
        Text("2020-01-01",style: Theme.of(context).textTheme.headline2.copyWith(color: Colors.grey)),
      ],
    );
  }

}
