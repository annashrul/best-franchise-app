import 'package:bestfranchise/Configs/colorConfig.dart';
import 'package:bestfranchise/Configs/stringConfig.dart';
import 'package:bestfranchise/Helpers/general/generalHelper.dart';
import 'package:bestfranchise/Views/component/general/cardImageTitleSubtitleComponent.dart';
import 'package:bestfranchise/Views/component/general/touchEffectComponent.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screen_scaler/flutter_screen_scaler.dart';

class NotifWidget extends StatefulWidget {
  @override
  _NotifWidgetState createState() => _NotifWidgetState();
}

class _NotifWidgetState extends State<NotifWidget> {
  @override
  Widget build(BuildContext context) {
    ScreenScaler scale= ScreenScaler()..init(context);
    List<Widget> historyView = [];
    List dataTab = [{"title":"Aplikasi"},{"title":"Toko Saya"}];
    for(int i=0;i<dataTab.length;i++){
      historyView.add(buildContent());
    }
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Scaffold(
        appBar: GeneralHelper.appBarWithTab(
          context: context,
          title: "Notification",
          dataTab: dataTab,
          actions: [
            InkResponse(
              onTap: (){},
              child: Image.asset(StringConfig.imgLocal+"calender.png"),
            )
          ]
        ),
        body: TabBarView(
          children:historyView,
        ),
      ),
    );
  }

  Widget buildContent(){
    ScreenScaler scale= ScreenScaler()..init(context);
    return ListView.separated(
        primary: false,
        shrinkWrap: true,
        padding: scale.getPadding(1,2),
        itemBuilder: (context,index){
          return CardImageTitleSubtitleComponent(
            img: "",
            title: "Ada promo nih hari ini",
            subTitle: "Dapatkan diskon 20% untuk booking fee Brand Chocol.. Yuk segera gabung bersama kami.",
            otherChild: Row(
              children: [
                Icon(Icons.person_outline_outlined,size: scale.getTextSize(8),color: ColorConfig.greyPrimary),
                SizedBox(width: scale.getWidth(0.5),),
                Text("Admin 2020-01-01  19:00:00",style: Theme.of(context).textTheme.headline3.copyWith(color: ColorConfig.greyPrimary),),
              ],
            ),
            callback: (){},
          );
        },
        separatorBuilder: (context,index){return SizedBox();},
        itemCount: 10
    );
  }
}
