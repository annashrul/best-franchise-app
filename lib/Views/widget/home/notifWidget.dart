import 'package:bestfranchise/Configs/colorConfig.dart';
import 'package:bestfranchise/Configs/stringConfig.dart';
import 'package:bestfranchise/Controllers/home/notificationController.dart';
import 'package:bestfranchise/Helpers/general/generalHelper.dart';
import 'package:bestfranchise/Views/component/general/cardImageTitleSubtitleComponent.dart';
import 'package:bestfranchise/Views/component/general/loadingComponent.dart';
import 'package:bestfranchise/Views/component/general/noDataComponent.dart';
import 'package:bestfranchise/Views/component/general/touchEffectComponent.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screen_scaler/flutter_screen_scaler.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class NotifWidget extends StatefulWidget {
  @override
  _NotifWidgetState createState() => _NotifWidgetState();
}

class _NotifWidgetState extends State<NotifWidget> {


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final notif = Provider.of<NotificationController>(context,listen: false);
    notif.loadData(context: context);
  }

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
    final notif = Provider.of<NotificationController>(context);

    return ListView.separated(
        primary: false,
        shrinkWrap: true,
        padding: scale.getPadding(1,2),
        itemBuilder: (context,index){
          if(notif.isLoading) return LoadingCardImageTitleSubTitle();
          if(notif.notificationModel==null) NoDataComponent();
          final val=notif.notificationModel.data[index];
          final f = new DateFormat('yyyy-MM-dd hh:mm');

          return CardImageTitleSubtitleComponent(
            img: StringConfig.imgGeneral,
            title: val.title,
            subTitle: val.msg,
            otherChild: Row(
              children: [
                Icon(Icons.person_outline_outlined,size: scale.getTextSize(8),color: ColorConfig.greyPrimary),
                SizedBox(width: scale.getWidth(0.5),),
                Text("Admin ${f.format(val.createdAt)}",style: Theme.of(context).textTheme.headline3.copyWith(color: ColorConfig.greyPrimary),),
              ],
            ),
            callback: (){},
          );
        },
        separatorBuilder: (context,index){return SizedBox();},
        itemCount: notif.isLoading?10:notif.notificationModel==null?1:notif.notificationModel.data.length
    );
  }
}
