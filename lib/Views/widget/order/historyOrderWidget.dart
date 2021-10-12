import 'package:bestfranchise/Configs/colorConfig.dart';
import 'package:bestfranchise/Helpers/general/generalHelper.dart';
import 'package:bestfranchise/Views/component/general/cardImageTitleSubtitleComponent.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screen_scaler/flutter_screen_scaler.dart';

class HistoryOrderWidget extends StatefulWidget {
  @override
  _HistoryOrderWidgetState createState() => _HistoryOrderWidgetState();
}

class _HistoryOrderWidgetState extends State<HistoryOrderWidget> {
  @override
  Widget build(BuildContext context) {
    List dataTab=[{"title":"Order Franchise"},{"title":"Belanja Kebutuhan"}];
    List<Widget> historyView = [];
    for(int i=0;i<dataTab.length;i++){
      historyView.add(buildContent());
    }
    return DefaultTabController(
        initialIndex: 0,
        length:dataTab.length,
        child: Scaffold(
          appBar: GeneralHelper.appBarWithTab(
            context: context,
            title: "Status Order",
            dataTab: dataTab
          ),
          body: TabBarView(
            children:historyView,
          ),
        )
    );

  }

  Widget buildContent(){
    ScreenScaler scale=ScreenScaler()..init(context);
    return ListView.separated(
      padding: scale.getPadding(1,2),
        itemBuilder: (context,index){
          return CardImageTitleSubtitleComponent(
            img: "",
            title: "Ada promo nih hari ini",
            subTitle: "Tanggal Order : 2020-01-01 \nAtas Nama : Andri Sani",
            otherChild: Text("Menunggu verifikasi",style: Theme.of(context).textTheme.headline2.copyWith(fontWeight: FontWeight.w600,color: ColorConfig.yellowPrimary),),
            callbackAction: (){},
            callback: (){},
          );
        },
        separatorBuilder: (context,index){return SizedBox();},
        itemCount: 10
    );
  }
}
