import 'package:bestfranchise/Configs/colorConfig.dart';
import 'package:bestfranchise/Configs/stringConfig.dart';
import 'package:bestfranchise/Views/component/general/buttonComponent.dart';
import 'package:bestfranchise/Views/component/general/fieldComponent.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screen_scaler/flutter_screen_scaler.dart';

// ignore: must_be_immutable
class NotifRedeemPoinMerchandiseComponent extends StatelessWidget {

  TextEditingController nameController = new TextEditingController();
  TextEditingController phoneController = new TextEditingController();
  TextEditingController addressController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    ScreenScaler scale = ScreenScaler()..init(context);
    return Center(
        child: Column(
          // shrinkWrap: true,
          children: [
            CircleAvatar(
              radius:40 ,
              backgroundImage: NetworkImage("https://cf.shopee.co.id/file/51d717300e3020ad6b895954c69a19ac"),
            ),
            SizedBox(height: scale.getHeight(1)),
            Text("Charger Samsung tipe C (Original)",textAlign:TextAlign.center,style: Theme.of(context).textTheme.headline1.copyWith(fontWeight: Theme.of(context).textTheme.headline2.fontWeight),),
            RichText(
              textAlign: TextAlign.center,
              text:TextSpan(
                style:  Theme.of(context).textTheme.headline2,
                text: 'Poin kamu sejumlah',
                children: [
                  TextSpan(text: ' 5000', style: Theme.of(context).textTheme.headline1.copyWith(color: ColorConfig.redPrimary)),
                  TextSpan(text: ' telah berhasil di redeem', style: Theme.of(context).textTheme.headline2),
                ],
              ),
            ),
            Divider(),
            Text("Silahkan lengkapi data di bawah ini untuk memudahkan pengiriman",style: Theme.of(context).textTheme.headline3),
            SizedBox(height: scale.getHeight(0.5)),
            FieldComponent(
              controller: nameController,
              labelText: "Nama Penerima",
            ),
            SizedBox(height: scale.getHeight(0.5)),
            FieldComponent(
              controller: phoneController,
              labelText: "Nomor Handphone",
            ),
            SizedBox(height: scale.getHeight(0.5)),
            FieldComponent(
              controller: addressController,
              maxLines: 2,
              labelText: "Alamat Pengiriman",
            ),
            SizedBox(height: scale.getHeight(1)),
            ButtonComponent(
              labelColor: Colors.white,
              backgroundColor: ColorConfig.redPrimary,
              label: "Redeem Sekarang",
              callback: (){},
            )

          ],
        )
    );
  }
}
