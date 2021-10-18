import 'package:bestfranchise/Configs/colorConfig.dart';
import 'package:bestfranchise/Configs/stringConfig.dart';
import 'package:bestfranchise/Views/component/general/touchEffectComponent.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screen_scaler/flutter_screen_scaler.dart';

class CardImageTitleSubtitleComponent extends StatelessWidget {
  final String img;
  final String title;
  final String subTitle;
  final Widget otherChild;
  final void Function() callback;
  final void Function() callbackAction;
  CardImageTitleSubtitleComponent({this.img,this.title,this.subTitle,this.otherChild,this.callback,this.callbackAction});

  @override
  Widget build(BuildContext context) {
    ScreenScaler scale= ScreenScaler()..init(context);
    return Card(
      margin:scale.getMarginLTRB(0,0,0,1),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      elevation: 1,
      child: InTouchWidget(
        radius: 15,
        callback:this.callback,
        child: Container(
          padding: scale.getPadding(0.5,2),
          child: Row(
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(StringConfig.imgGeneral),
                radius: 30,
              ),
              SizedBox(width: scale.getWidth(2)),
              Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(this.title,style: Theme.of(context).textTheme.headline1),
                          if(callbackAction!=null)InTouchWidget(callback: (){},child:Icon(Icons.more_vert))
                        ],
                      ),
                      Text(this.subTitle,style: Theme.of(context).textTheme.headline2.copyWith(color: ColorConfig.greyPrimary,fontWeight: Theme.of(context).textTheme.headline3.fontWeight),),
                      if(this.otherChild!=null)SizedBox(height: scale.getHeight(0.2),),
                      if(this.otherChild!=null)this.otherChild
                    ],
                  )
              )
            ],
          ),
        ),
      ),
    );
  }
}
