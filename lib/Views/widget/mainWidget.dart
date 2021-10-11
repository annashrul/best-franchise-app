import 'package:bestfranchise/Configs/colorConfig.dart';
import 'package:bestfranchise/Configs/stringConfig.dart';
import 'package:bestfranchise/Views/component/general/touchEffectComponent.dart';
import 'package:bestfranchise/Views/widget/home/homeWidget.dart';
import 'package:bestfranchise/Views/widget/news/newsWidget.dart';
import 'package:bestfranchise/Views/widget/profile/profileWidget.dart';
import 'package:bestfranchise/Views/widget/promo/promoWidget.dart';
import 'package:bestfranchise/Views/widget/share/shareWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screen_scaler/flutter_screen_scaler.dart';
// ignore: must_be_immutable
class MainWidget extends StatefulWidget {
  int indexTab;
  Widget currentPage = HomeWidget();
  MainWidget({Key key,this.indexTab}) : super(key: key);
  @override
  _MainWidgetState createState() => _MainWidgetState();
}

class _MainWidgetState extends State<MainWidget> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  void _selectTab(int tabItem) {
    print("anying");
    setState(() {
      widget.indexTab = tabItem;
      switch (tabItem) {
        case StringConfig.tabHome:
          widget.indexTab=StringConfig.tabHome;
          widget.currentPage = HomeWidget();
          break;
        case StringConfig.tabNews:
          widget.indexTab=StringConfig.tabNews;
          widget.currentPage = NewsWidget();
          break;
        case StringConfig.tabShare:
          widget.currentPage = ShareWidget();
          break;
        case StringConfig.tabPromo:
          widget.currentPage = PromoWidget();
          break;
        case StringConfig.tabProfile:
          widget.currentPage = ProfileWidget();
          break;
      }
    });
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _selectTab(widget.indexTab);
  }

  @override
  void didUpdateWidget(MainWidget oldWidget) {
    _selectTab(oldWidget.indexTab);
    super.didUpdateWidget(oldWidget);
    print("didUpdateWidget");
  }


  @override
  Widget build(BuildContext context) {
    ScreenScaler scale= ScreenScaler()..init(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      key: _scaffoldKey,
      body:widget.currentPage,
      floatingActionButton: FloatingActionButton(
        tooltip: "Share",
        backgroundColor: widget.indexTab == StringConfig.tabShare ? ColorConfig.greyPrimary : Colors.white,
        child: Image.asset(StringConfig.imgLocal+"share.png",width: scale.getWidth(6),height: scale.getHeight(10),),
        onPressed: () {
          _selectTab(StringConfig.tabShare);
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        elevation: 2,
        shape: CircularNotchedRectangle(),
        color: Colors.white,
        // notchMargin: 20,
        // clipBehavior: Clip.antiAlias,
        child: Padding(
          padding: scale.getPadding(0,4),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  bottomBar(image: "home",title: "Home",isActive: StringConfig.tabHome==widget.indexTab?true:false,index:StringConfig.tabHome),
                  SizedBox(width: scale.getWidth(7)),
                  bottomBar(image: "news",title: "News",isActive: StringConfig.tabNews==widget.indexTab?true:false,index:StringConfig.tabNews),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  bottomBar(image: "promo",title: "Promo",isActive:  StringConfig.tabPromo==widget.indexTab?true:false,index:StringConfig.tabPromo),
                  SizedBox(width: scale.getWidth(7)),
                  bottomBar(image: "saya",title: "Saya",isActive:  StringConfig.tabProfile==widget.indexTab?true:false,index:StringConfig.tabProfile),
                ],
              ),
            ],
          ),
        ),
      ),
    );

  }
  Widget bottomBar({String image, String title,bool isActive,int index}){
    ScreenScaler scale= ScreenScaler()..init(context);
    return InTouchWidget(
        callback: (){_selectTab(index);},
        child: Container(
          padding: scale.getPadding(0.2, 0),
          child: Column(
            mainAxisSize:MainAxisSize.min,
            children: [
              Image.asset(StringConfig.imgLocal+"$image.png",width: scale.getWidth(6),height: scale.getHeight(3),),
              SizedBox(height: scale.getHeight(0.1)),
              Text(title,style: Theme.of(context).textTheme.headline2.copyWith(color: isActive?Color(0xFFE2838E):Color(0xFFD4D4D4),fontWeight: FontWeight.bold),)
            ],
          ),
        )
    );
  }



}
