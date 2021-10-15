import 'package:bestfranchise/Configs/stringConfig.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screen_scaler/flutter_screen_scaler.dart';

class CardHeaderReward extends StatelessWidget {
  final String img;
  final String title;
  final String reward;
  final String desc;
  CardHeaderReward({this.img,this.title,this.reward,this.desc});
  @override
  Widget build(BuildContext context) {
    ScreenScaler scale = ScreenScaler()..init(context);
    return Container(
      padding: scale.getPadding(1,2),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(StringConfig.imgLocal+"backCardReward.png")
          )
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(StringConfig.imgLocal+"${this.img}.png"),
          SizedBox(width: scale.getWidth(2)),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Jumlah ${this.title}",style: Theme.of(context).textTheme.headline2.copyWith(color: Colors.black45),),
                if(reward!=null)Text("${this.reward}",style: Theme.of(context).textTheme.headline1.copyWith(fontSize: 24),),
                Text(this.desc,style: Theme.of(context).textTheme.headline2,)
              ],
            ),
          )
        ],
      ),
    );
  }
}
