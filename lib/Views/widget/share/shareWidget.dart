import 'package:bestfranchise/Configs/colorConfig.dart';
import 'package:bestfranchise/Configs/stringConfig.dart';
import 'package:bestfranchise/Views/component/general/buttonComponent.dart';
import 'package:bestfranchise/Views/component/share/shareComponent.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screen_scaler/flutter_screen_scaler.dart';

class ShareWidget extends StatefulWidget {
  @override
  _ShareWidgetState createState() => _ShareWidgetState();
}

class _ShareWidgetState extends State<ShareWidget> {
  @override
  Widget build(BuildContext context) {
    ScreenScaler scale = ScreenScaler()..init(context);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          "Bagikan info",
          style: Theme.of(context).textTheme.headline1,
        ),
      ),
      body: SingleChildScrollView(
        padding: scale.getPadding(1, 2.5),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Image.asset(StringConfig.imgLocal + "imageShare.png"),
              SizedBox(height: scale.getHeight(2)),
              Text(
                  "Apa sih manfaat kamu membagikan Aplikasi ini ke orang lain?",
                  style: Theme.of(context)
                      .textTheme
                      .headline1
                      .copyWith(fontWeight: FontWeight.w400)),
              SizedBox(height: scale.getHeight(2)),
              ListView.separated(
                  physics: ClampingScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return ShareComponent(index: index);
                  },
                  separatorBuilder: (context, index) {
                    return SizedBox(height: scale.getHeight(1));
                  },
                  itemCount: 3),
              SizedBox(height: scale.getHeight(1)),
              Image.asset(
                StringConfig.imgLocal + "arrowDownOrange.png",
                height: scale.getHeight(10),
              ),
              SizedBox(height: scale.getHeight(1)),
              ButtonComponent(
                label: "Bagikan sekarang",
                labelColor: Colors.white,
                backgroundColor: ColorConfig.redPrimary,
                callback: () {},
              ),
              SizedBox(height: scale.getHeight(3)),
            ],
          ),
        ),
      ),
    );
  }
}
