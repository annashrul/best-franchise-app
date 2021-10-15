import 'package:bestfranchise/Configs/colorConfig.dart';
import 'package:bestfranchise/Configs/routeConfig.dart';
import 'package:bestfranchise/Configs/stringConfig.dart';
import 'package:bestfranchise/Controllers/slider/sliderHomeController.dart';
import 'package:bestfranchise/Views/component/general/loadingComponent.dart';
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
import 'package:provider/provider.dart';

class HomeWidget extends StatefulWidget {
  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final slider=Provider.of<SliderHomeController>(context,listen: false);
    slider.get(context: context);
  }

  @override
  Widget build(BuildContext context) {
    ScreenScaler scale= ScreenScaler()..init(context);
    final slider=Provider.of<SliderHomeController>(context);

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            slider.isLoading?BaseLoading(height:21, width:100):SliderHomeComponent(
              sliderHomeModel:slider.sliderHomeModel,
            ),
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
