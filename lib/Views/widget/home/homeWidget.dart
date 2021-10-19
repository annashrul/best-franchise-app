import 'package:bestfranchise/Configs/routeConfig.dart';
import 'package:bestfranchise/Configs/stringConfig.dart';
import 'package:bestfranchise/Controllers/brand/listBrandController.dart';
import 'package:bestfranchise/Controllers/home/rewardHomeController.dart';
import 'package:bestfranchise/Controllers/slider/sliderHomeController.dart';
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

    final brand = Provider.of<ListBrandController>(context, listen: false);
    brand.loadBrand(context: context);
  }

  @override
  Widget build(BuildContext context) {
    ScreenScaler scale = ScreenScaler()..init(context);
    final slider = Provider.of<SliderHomeController>(context);

    final reward = Provider.of<RewardHomeController>(context);
    final brand = Provider.of<ListBrandController>(context);

    final val = reward.rewardHomeModel.data;
    final valPh = slider.sliderHomePaketHematModel.data;
    final valYt = slider.sliderHomeYtModel.data;
    final valSl = slider.sliderHomeSolusiModel.data;
    final valTs = slider.sliderHomeTestiModel.data;
    final valGl = slider.galleryHomeModel.data;
    final valBr = brand.listBrandModel.data;
    final valSu = slider.sliderHomeModel.data;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            SliderHomeComponent(
                // data: [
                //   {"image": StringConfig.imgLocal + "banner1.jpg"},
                //   {"image": StringConfig.imgLocal + "banner2.jpg"},
                //   {"image": StringConfig.imgLocal + "banner3.jpg"},
                //   {"image": StringConfig.imgLocal + "banner4.jpg"}
                // ],
                valSu),
            RewardComponent(
              bonusPoin: val.bonusPoin,
              bonusKomisi: val.bonusKomisi,
              bonusRoyalti: val.bonusRoyalti,
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
              BestBrandAndFranchiseComponent(valBr),
              SizedBox(height: scale.getHeight(0.5)),
              TitleComponent(
                callback: () =>
                    Navigator.of(context).pushNamed(RoutePath.brandWidget),
                title: "BEST Paket Hemat",
              ),
              SizedBox(height: scale.getHeight(0.5)),
              BestPaketHemat(valPh),
              Divider(),
              TitleComponent(
                callback: () {},
                title: "BEST Youtube Channel",
              ),
              SizedBox(height: scale.getHeight(0.5)),
              BestYoutubeChannelComponent(valYt),
              Divider(),
              TitleComponent(
                callback: () {},
                title: "BEST Solusi",
                isAction: false,
              ),
              SizedBox(height: scale.getHeight(0.5)),
              BestSolusiComponent(valSl),
              SizedBox(height: scale.getHeight(0.5)),
              TitleComponent(
                callback: () {},
                title: "BEST Testimoni",
                isAction: false,
              ),
              SizedBox(height: scale.getHeight(0.5)),
              BestTestimoniComponent(valTs),
              SizedBox(height: scale.getHeight(0.5)),
              TitleComponent(
                callback: () {},
                title: "BEST Gallery",
                isAction: false,
              ),
              SizedBox(height: scale.getHeight(0.5)),
              BestGalleryComponent(valGl)
            ],
          ),
        )
      ],
    );
  }
}
