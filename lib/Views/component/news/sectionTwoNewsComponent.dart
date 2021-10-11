import 'package:bestfranchise/Configs/colorConfig.dart';
import 'package:bestfranchise/Controllers/news/listNewsController.dart';
import 'package:bestfranchise/Views/component/general/touchEffectComponent.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screen_scaler/flutter_screen_scaler.dart';
import 'package:provider/provider.dart';

class SectionTwoNewsComponent extends StatefulWidget {
  @override
  _SectionTwoNewsComponentState createState() => _SectionTwoNewsComponentState();
}

class _SectionTwoNewsComponentState extends State<SectionTwoNewsComponent> {
  @override
  Widget build(BuildContext context) {
    ScreenScaler scale= ScreenScaler()..init(context);
    final news = Provider.of<ListNewsController>(context);

    return Container(
      height: scale.getHeight(5),
      child: ListView.separated(
          itemCount: 30,
          padding: scale.getPadding(0,2),
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          separatorBuilder: (context,index){return SizedBox();},
          itemBuilder: (context, index) {
            return InTouchWidget(
                callback: (){
                  news.setIndexCategoryActive(index);
                },
                child: Wrap(
                  children: [
                    Container(
                      padding:scale.getPadding(1,0),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border(bottom: BorderSide(color: index==news.indexCategoryActive?ColorConfig.redPrimary:ColorConfig.greyPrimary,width: index==news.indexCategoryActive?3.0:0.0,))
                      ),
                      child:  Container(
                        margin: scale.getMargin(0,1),
                        child: Text("kategori",style: Theme.of(context).textTheme.headline1.copyWith(color: index==news.indexCategoryActive?ColorConfig.redPrimary:ColorConfig.greyPrimary)),
                      ),
                    ),
                  ],
                )
            );
          }
      ),
    );
  }
}
