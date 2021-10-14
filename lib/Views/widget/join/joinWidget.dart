import 'package:bestfranchise/Configs/colorConfig.dart';
import 'package:bestfranchise/Configs/stringConfig.dart';
import 'package:bestfranchise/Controllers/join/joinController.dart';
import 'package:bestfranchise/Helpers/general/generalHelper.dart';
import 'package:bestfranchise/Views/component/general/buttonComponent.dart';
import 'package:bestfranchise/Views/component/general/fieldComponent.dart';
import 'package:bestfranchise/Views/component/join/modalTipeInvestasiComponent.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screen_scaler/flutter_screen_scaler.dart';
import 'package:provider/provider.dart';

class JoinWidget extends StatefulWidget {
  final Map<dynamic, dynamic> obj;
  JoinWidget({this.obj});

  @override
  _JoinWidgetState createState() => _JoinWidgetState();
}

class _JoinWidgetState extends State<JoinWidget> {
  @override
  Widget build(BuildContext context) {
    ScreenScaler scale = ScreenScaler()..init(context);
    final join = Provider.of<JoinController>(context);
    return Scaffold(
      appBar: GeneralHelper.appBarGeneral(context: context, title: "Bergabung"),
      body: ListView(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Image.asset(StringConfig.imgLocal + "detailBrand.png"),
              Image.asset(StringConfig.imgLocal + "burhot.png"),
            ],
          ),
          Container(
            padding: scale.getPadding(1, 2),
            child: Column(children: [
              Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Hi Andri Sani. Tertarik dengan franchise : BURHOT ?",
                    style: Theme.of(context).textTheme.headline1,
                  )),
              SizedBox(height: scale.getHeight(2)),
              Text(
                "Silahkan kamu lengkapi data - data di bawah ini ya ! Supaya kami dapat melakukan Verifikasi dengan mudah.",
                style: Theme.of(context).textTheme.headline1,
              ),
              SizedBox(height: scale.getHeight(2)),
              FieldComponent(
                controller: join.namaPemilikController,
                labelText: "Nama Pemilik",
              ),
              SizedBox(height: scale.getHeight(1)),
              FieldComponent(
                controller: join.noTelponController,
                labelText: "Nomor Handphone",
              ),
              SizedBox(height: scale.getHeight(1)),
              FieldComponent(
                controller: join.lokasiJualan,
                labelText: "Lokasi Jualan",
              ),
              SizedBox(height: scale.getHeight(1)),
              FieldComponent(
                controller: join.tipeController,
                labelText: "Pilih Tipe Investasi",
                onTap: () {
                  GeneralHelper.modal(
                      context: context, child: ModalTipeInvestasiComponent());
                },
              ),
            ]),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        padding: scale.getPadding(1, 2),
        child: ButtonComponent(
          label: "Bergabung sekarang?",
          labelColor: Colors.white,
          backgroundColor: ColorConfig.redPrimary,
          callback: () => join.store(),
        ),
      ),
    );
  }
}
