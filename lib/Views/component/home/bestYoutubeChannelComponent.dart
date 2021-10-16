import 'package:bestfranchise/Helpers/general/generalHelper.dart';
import 'package:bestfranchise/Views/component/general/touchEffectComponent.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screen_scaler/flutter_screen_scaler.dart';
import 'package:url_launcher/url_launcher.dart';

class BestYoutubeChannelComponent extends StatefulWidget {
  @override
  _BestYoutubeChannelComponentState createState() => _BestYoutubeChannelComponentState();
}

class _BestYoutubeChannelComponentState extends State<BestYoutubeChannelComponent> {



  @override
  Widget build(BuildContext context) {
    ScreenScaler scale= ScreenScaler()..init(context);

    return Container(
      margin: scale.getMarginLTRB(0,0,0,0),
      height: scale.getHeight(25),
      width: scale.getWidth(40),
      child: ListView.separated(
        padding: EdgeInsets.zero,
        physics: ClampingScrollPhysics(),
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: 30,
        itemBuilder: (context,index){
          return InTouchWidget(
              radius: 10,
              callback: ()=>GeneralHelper.jumpToBrowser(url: "https://youtube.com"),
              child: Container(
                width: scale.getWidth(40),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        "https://images.tokopedia.net/img/cache/700/product-1/2020/3/13/75617328/75617328_e5f8f60a-bb8d-4966-aa83-751e1ff11384_1080_1080",
                        fit: BoxFit.cover,
                        width: scale.getWidth(40),
                        height: scale.getHeight(15),
                      ),

                    ),
                    SizedBox(height: scale.getHeight(1)),
                    Padding(
                      padding: scale.getPadding(0,0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("The Girl Power",style: Theme.of(context).textTheme.headline2,),
                          Text("Video kali ini sangat insfiratifbanget. Jadi untuk kamu ........",maxLines:3,style: Theme.of(context).textTheme.headline3.copyWith(color:Colors.black45),)
                        ],
                      ),
                    )
                  ],
                ),
              )
          );
        },
        separatorBuilder: (context,index){return SizedBox(width: scale.getWidth(1));},
      ),
    );
  }
}
