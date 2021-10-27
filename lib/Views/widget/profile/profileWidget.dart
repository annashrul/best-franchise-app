import 'package:bestfranchise/Configs/colorConfig.dart';
import 'package:bestfranchise/Configs/routeConfig.dart';
import 'package:bestfranchise/Configs/stringConfig.dart';
import 'package:bestfranchise/Controllers/home/rewardHomeController.dart';
import 'package:bestfranchise/Controllers/site/companyController.dart';
import 'package:bestfranchise/Controllers/user/userController.dart';
import 'package:bestfranchise/Databases/tableDatabase.dart';
import 'package:bestfranchise/Helpers/general/generalHelper.dart';
import 'package:bestfranchise/Views/component/general/backgroundIconComponent.dart';
import 'package:bestfranchise/Views/component/general/buttonComponent.dart';
import 'package:bestfranchise/Views/component/general/touchEffectComponent.dart';
import 'package:bestfranchise/Views/component/home/rewardCardComponent.dart';
import 'package:bestfranchise/Views/component/profile/modalKetentuanLayananComponent.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_open_whatsapp/flutter_open_whatsapp.dart';
import 'package:flutter_screen_scaler/flutter_screen_scaler.dart';
import 'package:provider/provider.dart';
import 'dart:ui' as ui;

class ProfileWidget extends StatefulWidget {
  @override
  _ProfileWidgetState createState() => _ProfileWidgetState();
}

class _ProfileWidgetState extends State<ProfileWidget> {
  @override
  void initState() {
    // TODO: implement initState
    final data = Provider.of<CompanyController>(context, listen: false);
    data.loadCompany(context: context);
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    ScreenScaler scale = ScreenScaler()..init(context);
    final reward = Provider.of<RewardHomeController>(context);
    final user = Provider.of<UserController>(context);

    var fullname = user.dataUser[UserTable.fullname];
    return Scaffold(
      appBar: GeneralHelper.appBarWithImage(
          context: context,
          desc: "Edit profile",
          isAction: true,
          callback: () {
            Navigator.of(context).pushNamed(RoutePath.profileEditWidget);
          }),
      body: ListView(
        padding: scale.getPadding(1, 0),
        shrinkWrap: true,
        children: [
          Padding(
            padding: scale.getPadding(0, 2.6),
            child: Card(
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
                      desc: GeneralHelper()
                          .formatter
                          .format(int.parse(reward.infoModel.data.poin)),
                      icon: FontAwesome5Solid.database,
                    ),
                    RewardCardComponent(
                      img: "komisi",
                      title: "Komisi",
                      desc: GeneralHelper()
                          .formatter
                          .format(int.parse(reward.infoModel.data.saldoKomisi)),
                      icon: FontAwesome5Solid.wallet,
                    ),
                    RewardCardComponent(
                      img: "royalti",
                      title: "Royalti",
                      desc: GeneralHelper().formatter.format(
                          int.parse(reward.infoModel.data.saldoRoyalti)),
                      icon: FontAwesome5Solid.money_bill_alt,
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: scale.getHeight(1)),
          Padding(
            padding: scale.getPadding(0, 1.5),
            child: Column(
              children: [
                buildSectioMenu(
                    title: "Status Order",
                    icon: FontAwesome5Solid.archive,
                    callback: () {
                      Navigator.of(context)
                          .pushNamed(RoutePath.historyOrderWidget);
                    }),
                Padding(padding: scale.getPadding(0, 0.8), child: Divider()),
                buildSectioMenu(
                    title: "Toko Saya",
                    icon: FontAwesome5Solid.store,
                    callback: () {},
                    isActive: false),
                Padding(padding: scale.getPadding(0, 0.8), child: Divider()),
                buildSectioMenu(
                    title: "Bantuan Aplikasi",
                    icon: FontAwesome5Solid.question_circle,
                    callback: () {
                      Navigator.of(context)
                          .pushNamed(RoutePath.bantuanAplikasiWidget);
                    }),
                Padding(padding: scale.getPadding(0, 0.8), child: Divider()),
                buildSectioMenu(
                    title: "Live Chat",
                    icon: FontAwesome5Solid.comments,
                    callback: () async{
                      await GeneralHelper.sendWa(
                        context: context,
                        no:"6281223165037",
                        msg: "Hallo Admin, Saya $fullname ada beberapa hal yang ingin saya tanyakan, mohon agar segera di respon. Terima kasih."
                      );
                    }),
                Padding(padding: scale.getPadding(0, 0.8), child: Divider()),
                buildSectioMenu(
                    title: "Pengaturan Bahasa",
                    icon: FontAwesome5Solid.language,
                    callback: () {},
                    isActive: false
                    ),
                Padding(padding: scale.getPadding(0, 0.8), child: Divider()),
                buildSectioMenu(
                    title: "Ketentuan Layanan",
                    icon: FontAwesome5Solid.info_circle,
                    callback: () {
                      GeneralHelper.modal(
                          context: context,
                          child: ModalKetentuanLayananComponent());
                    }),
                Padding(padding: scale.getPadding(0, 0.8), child: Divider()),
                buildSectioMenu(
                    title: "Brand Favorite",
                    icon: FontAwesome5Solid.heart,
                    callback: () {
                      Navigator.of(context)
                          .pushNamed(RoutePath.brandFavoriteWidget);
                    }),
                Padding(padding: scale.getPadding(0, 0.8), child: Divider()),
                buildSectioMenu(
                    title: "Tentang Aplikasi",
                    icon: FontAwesome5Solid.building,
                    callback: () {
                      Navigator.of(context)
                          .pushNamed(RoutePath.tentangAplikasiWidget);
                    }),
                Padding(padding: scale.getPadding(0, 0.8), child: Divider()),
              ],
            ),
          ),
          SizedBox(
            height: scale.getHeight(1),
          ),
          Padding(
            padding: scale.getPadding(0, 2.6),
            child: ButtonComponent(
              label: "Logout",
              callback: () {
                GeneralHelper.nofitDialog(
                    context: context,
                    msg: "kamu yakin akan keluar dari aplikasi ?",
                    callback2: () {
                      GeneralHelper.processLogout(context);
                    },
                    callback1: () => Navigator.of(context).pop());
                // Navigator.of(context).pushNamed(RoutePath.onBoardingWidget);
              },
            ),
          )
        ],
      ),
    );
  }

  Widget buildSectioMenu(
      {String title = "",
      IconData icon,
      void Function() callback,
      bool isActive = true}) {
    ScreenScaler scale = new ScreenScaler()..init(context);
    return Padding(
      padding: scale.getPadding(0, 3),
      child: InTouchWidget(
        callback: (){
          if(!isActive){
            return GeneralHelper.toast(msg: "fitur ini masih dalam tahap pengembangan");
          }
          callback();
        },
        child: Row(
          children: [
            BackgroundIconComponent(
              child: Icon(icon, color: Colors.white),
            ),
            SizedBox(
              width: scale.getWidth(2),
            ),
            Text(title,
                style: Theme.of(context).textTheme.headline1.copyWith(
                    fontWeight: FontWeight.w400,
                    color: isActive ? Colors.black : ColorConfig.greyPrimary)),
          ],
        ),
      ),
    );
  }
}
