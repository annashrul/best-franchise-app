import 'package:bestfranchise/Configs/colorConfig.dart';
import 'package:bestfranchise/Configs/routeConfig.dart';
import 'package:bestfranchise/Views/component/general/touchEffectComponent.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screen_scaler/flutter_screen_scaler.dart';

class BestPaketHemat extends StatefulWidget {
  @override
  _BestPaketHematState createState() => _BestPaketHematState();
}

class _BestPaketHematState extends State<BestPaketHemat> {
  @override
  Widget build(BuildContext context) {
    ScreenScaler scale= ScreenScaler()..init(context);
    return Container(
      height: scale.getHeight(20),
      width: scale.getWidth(70),
      child: ListView.separated(
        padding: EdgeInsets.zero,
        physics: ClampingScrollPhysics(),
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: 30,
        itemBuilder: (context,index){
          return InTouchWidget(
              radius: 10,
              callback: ()=>Navigator.of(context).pushNamed(RoutePath.detailBrandWidget,arguments: {"id":""}),
              child: Container(
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        "https://images.tokopedia.net/img/cache/700/product-1/2020/3/13/75617328/75617328_e5f8f60a-bb8d-4966-aa83-751e1ff11384_1080_1080",
                        fit: BoxFit.cover,
                        width: scale.getWidth(70),
                      ),
                    ),
                    Container(
                      height: scale.getHeight(7),
                      padding: scale.getPadding(0.5,2),
                      width: scale.getWidth(70),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10),bottomRight: Radius.circular(10)),
                        color: Colors.black54.withOpacity(0.9),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        // mainAxisSize: MainAxisSize.min,
                        children: [
                          Text("Pilihan bisnis terbaikmu ada di sini",style: Theme.of(context).textTheme.headline2.copyWith(color: Colors.white),),
                          Text("Tidak perlu modal besar, yuk kepoin aja paket hemat nya brand yang lagi viral di sini.",style: Theme.of(context).textTheme.headline2.copyWith(color:Colors.white54))
                        ],
                      ),
                    )
                  ],
                ),
              )
          );
        },
        separatorBuilder: (context,index){return SizedBox(width: scale.getWidth(1),);},
      ),
    );
  }
}
