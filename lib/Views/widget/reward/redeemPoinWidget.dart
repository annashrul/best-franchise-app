import 'package:bestfranchise/Controllers/reward/poinController.dart';
import 'package:bestfranchise/Helpers/general/generalHelper.dart';
import 'package:bestfranchise/Views/component/general/loadingComponent.dart';
import 'package:bestfranchise/Views/component/general/noDataComponent.dart';
import 'package:bestfranchise/Views/component/general/stickyHeaderComponent.dart';
import 'package:bestfranchise/Views/component/reward/cardHeaderReward.dart';
import 'package:bestfranchise/Views/component/reward/poin/contentRedeenPoinComponent.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screen_scaler/flutter_screen_scaler.dart';
import 'package:provider/provider.dart';
import 'package:sticky_headers/sticky_headers.dart';

class RedeemPoinWidget extends StatefulWidget {
  @override
  _RedeemPoinWidgetState createState() => _RedeemPoinWidgetState();
}

class _RedeemPoinWidgetState extends State<RedeemPoinWidget> {
  @override
  Widget build(BuildContext context) {
    ScreenScaler scale = ScreenScaler()..init(context);
    final poin = Provider.of<PoinController>(context);

    void initState() {
      // TODO: implement initState
      super.initState();
      poin.setIndexActive(0, context);
    }

    return Scaffold(
        appBar:
            GeneralHelper.appBarGeneral(context: context, title: "Redeem Poin"),
        body: ListView(
          padding: scale.getPadding(1, 2),
          children: [
            CardHeaderReward(
              img: "poinBlack",
              title: "Poin",
              reward: "100",
              desc:
                  "Poin didapat dari setiap register yang menggunakan referal kamu",
            ),
            SizedBox(
              height: scale.getHeight(1),
            ),
            Text(
              "Silahkan tukarkan poin kamu dengan hadiah menarik di bawah ini",
              style: Theme.of(context).textTheme.headline2,
            ),
            // SizedBox(height: scale.getHeight(1)),
            StickyHeader(
                header: StickyHeaderComponent(
                  data: [
                    {"title": "Merchandise"},
                    {"title": "Voucher"},
                  ],
                  callback: (index) {
                    poin.setIndexActive(index, context);
                  },
                  indexActive: poin.indexActive,
                ),
                content: poin.indexActive == 0
                    ? poin.isLoadingMerchandise
                        ? BaseLoadingLoop(
                            child: LoadingCardRounded(),
                          )
                        : poin.merchandiseModel == null
                            ? NoDataComponent()
                            : ContentRedeemPoinComponent(poin.indexActive == 0
                                ? poin.merchandiseModel
                                : poin.voucherModel)
                    : poin.isLoadingVoucher
                        ? BaseLoadingLoop(
                            child: LoadingCardRounded(),
                          )
                        : poin.merchandiseModel == null
                            ? NoDataComponent()
                            : ContentRedeemPoinComponent(poin.indexActive == 0
                                ? poin.merchandiseModel
                                : poin.voucherModel))
          ],
        ));
  }
}
