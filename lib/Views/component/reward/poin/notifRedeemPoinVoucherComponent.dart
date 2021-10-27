import 'package:bestfranchise/Configs/colorConfig.dart';
import 'package:bestfranchise/Configs/stringConfig.dart';
import 'package:bestfranchise/Controllers/reward/poinController.dart';
import 'package:bestfranchise/Helpers/general/generalHelper.dart';
import 'package:bestfranchise/Models/RedeemPoin/voucherModel.dart';
import 'package:bestfranchise/Views/component/general/buttonComponent.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screen_scaler/flutter_screen_scaler.dart';
import 'package:provider/provider.dart';

class NotifRedeemPoinVoucherComponent extends StatelessWidget {
  final Datum valV;
  NotifRedeemPoinVoucherComponent(this.valV);

  @override
  Widget build(BuildContext context) {
    ScreenScaler scale = ScreenScaler()..init(context);
    final poin = Provider.of<PoinController>(context);
    return Center(
        child: Column(
      // shrinkWrap: true,
      children: [
        CircleAvatar(
          radius: 40,
          backgroundImage: NetworkImage(valV.brandLogo),
        ),
        SizedBox(height: scale.getHeight(1)),
        Text(
          "Selamat",
          style: Theme.of(context).textTheme.headline1.copyWith(
              fontWeight: Theme.of(context).textTheme.headline2.fontWeight),
        ),
        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            style: Theme.of(context).textTheme.headline2,
            text: 'Poin kamu sejumlah ',
            children: [
              TextSpan(
                  text: valV.poin,
                  style: Theme.of(context)
                      .textTheme
                      .headline1
                      .copyWith(color: ColorConfig.redPrimary)),
              TextSpan(
                  text: ' telah berhasil di redeem',
                  style: Theme.of(context).textTheme.headline2),
            ],
          ),
        ),
        SizedBox(height: scale.getHeight(1)),
        Container(
          width: scale.getWidth(100),
          padding: scale.getPadding(0.5, 2),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(
                      StringConfig.imgLocal + "backCardReward.png"))),
          child: Text(
            valV.brand,
            style: Theme.of(context).textTheme.headline1.copyWith(fontSize: 24),
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(height: scale.getHeight(0.5)),
        Text(
          valV.title,
          style: Theme.of(context)
              .textTheme
              .headline3
              .copyWith(color: ColorConfig.greyPrimary),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: scale.getHeight(0.5)),
        Align(
          alignment: Alignment.center,
          child: Text(
            "Silahkan tukar kode voucher ini ke kasir kami",
            style: Theme.of(context)
                .textTheme
                .headline3
                .copyWith(color: ColorConfig.greyPrimary),
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(height: scale.getHeight(1)),
        ButtonComponent(
          labelColor: Colors.white,
          backgroundColor: ColorConfig.redPrimary,
          label: "Selesai",
          callback: () => valV.isclaimed == "0"
              ? GeneralHelper.toast(msg: "Belum dapat diselesaikan")
              : poin.redeemV(context: context, field: {"id_voucher": valV.id}),
        )
      ],
    ));
  }
}
