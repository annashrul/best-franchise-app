import 'package:bestfranchise/Configs/stringConfig.dart';
import 'package:bestfranchise/Helpers/general/generalHelper.dart';
import 'package:bestfranchise/Views/component/general/touchEffectComponent.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screen_scaler/flutter_screen_scaler.dart';

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
      body: Column(
        children: [
          Stack(
            overflow: Overflow.visible,
            // alignment: AlignmentDirectional.topCenter,
            // fit: StackFit.loose,
            alignment: Alignment.center,

            children: [
              Image.asset(StringConfig.imgLocal + "detailBrand.png"),
              Positioned(
                top: scale.getHeight(15),
                child: Stack(
                  overflow: Overflow.visible,
                  alignment: Alignment.center,
                  // alignment: AlignmentDirectional.topCenter,
                  // fit: StackFit.loose,
                  children: [
                    // Image.asset(
                    //   StringConfig.imgLocal + "logo.png",
                    //   scale: 1.5,
                    // ),
                    SizedBox(
                      // width: double.infinity,
                      child: FlatButton(
                        child: Text(
                          "Kami adalah perusahaan franchise dari tahun 2009 di bawah naungan PT. BEST FRANCHISE INDONESIA. Banyak Brand / Merk dagang yang sudah kami ciptakan dan sebagian besar sudah terdapat outlet yang kami buka bekerjasama dengan para franchise di seluruh Indonesia. Pengelolaan sistem yang terintegerasi membuat kami dapat bertahan dan dapat bersaing dengan perusahaanlainnya.",
                          style: Theme.of(context).textTheme.headline2,
                        ),
                      ),
                    )

                    // Positioned(
                    //     left: 0,
                    //     right: 0,
                    //     top: scale.getHeight(10),
                    //     child:
                    // )
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
