import 'package:bestfranchise/Configs/routeConfig.dart';
import 'package:bestfranchise/Configs/stringConfig.dart';
import 'package:bestfranchise/Helpers/general/generalHelper.dart';
import 'package:bestfranchise/Views/component/general/qrCodeComponent.dart';
import 'package:bestfranchise/Views/component/general/searchComponent.dart';
import 'package:bestfranchise/Views/component/general/touchEffectComponent.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screen_scaler/flutter_screen_scaler.dart';



class RewardComponent extends StatefulWidget {
  final void Function() callback;
  RewardComponent({this.callback});
  @override
  _RewardComponentState createState() => _RewardComponentState();
}

class _RewardComponentState extends State<RewardComponent> {
  @override
  Widget build(BuildContext context) {
    ScreenScaler scale= ScreenScaler()..init(context);
    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children:<Widget>[
          Container(
            margin: scale.getMarginLTRB(0,18,0,0),
            padding: scale.getPadding(0,2),
            child: Card(
              margin: EdgeInsets.zero,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              elevation: 1,
              child: Container(
                padding: scale.getPadding(1,2),
                width: double.infinity,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                            child: SearchComponent(
                              hintText: "",
                            )
                        ),
                        SizedBox(width: scale.getWidth(1)),
                        Card(
                          margin: EdgeInsets.zero,
                          elevation: 4,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(100.0),
                          ),
                          child: InTouchWidget(
                              radius: 100,
                              callback:(){
                                GeneralHelper.modal(
                                  context: context,
                                  child: Container(
                                    height: scale.getHeight(90),
                                    child: QrCodeComponent(),
                                  )
                                );
                              },
                              child: Container(
                                padding: scale.getPadding(0.1,2),
                                child: Image.asset(StringConfig.imgLocal+"barcode.png",width: scale.getWidth(5),height: scale.getHeight(4),),
                              )
                          ),
                        ),
                        SizedBox(width: scale.getWidth(1)),
                        Card(
                          margin: EdgeInsets.zero,
                          elevation: 4,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(100.0),
                          ),
                          child: InTouchWidget(
                              radius: 100,
                              callback:()=>Navigator.of(context).pushNamed(RoutePath.notifWidget),
                              child: Container(
                                padding: scale.getPadding(0.1,2),
                                child: Image.asset(StringConfig.imgLocal+"notif.png",width: scale.getWidth(5),height: scale.getHeight(4),),
                              )
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: scale.getHeight(1),),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RewardCardComponent(img: "poin",title:"jumlah Poin",desc: "100"),
                        RewardCardComponent(img: "komisi",title:"Komisi",desc: "100,000"),
                        RewardCardComponent(img: "royalti",title:"Royalti",desc: "1,000,000"),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ]
    );
  }
}


class RewardCardComponent extends StatelessWidget {
  final String img;
  final String title;
  final String desc;

  RewardCardComponent({this.img,this.title,this.desc});
  @override
  Widget build(BuildContext context) {
    ScreenScaler scale= ScreenScaler()..init(context);
    return InTouchWidget(
        callback:(){
          print(this.img+"Widget");
          Navigator.of(context).pushNamed("/"+this.img+"Widget");
        },
        child: Container(
          // width: scale.getWidth(26),
          padding: scale.getPadding(0,0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
          ),
          child:Row(
            children: [
              Image.asset(StringConfig.imgLocal+"${this.img}.png",height: scale.getHeight(2),),
              SizedBox(width: scale.getWidth(1)),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(this.title,style: Theme.of(context).textTheme.headline2.copyWith(color:Colors.black45)),
                  Text(this.desc,style: Theme.of(context).textTheme.headline2),
                ],
              )
            ],
          ),
        )
    );
  }
}
