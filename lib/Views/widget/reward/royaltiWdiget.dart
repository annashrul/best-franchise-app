import 'package:bestfranchise/Configs/colorConfig.dart';
import 'package:bestfranchise/Configs/routeConfig.dart';
import 'package:bestfranchise/Configs/stringConfig.dart';
import 'package:bestfranchise/Controllers/home/rewardHomeController.dart';
import 'package:bestfranchise/Controllers/reward/komisiController.dart';
import 'package:bestfranchise/Controllers/reward/royaltiController.dart';
import 'package:bestfranchise/Helpers/general/generalHelper.dart';
import 'package:bestfranchise/Views/component/general/buttonComponent.dart';
import 'package:bestfranchise/Views/component/general/loadingComponent.dart';
import 'package:bestfranchise/Views/component/general/noDataComponent.dart';
import 'package:bestfranchise/Views/component/general/touchEffectComponent.dart';
import 'package:bestfranchise/Views/component/reward/cardKomisiRoyalti.dart';
import 'package:bestfranchise/Views/component/reward/wrapperRewardComponent.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screen_scaler/flutter_screen_scaler.dart';
import 'package:provider/provider.dart';

class RoyaltiWidget extends StatefulWidget {
  @override
  _RoyaltiWidgetState createState() => _RoyaltiWidgetState();
}

class _RoyaltiWidgetState extends State<RoyaltiWidget> {
  ScrollController controller;
  void scrollListener() {
    final data = Provider.of<RoyaltiController>(context, listen: false);
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
    final data = Provider.of<RoyaltiController>(context, listen: false);
    data.loadData(context: context);
  }

  @override
  void dispose() {
    super.dispose();
    controller.removeListener(scrollListener);
  }

  @override
  Widget build(BuildContext context) {
    final reward = Provider.of<RewardHomeController>(context, listen: false);

    return WrapperRewardComponent(
      titleCard: "Royalti",
      imgCard: "royaltiBlack",
      rewardCard: GeneralHelper()
          .formatter
          .format(int.parse(reward.infoModel.data.saldoRoyalti)),
      descCard:
          "Royalti yang kamu dapat dari setiap omset referal dan orang yang kamu ajak telah menjadi franchise kami.",
      callbackBottomButton: () =>
          Navigator.of(context).pushNamed(RoutePath.formWithdrawWidget),
      child: buildContent(context),
    );
  }

  Widget buildContent(BuildContext context) {
    final data = Provider.of<RoyaltiController>(context);
    if (data.isLoadingList)
      return BaseLoadingLoop(
        child: BaseLoading(
          height: 10,
          width: 100,
          radius: 10,
        ),
      );
    if (data.listMutasiRoyaltiModel == null) return NoDataComponent();
    return ListView.separated(
        controller: controller,
        padding: EdgeInsets.zero,
        itemBuilder: (context, index) {
          final val = data.listMutasiRoyaltiModel.data[index];
          return CardKomisiRoyalti(
            title:
                "Royalti untuk kamu : Rp. ${GeneralHelper().formatter.format(int.parse(val.nominal))}\nDari Outlet Atas nama ${val.downline}",
            subtitle: val.msg,
            imgUser: val.downlinePhoto,
            brand: val.brand,
            logoBrand: val.brandLogo,
            createdAt: val.createdAt,
            downlineMobileNo: val.downlineMobileNo,
          );
        },
        separatorBuilder: (context, index) {
          return SizedBox();
        },
        itemCount: data.listMutasiRoyaltiModel.data.length);
  }
}
