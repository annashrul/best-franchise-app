

import 'package:bestfranchise/Configs/colorConfig.dart';
import 'package:bestfranchise/Configs/stringConfig.dart';
import 'package:bestfranchise/Views/component/general/dialogComponent.dart';
import 'package:bestfranchise/Views/component/general/touchEffectComponent.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_screen_scaler/flutter_screen_scaler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:oktoast/oktoast.dart';
import 'package:url_launcher/url_launcher.dart';

class GeneralHelper{
  static appBarGeneral({BuildContext context,String title="Kayla Andhara",List<Widget> actions}){
    return AppBar(
      backgroundColor: Colors.white,
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
      backgroundColor: Colors.white,

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
  static appBarWithTab({BuildContext context,String title="Kayla Andhara",List dataTab,List<Widget> actions}){
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
      backgroundColor: Colors.white,
      elevation: 1,
      title: Text(title,style: Theme.of(context).textTheme.headline1),
      leading: IconButton(
        icon: Icon(Icons.arrow_back_ios),
        onPressed: ()=>Navigator.of(context).pop(),
      ),
      actions:actions,
      bottom: TabBar(
        indicatorPadding: scale.getPadding(0,0),
        labelPadding: scale.getPadding(0,1),
        unselectedLabelColor:ColorConfig.greyPrimary,
        indicatorColor: ColorConfig.redPrimary,
        labelColor: Colors.black,
        labelStyle: Theme.of(context).textTheme.headline2.copyWith(fontWeight: Theme.of(context).textTheme.headline1.fontWeight),
        isScrollable: dataTab.length>3?true:false,
        tabs: historyTab,
      ),
    );
  }
  static modal({BuildContext context,Widget child}){
    ScreenScaler scale=ScreenScaler()..init(context);
    return showModalBottomSheet(
        backgroundColor: Colors.transparent,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(10.0))),
        context: context,
        isScrollControlled: true,
        builder: (context) => Padding(
          padding: MediaQuery.of(context).viewInsets,
          child: Stack(
            children: [
              Container(
                margin: EdgeInsets.only(top: 40.0,right: 0.0),
                padding: scale.getPadding(1,2),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20)
                ),
                child: child,
              ),
              Positioned(
                top: 0.0,
                right: scale.getWidth(2),
                child: GestureDetector(
                  onTap: (){
                    Navigator.of(context).pop();
                  },
                  child: Align(
                    alignment: Alignment.topRight,
                    child: CircleAvatar(
                      radius: 14.0,
                      backgroundColor: Colors.white,
                      child: Icon(Icons.close,color: Colors.black,),
                    ),
                  ),
                ),
              ),
            ],
          ),
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
        if(callback!=null)InkResponse(
          onTap:callback!=null?callback:()=>Navigator.of(context).pop(),
          child: Icon(FontAwesome.close)
        )
      ],
    );
  }
  static loadingDialog(BuildContext context){
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) =>  AlertDialog(
          elevation: 0.0,
          backgroundColor: Colors.transparent,
          content: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SpinKitThreeBounce(color:ColorConfig.redPrimary),
            ],
          ),
        )
    );

  }
  static nofitDialog({BuildContext context,String msg="",Function callback1,Function callback2,String label1="batal",String label2="oke"}){
    return dialog(
        context: context,
        child: [
          AlertDialog(
            title:Text("Informasi !",style: Theme.of(context).textTheme.headline1),
            content:Text(msg,style: Theme.of(context).textTheme.subtitle1),
            actions: <Widget>[
              if(callback1!=null)TextButton(
                  onPressed:callback1,
                  child:Text(label1,style: Theme.of(context).textTheme.subtitle1)
              ),
              TextButton(
                  onPressed:callback2,
                  child:Text(label2,style: Theme.of(context).textTheme.subtitle1.copyWith(color: ColorConfig.bluePrimary))
              ),
            ],
          )
        ]
    );
  }





}