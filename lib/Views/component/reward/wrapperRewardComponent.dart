import 'package:bestfranchise/Configs/colorConfig.dart';
import 'package:bestfranchise/Configs/stringConfig.dart';
import 'package:bestfranchise/Controllers/reward/komisiController.dart';
import 'package:bestfranchise/Controllers/reward/poinController.dart';
import 'package:bestfranchise/Controllers/reward/royaltiController.dart';
import 'package:bestfranchise/Controllers/user/userController.dart';
import 'package:bestfranchise/Databases/tableDatabase.dart';
import 'package:bestfranchise/Helpers/general/generalHelper.dart';
import 'package:bestfranchise/Views/component/general/backgroundIconComponent.dart';
import 'package:bestfranchise/Views/component/reward/cardHeaderReward.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_screen_scaler/flutter_screen_scaler.dart';
import 'package:provider/provider.dart';

class WrapperRewardComponent extends StatefulWidget {
  final void Function() callbackBottomButton;
  final String imgCard;
  final String titleCard;
  final String rewardCard;
  final String descCard;
  final Widget child;

  WrapperRewardComponent({
    this.callbackBottomButton,
    this.imgCard,
    this.titleCard,
    this.rewardCard,
    this.descCard,
    this.child,
  });

  @override
  _WrapperRewardComponentState createState() => _WrapperRewardComponentState();
}

class _WrapperRewardComponentState extends State<WrapperRewardComponent> {
  @override
  Widget build(BuildContext context) {
    ScreenScaler scale = ScreenScaler()..init(context);
    final user = Provider.of<UserController>(context);
    final komisi = Provider.of<KomisiController>(context);
    final royalti = Provider.of<RoyaltiController>(context);
    final poin = Provider.of<PoinController>(context);
    print(widget.titleCard);
    return Scaffold(
        appBar: GeneralHelper.appBarGeneral(
            context: context,
            title: "BEST ${widget.titleCard}",
            actions: <Widget>[
              IconButton(
                onPressed: () {
                  if(widget.titleCard=="Komisi"){
                    GeneralHelper.filterDate(
                        context: context,
                        data: {"from":komisi.dateFrom,"to":komisi.dateTo},
                        callback: (from,to)=>komisi.setDate(context: context,input: {"from":from,"to":to})
                    );
                  }
                  else if(widget.titleCard=="Royalti"){
                    GeneralHelper.filterDate(
                        context: context,
                        data: {"from":royalti.dateFrom,"to":royalti.dateTo},
                        callback: (from,to)=>royalti.setDate(context: context,input: {"from":from,"to":to})
                    );
                  }
                 
                },
                icon: BackgroundIconComponent(child: Icon(FontAwesome5Solid.calendar,color: Colors.white,),),
                // child: Image.asset(StringConfig.imgLocal + "calender.png"),
              )
            ]),
        floatingActionButton: SizedBox(
          width: double.infinity,
          child: Container(
            padding: scale.getPadding(1, 2),
            child: FlatButton(
                padding: scale.getPadding(1, 0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100.0),
                ),
                color: royalti.isLoadMoreList ||
                        komisi.isLoadMoreList ||
                        poin.isLoadMoreList
                    ? Colors.white
                    : ColorConfig.redPrimary,
                onPressed: widget.callbackBottomButton,
                child: royalti.isLoadMoreList ||
                        komisi.isLoadMoreList ||
                        poin.isLoadMoreList
                    ? CupertinoActivityIndicator()
                    : Text(
                        widget.titleCard == "Poin" ? "Redeem Poin" : "Withdraw",
                        style: Theme.of(context)
                            .textTheme
                            .headline1
                            .copyWith(color: Colors.white),
                      )),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        body: Padding(
          padding: scale.getPaddingLTRB(2, 1, 2, 0),
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
                    Text("Rekapitulasi ${widget.titleCard}",
                        style: Theme.of(context)
                            .textTheme
                            .headline1
                            .copyWith(fontWeight: FontWeight.w400)),
                    Text(user.dataUser[UserTable.fullname],
                        style: Theme.of(context)
                            .textTheme
                            .headline1
                            .copyWith(fontSize: 24)),
                    SizedBox(height: scale.getHeight(0.2)),
                    CircleAvatar(
                      backgroundImage:
                          NetworkImage("${user.dataUser[UserTable.photo]}"),
                      radius: 35,
                    ),
                    SizedBox(height: scale.getHeight(0.2)),
                    Image.asset(StringConfig.imgLocal + "arrowDownPurple.png")
                  ],
                ),
              ),
              Expanded(
                child: widget.child,
              ),
              SizedBox(
                height: scale.getHeight(5),
              )
            ],
          ),
        ));
  }
}
