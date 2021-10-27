import 'package:bestfranchise/Configs/routeConfig.dart';
import 'package:bestfranchise/Controllers/brand/listBrandController.dart';
import 'package:bestfranchise/Controllers/home/rewardHomeController.dart';
import 'package:bestfranchise/Controllers/slider/sliderHomeController.dart';
import 'package:bestfranchise/Helpers/general/generalHelper.dart';
import 'package:bestfranchise/Views/component/general/loadingComponent.dart';
import 'package:bestfranchise/Views/component/general/titleComponent.dart';
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
    final slider = Provider.of<SliderHomeController>(context, listen: false);
    slider.get(context: context);
    slider.getPaketHemat(context: context);
    slider.getYt(context: context);
    slider.getSolusi(context: context);
    slider.getTesti(context: context);
    slider.getGallery(context: context);
    final reward = Provider.of<RewardHomeController>(context, listen: false);
    reward.get(context: context);
  }

  @override
  Widget build(BuildContext context) {
    ScreenScaler scale = ScreenScaler()..init(context);
    final slider = Provider.of<SliderHomeController>(context);
    final reward = Provider.of<RewardHomeController>(context);
    final val =
        reward.infoModel == null ? null : reward.infoModel.data;
    final valPh = slider.sliderHomePaketHematModel == null
        ? []
        : slider.sliderHomePaketHematModel.data;
    final valYt =
        slider.sliderHomeYtModel == null ? [] : slider.sliderHomeYtModel.data;
    final valSl = slider.sliderHomeSolusiModel == null
        ? []
        : slider.sliderHomeSolusiModel.data;
    final valTs = slider.sliderHomeTestiModel == null
        ? []
        : slider.sliderHomeTestiModel.data;
    final valGl =
        slider.galleryHomeModel == null ? [] : slider.galleryHomeModel.data;
    final valSu =
        slider.sliderHomeModel == null ? [] : slider.sliderHomeModel.data;

    print(slider.sliderHomeSolusiModel == null);
    print(slider.sliderHomeSolusiModel);
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            slider.isLoading && valSu.length == 0
                ? LoadingSlider()
                : SliderHomeComponent(valSu),
            reward.isLoading && reward.infoModel == null
                ? LoadingReward()
                : RewardComponent(
                    val.toJson(),
                    callback: () {},
                  ),
          ],
        ),
        Expanded(
          child: ListView(
            padding: scale.getPadding(1, 2),
            children: [
              TitleComponent(
                callback: () =>
                    Navigator.of(context).pushNamed(RoutePath.brandWidget),
                title: "BEST Brand & Franchise",
              ),
              SizedBox(height: scale.getHeight(0.5)),
             BestBrandAndFranchiseComponent(),
              SizedBox(height: scale.getHeight(0.5)),
              TitleComponent(
                callback: () =>
                    Navigator.of(context).pushNamed(RoutePath.brandWidget),
                title: "BEST Paket Hemat",
              ),
              SizedBox(height: scale.getHeight(0.5)),
              slider.isLoadingPaketHemat && valPh.length == 0
                  ? LoadingCardRounded()
                  : BestPaketHemat(valPh),
              Divider(),
              TitleComponent(
                callback: () {
                  GeneralHelper.jumpToBrowser(url: "https://www.youtube.com/c/BhaktiAlamsyahBEST");
                },
                title: "BEST Youtube Channel",
              ),
              SizedBox(height: scale.getHeight(0.5)),
              slider.isLoadingYt && valYt.length == 0
                  ? LoadingCardRounded()
                  : BestYoutubeChannelComponent(valYt),
              Divider(),
              TitleComponent(
                callback: () {},
                title: "BEST Solusi",
                isAction: false,
              ),
              SizedBox(height: scale.getHeight(0.5)),
              slider.sliderHomeSolusiModel == null
                  ? LoadingCardRounded()
                  : BestSolusiComponent(valSl),
              SizedBox(height: scale.getHeight(0.5)),
              TitleComponent(
                callback: () {},
                title: "BEST Testimoni",
                isAction: false,
              ),
              SizedBox(height: scale.getHeight(0.5)),
              slider.isLoadingTesti && valTs.length == 0
                  ? LoadingCardRounded()
                  : BestTestimoniComponent(valTs),
              SizedBox(height: scale.getHeight(0.5)),
              TitleComponent(
                callback: () {},
                title: "BEST Gallery",
                isAction: false,
              ),
              SizedBox(height: scale.getHeight(0.5)),
              slider.isLoadingGallery && valGl.length == 0
                  ? LoadingGridNine()
                  : BestGalleryComponent(valGl)
            ],
          ),
        )
      ],
    );
  }
}
