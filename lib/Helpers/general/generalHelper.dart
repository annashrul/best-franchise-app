

import 'package:bestfranchise/Configs/colorConfig.dart';
import 'package:bestfranchise/Configs/stringConfig.dart';
import 'package:bestfranchise/Views/component/general/dialogComponent.dart';
import 'package:bestfranchise/Views/component/general/touchEffectComponent.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screen_scaler/flutter_screen_scaler.dart';
import 'package:oktoast/oktoast.dart';
import 'package:url_launcher/url_launcher.dart';

class GeneralHelper{
  static appBarGeneral({BuildContext context,String title="Kayla Andhara",List<Widget> actions}){
    return AppBar(
      elevation: 1,
      title: Text(title,style: Theme.of(context).textTheme.headline1),
      leading: IconButton(
        icon: Icon(Icons.arrow_back_ios),
        onPressed: ()=>Navigator.of(context).pop(),
      ),
      actions:actions,
    );
  }
  static appBarWithImage({BuildContext context,String title="Kayla Andhara",String desc="Berita terupdate untukmu",bool isAction=false,void Function() callback}){
    return AppBar(
      elevation: 1,
      automaticallyImplyLeading: false,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title,style: Theme.of(context).textTheme.headline1),
              isAction?InTouchWidget(
                  callback:callback,
                  child: Text(desc,style: Theme.of(context).textTheme.headline2.copyWith(color: ColorConfig.bluePrimary))
              ):Text(desc,style: Theme.of(context).textTheme.headline2),
            ],
          ),
          CircleAvatar(
            radius: 20,
            backgroundImage: NetworkImage(StringConfig.imgUser),
          )
        ],
      ),
    );
  }
  static appBarWithTab({BuildContext context,String title="Kayla Andhara",List dataTab}){
    ScreenScaler scale= ScreenScaler()..init(context);
    List<Widget> historyTab = [];
    for(int i=0;i<dataTab.length;i++){
      historyTab.add(
        Tab(
          child: Container(
            padding: scale.getPadding(0,1),
            child: Align(
              alignment: Alignment.center,
              child: Text(dataTab[i]["title"]),
            ),
          ),
        ),
      );
    }
    return AppBar(
      elevation: 1,
      title: Text(title,style: Theme.of(context).textTheme.headline1),
      leading: IconButton(
        icon: Icon(Icons.arrow_back_ios),
        onPressed: ()=>Navigator.of(context).pop(),
      ),
      bottom: TabBar(
        indicatorPadding: scale.getPadding(0,0),
        labelPadding: scale.getPadding(0,1),
        unselectedLabelColor:ColorConfig.greyPrimary,
        indicatorColor: ColorConfig.redPrimary,
        labelColor: Colors.black,
        labelStyle: Theme.of(context).textTheme.headline1.copyWith(fontWeight: Theme.of(context).textTheme.headline1.fontWeight),
        isScrollable: dataTab.length>3?true:false,
        tabs: historyTab,
      ),
    );
  }
  static modal({BuildContext context,Widget child}){
    return showModalBottomSheet(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(10.0))),
        context: context,
        isScrollControlled: true,
        builder: (context) => Padding(
          padding: MediaQuery.of(context).viewInsets,
          child: child,
        )
    );
  }
  static dialog({BuildContext context,List<Widget> child}){
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) => DialogComponent(
          children: child,
        )
    );
  }
  static toast({String msg="asdasdasd"}){
    return showToast(
      msg,
      position: ToastPosition.bottom,
      backgroundColor: Colors.black.withOpacity(0.8),
      radius: 10.0,
      textStyle: const TextStyle(fontSize: 12.0),
      animationBuilder: const Miui10AnimBuilder(),
      textPadding: EdgeInsets.all(10)
    );
  }

  static jumpToBrowser({String url})async{
    print(url);
    if (await canLaunch(url)) {
      return await launch(url);
    } else {
      toast(msg: "link tidak ditemukan");
    }
  }

  static headerModal({BuildContext context,String title="",void Function() callback}){
    ScreenScaler scale = new ScreenScaler()..init(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title,style: Theme.of(context).textTheme.headline1),
        InkResponse(
          onTap:callback!=null?callback:()=>Navigator.of(context).pop(),
          child: Image.asset(StringConfig.imgLocal+"closeBlack.png",height: scale.getHeight(1),),
        )
      ],
    );
  }


}