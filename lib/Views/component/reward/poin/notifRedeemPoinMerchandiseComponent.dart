import 'package:bestfranchise/Configs/colorConfig.dart';
import 'package:bestfranchise/Configs/formConfig.dart';
import 'package:bestfranchise/Controllers/reward/poinController.dart';
import 'package:bestfranchise/Helpers/general/generalHelper.dart';
import 'package:bestfranchise/Models/RedeemPoin/merchandiseModel.dart';
import 'package:bestfranchise/Views/component/general/buttonComponent.dart';
import 'package:bestfranchise/Views/component/general/fieldComponent.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screen_scaler/flutter_screen_scaler.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class NotifRedeemPoinMerchandiseComponent extends StatelessWidget {
  TextEditingController nameController = new TextEditingController();
  TextEditingController phoneController = new TextEditingController();
  TextEditingController addressController = new TextEditingController();

  final Datum valM;
  NotifRedeemPoinMerchandiseComponent(this.valM);

  String countryCode = "62";
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
          backgroundImage: NetworkImage(valM.photo),
        ),
        SizedBox(height: scale.getHeight(1)),
        Text(
          valM.title,
          textAlign: TextAlign.center,
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
                  text: GeneralHelper().formatter.format(int.parse(valM.poin)),
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
        Divider(),
        Text("Silahkan lengkapi data di bawah ini untuk memudahkan pengiriman",
            style: Theme.of(context).textTheme.headline3),
        SizedBox(height: scale.getHeight(0.5)),
        FieldComponent(
          controller: poin.penerima,
          maxLength: 50,
          labelText: "Nama Penerima",
        ),
        SizedBox(height: scale.getHeight(0.5)),
        FieldComponent(
          controller: poin.mobile_no,
          labelText: "Nomor Handphone",
          maxLength: FormConfig.maxLengthPhone,
          isPhone: true,
          keyboardType: TextInputType.number,
          onTapCountry: (code) {
            countryCode = code;
          },
        ),
        SizedBox(height: scale.getHeight(0.5)),
        FieldComponent(
          controller: poin.address,
          maxLength: 50,
          maxLines: 2,
          labelText: "Alamat Pengiriman",
        ),
        SizedBox(height: scale.getHeight(1)),
        ButtonComponent(
          labelColor: Colors.white,
          backgroundColor: ColorConfig.redPrimary,
          label: "Redeem Sekarang",
          callback: () => poin.redeemM(context: context, field: {
            "id_merchandise": valM.id,
            "penerima": poin.penerima.text,
            "kd_kec": "-",
            "kd_kota": "-",
            "kd_prov": "-",
            "address": poin.address.text,
            "mobile_no": poin.mobile_no.text
          }),
        )
      ],
    ));
  }
}
