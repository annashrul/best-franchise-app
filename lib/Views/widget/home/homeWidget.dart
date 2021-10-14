import 'package:bestfranchise/Configs/colorConfig.dart';
import 'package:bestfranchise/Configs/routeConfig.dart';
import 'package:bestfranchise/Configs/stringConfig.dart';
import 'package:bestfranchise/Views/component/general/titleComponent.dart';
import 'package:bestfranchise/Views/component/general/touchEffectComponent.dart';
import 'package:bestfranchise/Views/component/home/bestBrandAndFranchiseComponent.dart';
import 'package:bestfranchise/Views/component/home/bestGalleryComponent.dart';
import 'package:bestfranchise/Views/component/home/bestPaketHematComponent.dart';
import 'package:bestfranchise/Views/component/home/bestSolusiComponent.dart';
import 'package:bestfranchise/Views/component/home/bestTestimoniComponent.dart';
import 'package:bestfranchise/Views/component/home/bestYoutubeChannelComponent.dart';
import 'package:bestfranchise/Views/component/home/rewardCardComponent.dart';
import 'package:bestfranchise/Views/component/home/sliderHomeComponent.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screen_scaler/flutter_screen_scaler.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class HomeWidget extends StatefulWidget {
  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  @override
  Widget build(BuildContext context) {
    ScreenScaler scale= ScreenScaler()..init(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            SliderHomeComponent(data: [{"image":StringConfig.imgLocal+"Slide.png"}],),
            RewardComponent(),
          ],
        ),

        Expanded(
          child: ListView(
            padding: scale.getPadding(1,2),
            children: [
              TitleComponent(
                callback: ()=>Navigator.of(context).pushNamed(RoutePath.brandWidget),
                title: "BEST Brand & Franchise",
              ),
              SizedBox(height: scale.getHeight(0.5)),
              BestBrandAndFranchiseComponent(),
              SizedBox(height: scale.getHeight(0.5)),
              TitleComponent(
                callback: ()=>Navigator.of(context).pushNamed(RoutePath.brandWidget),
                title: "BEST Paket Hemat",
              ),
              SizedBox(height: scale.getHeight(0.5)),
              BestPaketHemat(),
              Divider(),
              TitleComponent(
                callback: (){},
                title: "BEST Youtube Channel",
              ),
              SizedBox(height: scale.getHeight(0.5)),
              BestYoutubeChannelComponent(),
              Divider(),
              TitleComponent(
                callback: (){},
                title: "BEST Solusi",
                isAction: false,
              ),
              SizedBox(height: scale.getHeight(0.5)),
              BestSolusiComponent(),
              SizedBox(height: scale.getHeight(0.5)),
              TitleComponent(
                callback: (){},
                title: "BEST Testimoni",
                isAction: false,
              ),
              SizedBox(height: scale.getHeight(0.5)),
              BestTestimoniComponent(),
              SizedBox(height: scale.getHeight(0.5)),
              TitleComponent(
                callback: (){},
                title: "BEST Gallery",
                isAction: false,
              ),
              SizedBox(height: scale.getHeight(0.5)),
              BestGalleryComponent()
            ],
          ),
        )
      ],
    );
  }
}
