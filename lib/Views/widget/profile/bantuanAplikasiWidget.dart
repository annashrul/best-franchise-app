import 'package:bestfranchise/Configs/colorConfig.dart';
import 'package:bestfranchise/Configs/stringConfig.dart';
import 'package:bestfranchise/Helpers/general/generalHelper.dart';
import 'package:bestfranchise/Views/component/general/fieldComponent.dart';
import 'package:bestfranchise/Views/component/general/searchComponent.dart';
import 'package:bestfranchise/Views/component/profile/bantuanAplikasi/contentBantuanAplikasiComponent.dart';
import 'package:bestfranchise/Views/component/profile/bantuanAplikasi/modalCategoryComponent.dart';
import 'package:bestfranchise/Views/component/reward/cardHeaderReward.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screen_scaler/flutter_screen_scaler.dart';
import 'package:getwidget/components/accordion/gf_accordion.dart';
class BantuanApliaskiWidget extends StatefulWidget {
  @override
  _BantuanApliaskiWidgetState createState() => _BantuanApliaskiWidgetState();
}

class _BantuanApliaskiWidgetState extends State<BantuanApliaskiWidget> {

  TextEditingController categoryController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    ScreenScaler scale = ScreenScaler()..init(context);
    return Scaffold(
      appBar: GeneralHelper.appBarGeneral(
          context: context,
          title: "Bantuan Aplikasi"
      ),
      body: ListView(
        padding: scale.getPadding(2, 2),
        children: [
          CardHeaderReward(
            img: "tandaTanya",
            title: "Frequently Ask Question",
            desc: "Ada yang dapat kami bantu ?",
          ),
          SizedBox(height: scale.getHeight(1)),
          SearchComponent(hintText: "Cari topik yang ingin kamu tanyakan"),
          SizedBox(height: scale.getHeight(1)),
          FieldComponent(
            controller: categoryController,
            labelText: "Kategori",
            onTap: (){
              GeneralHelper.modal(
                context: context,
                child: ModalCategoryBantuanApliaskiComponent()
              );
            },
          ),
          SizedBox(height: scale.getHeight(1)),
          ContentBantuanAplikasiComponent()
        ],
      ),
    );
  }
}
