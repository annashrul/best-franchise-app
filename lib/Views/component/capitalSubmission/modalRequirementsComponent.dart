import 'package:bestfranchise/Configs/colorConfig.dart';
import 'package:bestfranchise/Configs/stringConfig.dart';
import 'package:bestfranchise/Helpers/general/generalHelper.dart';
import 'package:bestfranchise/Views/component/general/touchEffectComponent.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screen_scaler/flutter_screen_scaler.dart';

class ModalRequirementsComponent extends StatefulWidget {
  @override
  _ModalRequirementsComponentState createState() =>
      _ModalRequirementsComponentState();
}

class _ModalRequirementsComponentState
    extends State<ModalRequirementsComponent> {
  @override
  Widget build(BuildContext context) {
    ScreenScaler scale = new ScreenScaler()..init(context);
    return Padding(
      padding: scale.getPadding(1, 4),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          GeneralHelper.headerModal(context: context, title: "Persyaratan KUR"),
          SizedBox(
            height: scale.getHeight(1),
          ),
          ListView(
            padding: EdgeInsets.zero,
            // padding: scale.getPadding(1, 2),
            shrinkWrap: true,
            children: [
              Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 1, // 20%
                      child: Text("1.",
                          style: Theme.of(context)
                              .textTheme
                              .headline2
                      ),
                    ),
                    Expanded(
                      flex: 9, // 20%
                      child: Text(
                          "Individu (perorangan) memiliki usaha yang telah berjalan minimal 6 bulan",
                          style: Theme.of(context)
                              .textTheme
                              .headline2
                              ),
                    ),
                  ]),
              Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 1, // 20%
                      child: Text("2.",
                          style: Theme.of(context)
                              .textTheme
                              .headline2
                              ),
                    ),
                    Expanded(
                      flex: 9, // 20%
                      child: Text(
                          "Menjalankan usahanya di salah satu platform e-commerce (misalnya Shopee, Tokopedia, Lazada, dan lainnya) dan/atau penyedia ride hailing (Gojek atau",
                          style: Theme.of(context)
                              .textTheme
                              .headline2),
                    ),
                  ]),
              Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 1, // 20%
                      child: Text("3.",
                          style: Theme.of(context)
                              .textTheme
                              .headline2),
                    ),
                    Expanded(
                      flex: 9, // 20%
                      child: Text(
                          "Tidak sedang menerima kredit dari perbankan kecuali kredit konsumtif seperti KPR, KKB, dan Kartu",
                          style: Theme.of(context)
                              .textTheme
                              .headline2),
                    ),
                  ]),
              Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 1, // 20%
                      child: Text("4.",
                          style: Theme.of(context)
                              .textTheme
                              .headline2),
                    ),
                    Expanded(
                      flex: 9, // 20%
                      child: Text(
                          "Persyaratan administrasi KUR BRI: Identitas berupa KTP, Kartu Keluarga (KK), dan surat ijin usaha (dapat berupa surat keterangan yang diterbitkan oleh e-commerce atau ride hailing)",
                          style: Theme.of(context)
                              .textTheme
                              .headline2),
                    ),
                    SizedBox(height: scale.getHeight(2)),
                  ]),
            ],
          )
        ],
      ),
    );
  }
}
