import 'package:bestfranchise/Configs/routeConfig.dart';
import 'package:bestfranchise/Configs/stringConfig.dart';
import 'package:bestfranchise/Helpers/general/generalHelper.dart';
import 'package:bestfranchise/Views/component/general/buttonComponent.dart';
import 'package:bestfranchise/Views/component/home/rewardCardComponent.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screen_scaler/flutter_screen_scaler.dart';

class ProfileWidget extends StatefulWidget {
  @override
  _ProfileWidgetState createState() => _ProfileWidgetState();
}

class _ProfileWidgetState extends State<ProfileWidget> {
  @override
  Widget build(BuildContext context) {
    ScreenScaler scale = ScreenScaler()..init(context);
    return Scaffold(
      appBar: GeneralHelper.appBarWithImage(
          context: context,
          desc: "Edit profile",
          isAction: true,
          callback: () {}),
      body: ListView(
        padding: scale.getPadding(1, 2),
        shrinkWrap: true,
        children: [
          Card(
            margin: EdgeInsets.zero,
            child: Container(
              padding: scale.getPadding(1, 2),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RewardCardComponent(
                    img: "poin",
                    title: "jumlah Poin",
                    desc: "100",
                  ),
                  RewardCardComponent(
                    img: "komisi",
                    title: "Komisi",
                    desc: "100,000",
                  ),
                  RewardCardComponent(
                    img: "royalti",
                    title: "Royalti",
                    desc: "1,000,000",
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
            leading: Image.asset(StringConfig.imgLocal + "order.png"),
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
            leading: Image.asset(StringConfig.imgLocal + "tokosaya.png"),
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
            leading: Image.asset(StringConfig.imgLocal + "bantuanAplikasi.png"),
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
            leading: Image.asset(StringConfig.imgLocal + "liveChat.png"),
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
            leading:
                Image.asset(StringConfig.imgLocal + "pengaturanBahasa.png"),
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
            onTap: () {},
            contentPadding: EdgeInsets.zero,
            leading:
                Image.asset(StringConfig.imgLocal + "ketentuanLayanan.png"),
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
            onTap: () {},
            contentPadding: EdgeInsets.zero,
            leading: Image.asset(StringConfig.imgLocal + "brandFavorite.png"),
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
              Navigator.of(context).pushNamed(RoutePath.profileEditWidget);
            },
            contentPadding: EdgeInsets.zero,
            leading:
                Image.asset(StringConfig.imgLocal + "tentanBestFranchise.png"),
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
            callback: () {},
          )
        ],
      ),
    );
  }
}
