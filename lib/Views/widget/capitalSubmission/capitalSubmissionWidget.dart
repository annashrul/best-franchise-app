import 'package:bestfranchise/Configs/colorConfig.dart';
import 'package:bestfranchise/Configs/stringConfig.dart';
import 'package:bestfranchise/Controllers/capitalSubmission/capitalSubmissionController.dart';
import 'package:bestfranchise/Helpers/general/generalHelper.dart';
import 'package:bestfranchise/Views/component/capitalSubmission/modalBrandComponent.dart';
import 'package:bestfranchise/Views/component/capitalSubmission/modalInvestComponent.dart';
import 'package:bestfranchise/Views/component/capitalSubmission/modalRequirementsComponent.dart';
import 'package:bestfranchise/Views/component/general/buttonComponent.dart';
import 'package:bestfranchise/Views/component/general/fieldComponent.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screen_scaler/flutter_screen_scaler.dart';
import 'package:provider/provider.dart';

class CapitalSubmissionWidget extends StatefulWidget {
  final Map<dynamic, dynamic> obj;
  CapitalSubmissionWidget({this.obj});

  @override
  _CapitalSubmissionWidgetState createState() =>
      _CapitalSubmissionWidgetState();
}

class _CapitalSubmissionWidgetState extends State<CapitalSubmissionWidget> {
  @override
  Widget build(BuildContext context) {
    ScreenScaler scale = ScreenScaler()..init(context);
    final join = Provider.of<CapitalSubmissionController>(context);
    return Scaffold(
      appBar: GeneralHelper.appBarGeneral(
          context: context, title: "Pengajuan Modal Usaha"),
      body: ListView(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Image.asset(StringConfig.imgLocal + "imageRequirements.png"),
            ],
          ),
          Container(
            padding: scale.getPadding(1, 2),
            child: Column(children: [
              Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Kami bekerjasama dengan beberapa Bank lokal untuk menjalankan bisnis ini.. SIlahkan isi form di bawah ini ya !",
                    style: Theme.of(context).textTheme.headline1,
                  )),
              SizedBox(height: scale.getHeight(2)),
              FieldComponent(
                controller: join.namaPemilikController,
                labelText: "Nama Lengkap",
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
                controller: join.brandController,
                labelText: "Pilih Brand",
                onTap: () {
                  GeneralHelper.modal(
                      context: context, child: ModalBrandComponent());
                },
              ),
              SizedBox(height: scale.getHeight(1)),
              FieldComponent(
                controller: join.investController,
                labelText: "Pilih Tipe Investasi",
                onTap: () {
                  GeneralHelper.modal(
                      context: context, child: ModalInvestComponent());
                },
              ),
              SizedBox(height: scale.getHeight(1)),
              Align(
                  alignment: Alignment.centerLeft,
                  child: InkWell(
                      child: new Text(
                        'Baca Persyaratan KUR',
                        style: TextStyle(
                            color: ColorConfig.bluePrimary,
                            fontSize: 20,
                            decoration: TextDecoration.underline),
                      ),
                      onTap: () => {
                            GeneralHelper.modal(
                                context: context,
                                child: ModalRequirementsComponent())
                          })),
              SizedBox(height: scale.getHeight(1)),
              GridView.count(
                shrinkWrap: true,
                primary: true,
                crossAxisCount: 2,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                    child: Card(
                      elevation: 1,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0)),
                      child: InkWell(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Image.asset(StringConfig.imgLocal + "icCamera.png"),
                            SizedBox(height: 20),
                            Text(
                              "Foto KTP",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 20, color: Colors.black87),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                    child: Card(
                      elevation: 1,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0)),
                      child: InkWell(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Image.asset(StringConfig.imgLocal + "icCamera.png"),
                            SizedBox(height: 20),
                            Text(
                              "Foto KK",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 20, color: Colors.black87),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                    child: Card(
                      elevation: 1,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0)),
                      child: InkWell(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Image.asset(StringConfig.imgLocal + "icCamera.png"),
                            SizedBox(height: 20),
                            Text(
                              "Foto SKU",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 20, color: Colors.black87),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                    child: Card(
                      elevation: 1,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0)),
                      child: InkWell(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Image.asset(StringConfig.imgLocal + "icCamera.png"),
                            SizedBox(height: 20),
                            Text(
                              "Foto Rekening",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 20, color: Colors.black87),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ]),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        padding: scale.getPadding(1, 2),
        child: ButtonComponent(
          label: "Ajukan Pinjaman Modal",
          labelColor: Colors.white,
          backgroundColor: ColorConfig.redPrimary,
          callback: () => join.store(),
        ),
      ),
    );
  }
}
