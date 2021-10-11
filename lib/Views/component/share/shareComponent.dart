import 'package:bestfranchise/Configs/stringConfig.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screen_scaler/flutter_screen_scaler.dart';

class ShareComponent extends StatefulWidget {
  final int index;
  ShareComponent({this.index});
  @override
  _ShareComponentState createState() => _ShareComponentState();
}

class _ShareComponentState extends State<ShareComponent> {
  @override
  Widget build(BuildContext context) {
    return widget.index%2==0?alignRight():alignLeft();
  }

  Widget alignRight(){
    ScreenScaler scale = ScreenScaler()..init(context);
    return Align(
      alignment: Alignment.centerRight,
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        leading: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.contain,
                image:  AssetImage(StringConfig.imgLocal+"Blob.png"),
              )
          ),
          child: Padding(
            padding:scale.getPadding(1,5),
            child: Image.asset(StringConfig.imgLocal+"${widget.index+1}.png"),
          ),
        ),
        title: Text("Kamu akan mendapatkan 1 Poin, jika orang yang kamu ajak melakukan register di aplikasi ini.",style: Theme.of(context).textTheme.headline1.copyWith(fontWeight: FontWeight.w400),),
      ),
    );
  }
  Widget alignLeft(){
    ScreenScaler scale = ScreenScaler()..init(context);
    return Align(
      alignment: Alignment.centerRight,
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        trailing: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.contain,
                image:  AssetImage(StringConfig.imgLocal+"Blob.png"),
              )
          ),
          child: Padding(
            padding:scale.getPadding(1,5),
            child: Image.asset(StringConfig.imgLocal+"${widget.index+1}.png"),
          ),
        ),
        title: Text("Kamu akan mendapatkan 1 Poin, jika orang yang kamu ajak melakukan register di aplikasi ini.",style: Theme.of(context).textTheme.headline1.copyWith(fontWeight: FontWeight.w400),),
      ),
    );
  }

}
