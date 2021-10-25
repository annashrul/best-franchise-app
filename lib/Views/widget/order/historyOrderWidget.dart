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
  TabController _controller;

  @override
  void initState() {
    _controller = TabController(length: 2, vsync: this, initialIndex: 0);
    _controller.addListener(() {
      if (_controller.index == 1) {
        setState(() {
          _controller.index = 0;
        });
      }
    });
    final order=Provider.of<StatusOrderController>(context,listen: false);
    order.loadStatusOrder(context: context);
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    List dataTab=[{"title":"Order Franchise"},{"title":"Belanja Kebutuhan"}];
    List<Widget> historyView = [];
    for(int i=0;i<dataTab.length;i++){
      historyView.add(buildContent());
    }
    ScreenScaler scale = ScreenScaler()..init(context);

    return DefaultTabController(
        initialIndex: 0,
        length:dataTab.length,
        child: Scaffold(
          appBar:AppBar(
            backgroundColor: Colors.white,
            elevation: 1,
            title: Text("Status Order", style: Theme.of(context).textTheme.headline1),
            leading: IconButton(
              icon: Icon(Icons.arrow_back_ios),
              onPressed: () => Navigator.of(context).pop(),
            ),
            bottom: TabBar(
              controller: _controller,
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
            controller: _controller,
            children:historyView,
          ),
        )
    );

  }

  Widget buildContent(){
    ScreenScaler scale=ScreenScaler()..init(context);
    final order=Provider.of<StatusOrderController>(context);

    return ListView.separated(
      padding: scale.getPadding(1,2),
        itemBuilder: (context,index){
          if(order.isLoading) return LoadingCardImageTitleSubTitle();
          if(order.statusOrderModel==null) NoDataComponent();
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
        itemCount: order.isLoading?10:order.statusOrderModel==null?1:order.statusOrderModel.data.length,
       controller: order.controller,
    );
  }
}
