import 'package:bestfranchise/Configs/colorConfig.dart';
import 'package:bestfranchise/Configs/stringConfig.dart';
import 'package:bestfranchise/Views/component/general/buttonComponent.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screen_scaler/flutter_screen_scaler.dart';

class NotifRedeemPoinVoucherComponent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ScreenScaler scale = ScreenScaler()..init(context);
    return Center(
        child: Column(
          // shrinkWrap: true,
          children: [
            CircleAvatar(
              radius:40 ,
              backgroundImage: NetworkImage(StringConfig.imgGeneral),
            ),
            SizedBox(height: scale.getHeight(1)),
            Text("Selamat",style: Theme.of(context).textTheme.headline1.copyWith(fontWeight: Theme.of(context).textTheme.headline2.fontWeight),),
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
            SizedBox(height: scale.getHeight(1)),
            Container(
              width: scale.getWidth(100),
              padding: scale.getPadding(0.5,2),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(StringConfig.imgLocal+"backCardReward.png")
                  )
              ),
              child: Text("VC0920KL90",style: Theme.of(context).textTheme.headline1.copyWith(fontSize: 24),textAlign: TextAlign.center,),
            ),
            SizedBox(height: scale.getHeight(0.5)),
            Text("Diskon 20 % berlaku untuk Dine in sekitaran Bandung Raya",style: Theme.of(context).textTheme.headline2.copyWith(color: ColorConfig.greyPrimary),textAlign: TextAlign.left,),
            SizedBox(height: scale.getHeight(0.5)),
            Align(
              alignment: Alignment.centerLeft,
              child: Text("Silahkan tukar kode voucher ini ke kasir kami",style: Theme.of(context).textTheme.headline2.copyWith(color: ColorConfig.greyPrimary),textAlign: TextAlign.left,),
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
