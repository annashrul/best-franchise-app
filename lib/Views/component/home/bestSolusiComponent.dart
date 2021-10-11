import 'package:bestfranchise/Configs/stringConfig.dart';
import 'package:bestfranchise/Views/component/general/touchEffectComponent.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screen_scaler/flutter_screen_scaler.dart';

class BestSolusiComponent extends StatefulWidget {
  @override
  _BestSolusiComponentState createState() => _BestSolusiComponentState();
}

class _BestSolusiComponentState extends State<BestSolusiComponent> {
  @override
  Widget build(BuildContext context) {
    ScreenScaler scale= ScreenScaler()..init(context);
    return  Container(
      margin: scale.getMarginLTRB(0,0,0,0),
      height: scale.getHeight(10),
      child: ListView.separated(
        padding: EdgeInsets.zero,
        physics: ClampingScrollPhysics(),
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: 3,
        itemBuilder: (context,index){
          return InTouchWidget(
              radius: 10,
              callback: (){},
              child: Container(
                decoration: BoxDecoration(
                    color: Color(0xFFCEDAFA),
                    borderRadius: BorderRadius.circular(10)
                ),
                // padding: scale.getPadding(0.5,1),
                width: scale.getWidth(70),
                child: Padding(
                  padding: scale.getPadding(1,2),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width:scale.getWidth(40),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Bingun Modal ?",style: Theme.of(context).textTheme.headline2,),
                            Text("Masalah penting ketika ingin mulai usaha, salah satunya adalah modal",style: Theme.of(context).textTheme.headline2.copyWith(color:Colors.black45),)
                          ],
                        ),
                      ),
                      Image.asset(StringConfig.imgLocal+"solusi1.png")
                    ],
                  ),
                ),
                // child: R,
              )
          );
        },
        separatorBuilder: (context,index){return SizedBox(width: scale.getWidth(1));},
      ),
    );
  }
}
