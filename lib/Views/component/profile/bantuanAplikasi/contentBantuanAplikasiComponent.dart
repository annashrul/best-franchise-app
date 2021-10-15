import 'package:bestfranchise/Configs/colorConfig.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/components/accordion/gf_accordion.dart';

class ContentBantuanAplikasiComponent extends StatefulWidget {
  @override
  _ContentBantuanAplikasiComponentState createState() => _ContentBantuanAplikasiComponentState();
}

class _ContentBantuanAplikasiComponentState extends State<ContentBantuanAplikasiComponent> {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      physics: ScrollPhysics(),
      itemCount: 5,
      itemBuilder: (context,index){
        return GFAccordion(
            contentBorderRadius: BorderRadius.only(bottomRight: Radius.circular(10),bottomLeft:Radius.circular(10)),
            textStyle:Theme.of(context).textTheme.headline1,
            collapsedTitleBackgroundColor:Colors.transparent,
            contentBackgroundColor:Colors.transparent ,
            expandedTitleBackgroundColor: Colors.white,
            titlePadding: EdgeInsets.zero,
            contentPadding: EdgeInsets.zero,
            margin: EdgeInsets.zero,
            titleChild: Text("Siapa yang bisa saya hubungi jika ada pertanyaan ?",style: Theme.of(context).textTheme.headline1.copyWith(fontWeight: Theme.of(context).textTheme.headline2.fontWeight),),
            onToggleCollapsed: (isTrue){
              setState(() {
                isTrue=isTrue;
              });
            },
            contentChild: ListView.separated(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              physics: ScrollPhysics(),
              itemCount: 1,
              itemBuilder: (c,i){
                return Text("Kami telah menyediakan nomor hotline untuk membantu kamu jika mengalami kendala di dalam aplikasi. Terdapat di menu Saya kemudian pilih live chat.",style: Theme.of(context).textTheme.headline2.copyWith(color: ColorConfig.greyPrimary),);
              },
              separatorBuilder: (c,i){return Divider(color:Theme.of(context).textTheme.caption.color);},
            )
        );
      },
      separatorBuilder: (context,index){
        return Divider();
      },
    );
  }
}
