import 'package:bestfranchise/Configs/routeConfig.dart';
import 'package:bestfranchise/Configs/stringConfig.dart';
import 'package:bestfranchise/Controllers/home/rewardHomeController.dart';
import 'package:bestfranchise/Controllers/reward/komisiController.dart';
import 'package:bestfranchise/Helpers/general/generalHelper.dart';
import 'package:bestfranchise/Views/component/general/loadingComponent.dart';
import 'package:bestfranchise/Views/component/general/noDataComponent.dart';
import 'package:bestfranchise/Views/component/general/touchEffectComponent.dart';
import 'package:bestfranchise/Views/component/reward/cardKomisiRoyalti.dart';
import 'package:bestfranchise/Views/component/reward/wrapperRewardComponent.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screen_scaler/flutter_screen_scaler.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class KomisiWidget extends StatefulWidget {
  @override
  _KomisiWidgetState createState() => _KomisiWidgetState();
}

class _KomisiWidgetState extends State<KomisiWidget> {
  ScrollController controllerKomisi;
  void scrollListenerKomisi() {
    final komisi = Provider.of<KomisiController>(context, listen: false);
    if (!komisi.isLoadMoreList) {
      if (controllerKomisi.position.pixels == controllerKomisi.position.maxScrollExtent) {
        komisi.loadMore(context);
      }
    }
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controllerKomisi = new ScrollController()..addListener(scrollListenerKomisi);
    final komisi = Provider.of<KomisiController>(context,listen: false);
    komisi.loadData(context: context);
  }
  @override
  void dispose() {
    super.dispose();
    controllerKomisi.removeListener(scrollListenerKomisi);
  }


  @override
  Widget build(BuildContext context) {
    final reward = Provider.of<RewardHomeController>(context,listen: false);
    return WrapperRewardComponent(
      titleCard: "Komisi",
      imgCard: "komisiBlack",
      rewardCard: GeneralHelper().formatter.format(int.parse(reward.infoModel.data.saldoKomisi)),
      descCard: "Komisi yang kamu dapat dari setiap referal dan orang yang kamu ajak telah menjadi franchise kami.",
      callbackBottomButton: ()=>Navigator.of(context).pushNamed(RoutePath.formWithdrawWidget),
      child:  buildContent(context),
    );
  }
  Widget buildContent(BuildContext context){
    ScreenScaler scale = ScreenScaler()..init(context);
    final komisi = Provider.of<KomisiController>(context);
    if(komisi.isLoadingList) return BaseLoadingLoop(
      child: BaseLoading(height: 10,width: 100,radius: 10,),
    );
    if(komisi.listMutasiKomisiModel==null) return NoDataComponent();
    return ListView.separated(
        controller: controllerKomisi,
        padding: EdgeInsets.zero,
        itemBuilder: (context,index){
          final val=komisi.listMutasiKomisiModel.data[index];
          return CardKomisiRoyalti(
            title: "${val.downline} telah menjadi Franchise Kami. Komisi untuk kamu : Rp. ${GeneralHelper().formatter.format(int.parse(val.nominal))}",
            subtitle: val.msg,
            imgUser: val.downlinePhoto,
            brand: val.brand,
            logoBrand: val.brandLogo,
            createdAt: val.createdAt,
          );
        },
        separatorBuilder: (context,index){return SizedBox();},
        itemCount: komisi.listMutasiKomisiModel.data.length
    );
  }
}
