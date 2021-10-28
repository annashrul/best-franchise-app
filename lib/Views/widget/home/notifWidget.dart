import 'package:bestfranchise/Configs/colorConfig.dart';
import 'package:bestfranchise/Configs/stringConfig.dart';
import 'package:bestfranchise/Controllers/home/notificationController.dart';
import 'package:bestfranchise/Helpers/general/generalHelper.dart';
import 'package:bestfranchise/Views/component/general/backgroundIconComponent.dart';
import 'package:bestfranchise/Views/component/general/cardImageTitleSubtitleComponent.dart';
import 'package:bestfranchise/Views/component/general/loadingComponent.dart';
import 'package:bestfranchise/Views/component/general/noDataComponent.dart';
import 'package:bestfranchise/Views/component/general/touchEffectComponent.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_screen_scaler/flutter_screen_scaler.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class NotifWidget extends StatefulWidget {
  @override
  _NotifWidgetState createState() => _NotifWidgetState();
}

class _NotifWidgetState extends State<NotifWidget> with SingleTickerProviderStateMixin {
  TabController tabController;

  ScrollController controller;
  void scrollListener() {
    final data = Provider.of<NotificationController>(context, listen: false);
    if (!data.isLoading) {
      if (controller.position.pixels == controller.position.maxScrollExtent) {
        data.loadMore(context);
      }
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(length: 2, vsync: this, initialIndex: 0);
    tabController.addListener(() {
      if (tabController.index == 1) {
        GeneralHelper.toast(msg: "fitur ini masih dalam tahap pengembangan");
        setState(() {
          tabController.index = 0;
        });
      }
    });
    final notif = Provider.of<NotificationController>(context,listen: false);
    notif.loadData(context: context);
    controller = new ScrollController()..addListener(scrollListener);
  }
  @override
  void dispose() {
    super.dispose();
    controller.removeListener(scrollListener);
  }



  @override
  Widget build(BuildContext context) {
    ScreenScaler scale= ScreenScaler()..init(context);
    List<Widget> historyView = [];
    final notif = Provider.of<NotificationController>(context);

    List dataTab = [{"title":"Aplikasi"},{"title":"Toko Saya"}];
    for(int i=0;i<dataTab.length;i++){
      historyView.add(notif.isLoading?BaseLoadingLoop(
        child: LoadingCardImageTitleSubTitle(),
      ):notif.notificationModel==null?NoDataComponent():buildContent());
    }
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Scaffold(
        floatingActionButton:notif.isLoadMore?CupertinoActivityIndicator():SizedBox(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        appBar:AppBar(
          backgroundColor: Colors.white,
          elevation: 1,
          title: Text("Notifikasi", style: Theme.of(context).textTheme.headline1),
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios,color: Colors.black,),
            onPressed: () => Navigator.of(context).pop(),
          ),
          actions: [
            IconButton(
                onPressed: (){
                  GeneralHelper.filterDate(
                      context: context,
                      data: {"from":notif.dateFrom,"to":notif.dateTo},
                      callback: (from,to)=>notif.setDate(context: context,input: {"from":from,"to":to})
                  );
                },
                icon: BackgroundIconComponent(
                  child: Icon(FontAwesome5Solid.calendar,color: Colors.white,),
                )
            )
          ],
          bottom: TabBar(
            controller: tabController,
            indicatorPadding: scale.getPadding(0, 0),
            labelPadding: scale.getPadding(0, 1),
            unselectedLabelColor: ColorConfig.greyPrimary,
            indicatorColor: ColorConfig.redPrimary,
            labelColor: Colors.black,
            labelStyle: Theme.of(context).textTheme.headline2.copyWith(fontWeight: Theme.of(context).textTheme.headline1.fontWeight),
            isScrollable: dataTab.length > 3 ? true : false,
            tabs: [
              Tab(
                child: Container(
                  padding: scale.getPadding(0, 1),
                  child: Align(
                    alignment: Alignment.center,
                    child: Text("Aplikasi"),
                  ),
                ),
              ),
              Tab(
                child: Container(
                  padding: scale.getPadding(0, 1),
                  child: Align(
                    alignment: Alignment.center,
                    child: Text("Toko Saya"),
                  ),
                ),
              )
            ],

          ),
        ),
        body: TabBarView(
          physics: NeverScrollableScrollPhysics(),
          children:historyView,
        ),
      ),
    );
  }

  Widget buildContent(){
    ScreenScaler scale= ScreenScaler()..init(context);
    final notif = Provider.of<NotificationController>(context);

    return ListView.separated(
      controller: controller,
        primary: false,
        shrinkWrap: true,
        padding: scale.getPadding(1,2),
        itemBuilder: (context,index){
          final val=notif.notificationModel.data[index];
          final f = new DateFormat('yyyy-MM-dd hh:mm');
          print(val.toJson());

          return CardImageTitleSubtitleComponent(
            img: val.photo,
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
        itemCount:notif.notificationModel.data.length
    );
  }
}
