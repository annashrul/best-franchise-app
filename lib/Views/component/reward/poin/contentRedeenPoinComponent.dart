import 'package:bestfranchise/Configs/colorConfig.dart';
import 'package:bestfranchise/Configs/stringConfig.dart';
import 'package:bestfranchise/Controllers/reward/poinController.dart';
import 'package:bestfranchise/Helpers/general/generalHelper.dart';
import 'package:bestfranchise/Views/component/general/touchEffectComponent.dart';
import 'package:bestfranchise/Views/component/reward/poin/notifRedeemPoinVoucherComponent.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screen_scaler/flutter_screen_scaler.dart';
import 'package:provider/provider.dart';

import 'notifRedeemPoinMerchandiseComponent.dart';

class ContentRedeemPoinComponent extends StatefulWidget {
  final Object object;
  ContentRedeemPoinComponent(this.object);

  @override
  _ContentRedeemPoinComponentState createState() =>
      _ContentRedeemPoinComponentState();
}

class _ContentRedeemPoinComponentState
    extends State<ContentRedeemPoinComponent> {
  @override
  Widget build(BuildContext context) {
    ScreenScaler scale = ScreenScaler()..init(context);
    final poin = Provider.of<PoinController>(context, listen: false);

    print(widget.object.toString());
    return ListView.separated(
        padding: scale.getPadding(0, 0),
        primary: false,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          // final valM = poin.merchandiseModel.data[index];
          // final valV = poin.voucherModel.data[index];
          return Card(
            margin: scale.getMarginLTRB(0, 0, 0, 1),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            elevation: 1,
            child: InTouchWidget(
              radius: 15,
              callback: () => {},
              child: Padding(
                padding: scale.getPadding(1, 2),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 40,
                      backgroundImage: NetworkImage(poin.indexActive == 0
                          ? poin.merchandiseModel.data[index].photo
                          : poin.voucherModel.data[index].brandLogo),
                    ),
                    SizedBox(
                      width: scale.getWidth(2),
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            poin.indexActive == 0
                                ? poin.merchandiseModel.data[index].title
                                : poin.voucherModel.data[index].title,
                            style: Theme.of(context)
                                .textTheme
                                .headline2
                                .copyWith(
                                    fontWeight: Theme.of(context)
                                        .textTheme
                                        .headline2
                                        .fontWeight),
                          ),
                          SizedBox(
                            height: scale.getHeight(1),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    poin.indexActive == 0
                                        ? "Harga coret"
                                        : "Expired",
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline2
                                        .copyWith(
                                            color: ColorConfig.greyPrimary),
                                  ),
                                  Text(
                                    poin.indexActive == 0
                                        ? poin.merchandiseModel.data[index]
                                            .hargaCoret
                                        : GeneralHelper.myDate(poin.voucherModel
                                            .data[index].expiredDate),
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline2
                                        .copyWith(
                                            color: ColorConfig.greyPrimary),
                                  ),
                                ],
                              ),
                              InkWell(
                                  onTap: () => poin.indexActive == 0
                                      ? poin.merchandiseModel.data[index]
                                                  .isclaimed ==
                                              "0"
                                          ? GeneralHelper.toast(
                                              msg: "Belum bisa diklaim")
                                          : GeneralHelper.dialog(
                                              context: context,
                                              child: <Widget>[
                                                  NotifRedeemPoinMerchandiseComponent(
                                                      poin.merchandiseModel
                                                          .data[index])
                                                ])
                                      : poin.voucherModel.data[index]
                                                  .isclaimed ==
                                              "0"
                                          ? GeneralHelper.toast(
                                              msg: "Belum bisa diklaim")
                                          : GeneralHelper.dialog(
                                              context: context,
                                              child: <Widget>[
                                                  NotifRedeemPoinVoucherComponent(
                                                      poin.voucherModel
                                                          .data[index])
                                                ]),
                                  child: Container(
                                    padding: scale.getPadding(0.5, 1),
                                    decoration: BoxDecoration(
                                        color: Color(0xFFFA3262),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Row(
                                      children: [
                                        Image.asset(
                                          StringConfig.imgLocal + "poin.png",
                                          color: Colors.white,
                                          height: scale.getHeight(1),
                                        ),
                                        SizedBox(
                                          width: scale.getWidth(0.5),
                                        ),
                                        Text(
                                            poin.indexActive == 0
                                                ? poin.merchandiseModel
                                                    .data[index].poin
                                                : poin.voucherModel.data[index]
                                                    .poin,
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline2
                                                .copyWith(color: Colors.white)),
                                      ],
                                    ),
                                  ))
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        },
        separatorBuilder: (context, index) {
          return SizedBox();
        },
        itemCount: poin.indexActive == 0
            ? poin.merchandiseModel.data.length
            : poin.voucherModel.data.length);
  }
}
