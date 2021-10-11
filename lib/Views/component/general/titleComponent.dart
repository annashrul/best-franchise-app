import 'package:bestfranchise/Configs/colorConfig.dart';
import 'package:bestfranchise/Views/component/general/touchEffectComponent.dart';
import 'package:flutter/material.dart';

class TitleComponent extends StatelessWidget {
  final String title;
  final void Function() callback;
  final bool isAction;
  TitleComponent({this.title,this.callback,this.isAction=true});
  @override
  Widget build(BuildContext context) {
    return InTouchWidget(
        callback:this.callback,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(this.title,style: Theme.of(context).textTheme.headline1,),
            if(this.isAction)Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text("Lihat semua",style: Theme.of(context).textTheme.headline3.copyWith(color: Colors.black45)),
                Icon(Icons.arrow_drop_down,color: Colors.black45,)
              ],
            )
          ],
        )
    );
  }
}
