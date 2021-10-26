import 'package:bestfranchise/Configs/colorConfig.dart';
import 'package:bestfranchise/Configs/stringConfig.dart';
import 'package:bestfranchise/Helpers/general/generalHelper.dart';
import 'package:bestfranchise/Views/component/general/backgroundIconComponent.dart';
import 'package:bestfranchise/Views/component/general/touchEffectComponent.dart';
import 'package:bestfranchise/Views/component/home/rewardCardComponent.dart';
import 'package:bestfranchise/Views/widget/home/homeWidget.dart';
import 'package:bestfranchise/Views/widget/news/newsWidget.dart';
import 'package:bestfranchise/Views/widget/profile/profileWidget.dart';
import 'package:bestfranchise/Views/widget/promo/promoWidget.dart';
import 'package:bestfranchise/Views/widget/share/shareWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_icons/flutter_icons.dart';
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
    return WillPopScope(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          key: _scaffoldKey,
          body:widget.currentPage,
          floatingActionButton: FloatingActionButton(
            tooltip: "Share",
            backgroundColor:Colors.white,
            // child: Image.asset(StringConfig.imgLocal+"share.png",width: scale.getWidth(6),height: scale.getHeight(10),),
            child: widget.indexTab == StringConfig.tabShare ?BackgroundIconComponent(child: Icon(FontAwesome5Solid.share,color: Colors.white,size: scale.getTextSize(14),),):Icon(FontAwesome5Solid.share,color: Colors.grey[400],size: scale.getTextSize(14),),
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
                      bottomBar(icon:FontAwesome5Solid.home,image: "home",title: "Home",isActive: StringConfig.tabHome==widget.indexTab?true:false,index:StringConfig.tabHome),
                      SizedBox(width: scale.getWidth(8)),
                      bottomBar(icon:FontAwesome5Solid.newspaper,image: "news",title: "News",isActive: StringConfig.tabNews==widget.indexTab?true:false,index:StringConfig.tabNews),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      bottomBar(image: "home",title: "Share",isActive: widget.indexTab == StringConfig.tabShare?true:false,index:StringConfig.tabShare),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      bottomBar(icon:FontAwesome5Solid.gift,image: "promo",title: "Promo",isActive:  StringConfig.tabPromo==widget.indexTab?true:false,index:StringConfig.tabPromo),
                      SizedBox(width: scale.getWidth(8)),
                      bottomBar(icon:FontAwesome5Solid.user,image: "saya",title: "Saya",isActive:  StringConfig.tabProfile==widget.indexTab?true:false,index:StringConfig.tabProfile),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        onWillPop: _onWillPop
    );

  }
  Widget bottomBar({String image, String title,bool isActive,int index,IconData icon}){
    ScreenScaler scale= ScreenScaler()..init(context);
    return InTouchWidget(
        callback: (){_selectTab(index);},
        child: Container(
          padding: scale.getPadding(0.2, 0),
          child: Column(
            mainAxisSize:MainAxisSize.min,
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              isActive? BackgroundIconComponent(
                child: Icon(icon,size: scale.getTextSize(14),color: Colors.white),
              ):Icon(icon,size: scale.getTextSize(14),color:icon!=null?Colors.grey[400]:Colors.transparent),
              // isActive?Image.asset(StringConfig.imgLocal+"$image.png",fit:BoxFit.contain):Image.asset(StringConfig.imgLocal+"$image.png",fit:BoxFit.contain,color:Colors.grey[400],),
              SizedBox(height: scale.getHeight(0.1)),
              Text(title,style: Theme.of(context).textTheme.headline2.copyWith(color: isActive?Color(0xFFE2838E):Color(0xFFD4D4D4),fontWeight: FontWeight.bold),)
            ],
          ),
        )
    );
  }
  Future<bool> _onWillPop() async {
    return (
        GeneralHelper.nofitDialog(
          context: context,
          msg: "Kamu yakin akan keluar dari aplikasi ?",
          callback1: ()=>Navigator.of(context).pop(),
          callback2: ()=>SystemNavigator.pop(),
        )
    ) ?? false;
  }



}
