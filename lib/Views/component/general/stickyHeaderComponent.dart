import 'package:bestfranchise/Configs/colorConfig.dart';
import 'package:bestfranchise/Controllers/news/listNewsController.dart';
import 'package:bestfranchise/Views/component/general/touchEffectComponent.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screen_scaler/flutter_screen_scaler.dart';
import 'package:provider/provider.dart';

class StickyHeaderComponent extends StatelessWidget {
  final List data;
  final void Function(int index) callback;
  final int indexActive;
  StickyHeaderComponent({this.data,this.callback,this.indexActive});
  @override
  Widget build(BuildContext context) {
    ScreenScaler scale= ScreenScaler()..init(context);
    return Container(
      height: scale.getHeight(5),
      color: Colors.white,
      child:Center(
        child:  ListView.builder(
            itemCount: data.length,
            padding: EdgeInsets.zero,
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  InTouchWidget(
                    callback:()=>this.callback(index),
                    child: Align(
                      alignment: Alignment.center,
                      child: Container(
                        width: data.length>4?null:MediaQuery.of(context).size.width/data.length+1,
                        padding:scale.getPadding(1,0),
                        decoration: BoxDecoration(
                            border: Border(bottom: BorderSide(color: index==this.indexActive?ColorConfig.redPrimary:ColorConfig.greyPrimary,width:index==this.indexActive?3.0:0.0,))
                        ),
                        child:  Container(
                          margin: scale.getMargin(0,1),
                          child: Text(data[index]["title"],style: Theme.of(context).textTheme.headline1.copyWith(color:index==this.indexActive?ColorConfig.redPrimary:ColorConfig.greyPrimary),textAlign: TextAlign.center,),
                        ),
                      ),
                    ),
                  )
                ],
              );
            }
        ),
      ),
    );
  }
}
