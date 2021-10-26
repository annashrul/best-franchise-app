import 'package:bestfranchise/Configs/colorConfig.dart';
import 'package:bestfranchise/Configs/routeConfig.dart';
import 'package:bestfranchise/Configs/statusConfig.dart';
import 'package:bestfranchise/Configs/stringConfig.dart';
import 'package:bestfranchise/Controllers/history/statusOrderController.dart';
import 'package:bestfranchise/Helpers/general/generalHelper.dart';
import 'package:bestfranchise/Views/component/general/cardImageTitleSubtitleComponent.dart';
import 'package:bestfranchise/Views/component/general/loadingComponent.dart';
import 'package:bestfranchise/Views/component/general/noDataComponent.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screen_scaler/flutter_screen_scaler.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class HistoryOrderWidget extends StatefulWidget {
  @override
  _HistoryOrderWidgetState createState() => _HistoryOrderWidgetState();
}

class _HistoryOrderWidgetState extends State<HistoryOrderWidget> with SingleTickerProviderStateMixin  {
  TabController tabController;
  ScrollController controller;
  void scrollListener() {
    final order = Provider.of<StatusOrderController>(context, listen: false);
    if (!order.isLoading) {
      if (controller.position.pixels == controller.position.maxScrollExtent) {
        order.loadMore(context);
      }
    }
  }
  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this, initialIndex: 0);
    tabController.addListener(() {
      if (tabController.index == 1) {
        setState(() {
          tabController.index = 0;
        });
      }
    });
    final order=Provider.of<StatusOrderController>(context,listen: false);
    order.loadStatusOrder(context: context);
    controller = new ScrollController()..addListener(scrollListener);

    super.initState();
  }
  @override
  void dispose() {
    super.dispose();
    controller.removeListener(scrollListener);
  }


  @override
  Widget build(BuildContext context) {
    List dataTab=[{"title":"Order Franchise"},{"title":"Belanja Kebutuhan"}];
    List<Widget> historyView = [];
    final order=Provider.of<StatusOrderController>(context);

    for(int i=0;i<dataTab.length;i++){
      historyView.add(order.isLoading?BaseLoadingLoop(child: LoadingCardImageTitleSubTitle()):order.statusOrderModel==null?NoDataComponent():buildContent());
    }
    ScreenScaler scale = ScreenScaler()..init(context);

    return DefaultTabController(
        initialIndex: 0,
        length:2,
        child: Scaffold(
          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
          floatingActionButton: order.isLoadMore?CupertinoActivityIndicator():SizedBox(),
          appBar:AppBar(
            backgroundColor: Colors.white,
            elevation: 1,
            title: Text("Status Order", style: Theme.of(context).textTheme.headline1),
            leading: IconButton(
              icon: Icon(Icons.arrow_back_ios,color: Colors.black),
              onPressed: () => Navigator.of(context).pop(),
            ),
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
                      child: Text("Order Franchise"),
                    ),
                  ),
                ),
                Tab(
                  child: Container(
                    padding: scale.getPadding(0, 1),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text("Belanja Kebutuhan"),
                    ),
                  ),
                )
              ],
            ),
          ),
          body: TabBarView(
            controller: tabController,
            children:historyView,
          ),
        )
    );

  }

  Widget buildContent(){
    ScreenScaler scale=ScreenScaler()..init(context);
    final order=Provider.of<StatusOrderController>(context);
    if(order.isLoading) return BaseLoadingLoop(child: LoadingCardImageTitleSubTitle(),);
    if(order.statusOrderModel==null) NoDataComponent();
    return ListView.separated(
      padding: scale.getPadding(1,2),
        itemBuilder: (context,index){
          final val = order.statusOrderModel.data[index];
          return CardImageTitleSubtitleComponent(
            img:val.brandLogo,
            title: val.brand,
            subTitle: "Tanggal Order : ${DateFormat("yyyy-MM-dd").format(val.createdAt)} \nAtas Nama : ${val.owner}",
            otherChild: Text(StatusOrder.checkStatusOrder(val.status),style: Theme.of(context).textTheme.headline2.copyWith(fontWeight: FontWeight.w600,color: ColorConfig.yellowPrimary),),
            callbackAction: (){},
            callback: (){
              order.setIndexDetailOrder(index);
              Navigator.of(context).pushNamed(RoutePath.detailOrderWidget,arguments: {"id":val.id});
            },
          );
        },
        separatorBuilder: (context,index){return SizedBox();},
        itemCount: order.statusOrderModel.data.length,
       controller: controller,
    );
  }
}
