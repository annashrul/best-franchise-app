import 'package:bestfranchise/Configs/routeConfig.dart';
import 'package:bestfranchise/Configs/stringConfig.dart';
import 'package:bestfranchise/Controllers/home/rewardHomeController.dart';
import 'package:bestfranchise/Helpers/general/generalHelper.dart';
import 'package:bestfranchise/Views/component/general/backgroundIconComponent.dart';
import 'package:bestfranchise/Views/component/general/buttonComponent.dart';
import 'package:bestfranchise/Views/component/home/rewardCardComponent.dart';
import 'package:bestfranchise/Views/component/profile/modalKetentuanLayananComponent.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_screen_scaler/flutter_screen_scaler.dart';
import 'package:provider/provider.dart';

class ProfileWidget extends StatefulWidget {
  @override
  _ProfileWidgetState createState() => _ProfileWidgetState();
}

class _ProfileWidgetState extends State<ProfileWidget> {
  @override
  Widget build(BuildContext context) {
    ScreenScaler scale = ScreenScaler()..init(context);
    final reward = Provider.of<RewardHomeController>(context);
    return Scaffold(
      appBar: GeneralHelper.appBarWithImage(
          context: context,
          desc: "Edit profile",
          isAction: true,
          callback: () {
            Navigator.of(context).pushNamed(RoutePath.profileEditWidget);
          }),
      body: ListView(
        padding: scale.getPadding(1, 2),
        shrinkWrap: true,
        children: [
          Card(
            margin: EdgeInsets.zero,
            child: Container(
              padding: scale.getPadding(1, 2),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RewardCardComponent(
                    img: "poin",
                    title: "jumlah Poin",
                    desc: reward.infoModel.data.poin,
                    icon: FontAwesome5Solid.database,
                  ),
                  RewardCardComponent(
                    img: "komisi",
                    title: "Komisi",
                    desc: reward.infoModel.data.saldoKomisi,
                    icon: FontAwesome5Solid.wallet,
                  ),
                  RewardCardComponent(
                    img: "royalti",
                    title: "Royalti",
                    desc: reward.infoModel.data.saldoRoyalti,
                    icon: FontAwesome5Solid.money_bill_alt,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: scale.getHeight(1)),
          ListTile(
            onTap: () =>
                Navigator.of(context).pushNamed(RoutePath.historyOrderWidget),
            contentPadding: EdgeInsets.zero,
            leading:SizedBox(child: BackgroundIconComponent(child: Icon(FontAwesome5Solid.archive,color: Colors.white,size: scale.getTextSize(13),),),),
            title: Text(
              "Status Order",
              style: Theme.of(context)
                  .textTheme
                  .headline1
                  .copyWith(fontWeight: FontWeight.w400),
            ),
          ),
          Divider(height: scale.getHeight(0.1)),
          ListTile(
            onTap: () {},
            contentPadding: EdgeInsets.zero,
            leading:SizedBox(width: scale.getWidth(7),child: BackgroundIconComponent(child: Icon(FontAwesome5Solid.store,color: Colors.white,size: scale.getTextSize(13)),),),
            title: Text(
              "Toko saya",
              style: Theme.of(context)
                  .textTheme
                  .headline1
                  .copyWith(fontWeight: FontWeight.w400),
            ),
          ),
          Divider(height: scale.getHeight(0.1)),
          ListTile(
            onTap: () {
              Navigator.of(context).pushNamed(RoutePath.bantuanAplikasiWidget);
            },
            contentPadding: EdgeInsets.zero,
            leading:SizedBox(child: BackgroundIconComponent(child: Icon(FontAwesome5Solid.question_circle,color: Colors.white,size: scale.getTextSize(13)),),),
            title: Text(
              "Bantuan Aplikasi",
              style: Theme.of(context)
                  .textTheme
                  .headline1
                  .copyWith(fontWeight: FontWeight.w400),
            ),
          ),
          Divider(height: scale.getHeight(0.1)),
          ListTile(
            onTap: () {},
            contentPadding: EdgeInsets.zero,
            leading:SizedBox(child: BackgroundIconComponent(child: Icon(FontAwesome5Solid.comment,color: Colors.white,size: scale.getTextSize(13)),),),
            title: Text(
              "Live Chat",
              style: Theme.of(context)
                  .textTheme
                  .headline1
                  .copyWith(fontWeight: FontWeight.w400),
            ),
          ),
          Divider(height: scale.getHeight(0.1)),
          ListTile(
            onTap: () {},
            contentPadding: EdgeInsets.zero,
            leading:SizedBox(width: scale.getWidth(7),child: BackgroundIconComponent(child: Icon(FontAwesome5Solid.language,color: Colors.white,size: scale.getTextSize(13)),),),
            title: Text(
              "Pengaturan Bahasa",
              style: Theme.of(context)
                  .textTheme
                  .headline1
                  .copyWith(fontWeight: FontWeight.w400),
            ),
          ),
          Divider(height: scale.getHeight(0.1)),
          ListTile(
            onTap: () {
              GeneralHelper.modal(
                  context: context, child: ModalKetentuanLayananComponent());
            },
            contentPadding: EdgeInsets.zero,
            leading:SizedBox(child: BackgroundIconComponent(child: Icon(FontAwesome5Solid.info_circle,color: Colors.white,size: scale.getTextSize(13)),),),
            title: Text(
              "Ketentuan Layanan",
              style: Theme.of(context)
                  .textTheme
                  .headline1
                  .copyWith(fontWeight: FontWeight.w400),
            ),
          ),
          Divider(height: scale.getHeight(0.1)),
          ListTile(
            onTap: () {
              Navigator.of(context).pushNamed(RoutePath.brandFavoriteWidget);
            },
            contentPadding: EdgeInsets.zero,
            leading:SizedBox(child: BackgroundIconComponent(child: Icon(FontAwesome5Solid.heart,color: Colors.white,size: scale.getTextSize(13)),),),
            title: Text(
              "Brand Favorite",
              style: Theme.of(context)
                  .textTheme
                  .headline1
                  .copyWith(fontWeight: FontWeight.w400),
            ),
          ),
          Divider(height: scale.getHeight(0.1)),
          ListTile(
            onTap: () {
              Navigator.of(context).pushNamed(RoutePath.tentangAplikasiWidget);
            },
            contentPadding: EdgeInsets.zero,
            leading:SizedBox(child: BackgroundIconComponent(child: Icon(FontAwesome5Solid.building,color: Colors.white,size: scale.getTextSize(13)),),),
            title: Text(
              "Tentang Aplikasi",
              style: Theme.of(context)
                  .textTheme
                  .headline1
                  .copyWith(fontWeight: FontWeight.w400),
            ),
          ),
          Divider(height: scale.getHeight(0.1)),
          SizedBox(
            height: scale.getHeight(1),
          ),
          ButtonComponent(
            label: "Logout",
            callback: () {
              Navigator.of(context).pushNamed(RoutePath.onBoardingWidget);
            },
          )
        ],
      ),
    );
  }
}
