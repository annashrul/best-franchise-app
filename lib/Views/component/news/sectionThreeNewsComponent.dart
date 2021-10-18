import 'package:bestfranchise/Configs/routeConfig.dart';
import 'package:bestfranchise/Configs/stringConfig.dart';
import 'package:bestfranchise/Views/component/general/touchEffectComponent.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screen_scaler/flutter_screen_scaler.dart';

class SectionThreeNewsComponent extends StatefulWidget {
  @override
  _SectionThreeNewsComponentState createState() => _SectionThreeNewsComponentState();
}

class _SectionThreeNewsComponentState extends State<SectionThreeNewsComponent> {
  @override
  Widget build(BuildContext context) {
    ScreenScaler scale= ScreenScaler()..init(context);
    return ListView.separated(
      padding: scale.getPadding(1,2),
      primary: false,
      shrinkWrap: true,
      itemCount:10,
      itemBuilder: (BuildContext context, int index) {
        return InTouchWidget(
            radius: 10,
            callback: (){
              Navigator.of(context).pushNamed(RoutePath.detailNewsWidget,arguments: {"id":""});
            },
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                  border: Border.all(color: Colors.grey[200],width: 1)
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    child: Image.network("http://www.franchiseglobal.com/images/posts/2017/12/22/RFC.JPG",height: scale.getHeight(16)),
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(10),bottomLeft: Radius.circular(10)),
                  ),
                  Expanded(
                      child:Padding(
                        padding: scale.getPadding(1,2),
                        child:  Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("RFC luncurkan produk minuman terbaru",style: Theme.of(context).textTheme.headline2,),
                            Text("Di masa pandemi ini, BEST Franchise terus melakukan inovasi agar dapat bersaing dengan rival-rival nya.",style: Theme.of(context).textTheme.headline3.copyWith(color: Colors.black45),),
                            SizedBox(height: scale.getHeight(1)),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                InkWell(onTap: (){}, child: Image.asset(StringConfig.imgLocal+"shareWhite.png")),
                                Text("Admin, 2020-01-01",style: Theme.of(context).textTheme.headline3,),
                              ],
                            )
                          ],
                        ),
                      )
                  ),
                ],
              ),
            )
        );
      },
      separatorBuilder: (context,index){return SizedBox(height: scale.getHeight(1));},
    );
  }
}
