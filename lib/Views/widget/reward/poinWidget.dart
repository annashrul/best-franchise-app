import 'package:bestfranchise/Configs/routeConfig.dart';
import 'package:bestfranchise/Controllers/home/rewardHomeController.dart';
import 'package:bestfranchise/Controllers/reward/poinController.dart';
import 'package:bestfranchise/Helpers/general/generalHelper.dart';
import 'package:bestfranchise/Views/component/general/loadingComponent.dart';
import 'package:bestfranchise/Views/component/general/noDataComponent.dart';
import 'package:bestfranchise/Views/component/reward/cardPoin.dart';
import 'package:bestfranchise/Views/component/reward/wrapperRewardComponent.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PoinWidget extends StatefulWidget {
  @override
  _PoinWidgetState createState() => _PoinWidgetState();
}

class _PoinWidgetState extends State<PoinWidget> {
  ScrollController controller;
  void scrollListener() {
    final data = Provider.of<PoinController>(context, listen: false);
    if (!data.isLoadMoreList) {
      if (controller.position.pixels == controller.position.maxScrollExtent) {
        data.loadMore(context);
      }
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = new ScrollController()..addListener(scrollListener);
    final data = Provider.of<PoinController>(context, listen: false);
    data.loadBonusPin(context: context);
  }

  @override
  void dispose() {
    super.dispose();
    controller.removeListener(scrollListener);
  }

  @override
  Widget build(BuildContext context) {
    final reward = Provider.of<RewardHomeController>(context);
    return WrapperRewardComponent(
      titleCard: "Poin",
      imgCard: "poinBlack",
      rewardCard: GeneralHelper()
          .formatter
          .format(int.parse(reward.infoModel.data.poin)),
      descCard:
          "Poin didapat dari setiap register yang menggunakan referal kamu",
      callbackBottomButton: () =>
          Navigator.of(context).pushNamed(RoutePath.redeemPoinWidget),
      child: buildContent(context),
    );
  }

  Widget buildContent(BuildContext context) {
    final data = Provider.of<PoinController>(context);
    if (data.isLoadingList)
      return BaseLoadingLoop(
        child: BaseLoading(
          height: 10,
          width: 100,
          radius: 10,
        ),
      );
    if (data.listMutasiPoinModel == null) return NoDataComponent();
    return ListView.separated(
        controller: controller,
        padding: EdgeInsets.zero,
        itemBuilder: (context, index) {
          final val = data.listMutasiPoinModel.data[index];
          return CardPoin(
            title: val.downline,
            subtitle: val.msg,
            imgUser: val.downlinePhoto,
            telp: val.downlineMobileNo,
            status: "Status",
            valStatus: "Member",
            logoBrand: val.brandLogo,
          );
        },
        separatorBuilder: (context, index) {
          return SizedBox();
        },
        itemCount: data.listMutasiPoinModel.data.length);
  }
}
