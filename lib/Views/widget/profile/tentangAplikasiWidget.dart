import 'package:bestfranchise/Configs/stringConfig.dart';
import 'package:bestfranchise/Helpers/general/generalHelper.dart';
import 'package:bestfranchise/Views/component/general/touchEffectComponent.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screen_scaler/flutter_screen_scaler.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class TentangAplikasiWidget extends StatefulWidget {
  @override
  _TentangAplikasiWidgetState createState() => _TentangAplikasiWidgetState();
}

class _TentangAplikasiWidgetState extends State<TentangAplikasiWidget> {
  @override
  Widget build(BuildContext context) {
    ScreenScaler scale = ScreenScaler()..init(context);
    return Scaffold(
      appBar: GeneralHelper.appBarGeneral(
        context: context,
        title: "Tentang Kami",
        actions: [
          InTouchWidget(
            callback: () {},
            child: Container(
              alignment: Alignment.center,
              padding: scale.getPadding(1, 2),
              child: Image.asset(StringConfig.imgLocal + "share.png"),
            ),
          ),
        ]
      ),
      body: ListView(
        children: [
          Stack(
            // overflow: Overflow.clip,
            alignment: AlignmentDirectional.topCenter,
            // fit: StackFit.loose,
            // alignment: Alignment.center,
            children: [
              Image.asset(StringConfig.imgLocal + "detailBrand.png"),
              Container(

                margin: scale.getMarginLTRB(0,13,0,0),
                child: Column(
                  children: [
                    Image.asset(
                      StringConfig.imgLocal + "logo.png",
                      scale: 1.5,
                    ),
                    SizedBox(height: scale.getHeight(1),),
                    Container(
                      padding: scale.getPadding(0, 2),
                      child: Text(
                        "Kami adalah perusahaan franchise dari tahun 2009 di bawah naungan PT. BEST FRANCHISE INDONESIA. Banyak Brand / Merk dagang yang sudah kami ciptakan dan sebagian besar sudah terdapat outlet yang kami buka bekerjasama dengan para franchise di seluruh Indonesia. Pengelolaan sistem yang terintegerasi membuat kami dapat bertahan dan dapat bersaing dengan perusahaanlainnya.",
                        style: Theme.of(context).textTheme.headline2,
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
          SizedBox(height: scale.getHeight(1)),
          StaggeredGridView.countBuilder(
            padding: scale.getPadding(0,2),
            shrinkWrap: true,
            primary: false,
            crossAxisCount: 2,
            itemCount:  4,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                padding: scale.getPadding(1,2),
                decoration: BoxDecoration(
                    color: Color(0xFFFFE7E7),
                    borderRadius: BorderRadius.circular(10)
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Total Brand",style: Theme.of(context).textTheme.headline1,),
                    SizedBox(height: scale.getHeight(1),),
                    Align(
                      alignment: Alignment.bottomRight,
                      child:  Text("+ 20",style: Theme.of(context).textTheme.headline1.copyWith(fontSize: 24),),
                    )
                  ],
                ),
              );
            },
            staggeredTileBuilder: (int index) => new StaggeredTile.fit(1),
            mainAxisSpacing: 5.0,
            crossAxisSpacing: 10.0,
          ),

          Padding(
            padding: scale.getPadding(1,2),
            child: Container(
              padding: scale.getPadding(1,2),
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(StringConfig.imgLocal+"bgTentangKami.png")
                  )
              ),
              child: Text("Benefit bergabung dengan kami",style: Theme.of(context).textTheme.headline2,),
            ),
          ),
          Padding(
            padding: scale.getPadding(1,2),
            child: Text("Pilihan Brand dan Jenis Usaha yang variatif mulai dari sandang ,papan dan pangan. \n Kami mempunyai orang-orang ahli dibidangnya, sehingga penerapan persiapan dan operasional lebih mudah dan tepat serta efisien dan profesional.\n Kami mempunyai orang-orang ahli dibidangnya, sehingga penerapan persiapan dan operasional lebih mudah dan tepat serta efisien dan profesional",style: Theme.of(context).textTheme.headline2,),
          )


        ],
      ),
    );
  }
}
