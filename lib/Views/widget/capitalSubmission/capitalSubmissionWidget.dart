import 'dart:io';

import 'package:bestfranchise/Configs/colorConfig.dart';
import 'package:bestfranchise/Configs/formConfig.dart';
import 'package:bestfranchise/Configs/stringConfig.dart';
import 'package:bestfranchise/Controllers/capitalSubmission/capitalSubmissionController.dart';
import 'package:bestfranchise/Helpers/general/generalHelper.dart';
import 'package:bestfranchise/Views/component/capitalSubmission/modalBrandComponent.dart';
import 'package:bestfranchise/Views/component/capitalSubmission/modalInvestComponent.dart';
import 'package:bestfranchise/Views/component/capitalSubmission/modalRequirementsComponent.dart';
import 'package:bestfranchise/Views/component/general/buttonComponent.dart';
import 'package:bestfranchise/Views/component/general/fieldComponent.dart';
import 'package:bestfranchise/Views/component/general/touchEffectComponent.dart';
import 'package:bestfranchise/Views/component/home/rewardCardComponent.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_screen_scaler/flutter_screen_scaler.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';

class CapitalSubmissionWidget extends StatefulWidget {
  final Map<dynamic, dynamic> obj;
  CapitalSubmissionWidget({this.obj});

  @override
  _CapitalSubmissionWidgetState createState() =>
      _CapitalSubmissionWidgetState();
}

class _CapitalSubmissionWidgetState extends State<CapitalSubmissionWidget> {
  List dataPhoto = [{"title":"Foto KTP","img":""},{"title":"Foto KK","img":""},{"title":"Foto SKU","img":""},{"title":"Foto Rekening","img":""}];

  @override
  Widget build(BuildContext context) {
    ScreenScaler scale = ScreenScaler()..init(context);
    final join = Provider.of<CapitalSubmissionController>(context);
    return Scaffold(
      appBar: GeneralHelper.appBarGeneral(
          context: context, title: "Pengajuan Modal Usaha"),
      body: ListView(
        shrinkWrap: true,
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
                    style: Theme.of(context).textTheme.headline2,
                  )),
              SizedBox(height: scale.getHeight(2)),
              FieldComponent(
                controller: join.namaPemilikController,
                labelText: "Nama Lengkap",
                maxLength: 50,
              ),
              SizedBox(height: scale.getHeight(1)),
              FieldComponent(
                controller: join.noTelponController,
                labelText: "Nomor Handphone",
                maxLength: FormConfig.maxLengthPhone,
                isPhone: true,
                keyboardType: TextInputType.number,
                onTapCountry: (code){},
              ),
              SizedBox(height: scale.getHeight(1)),
              FieldComponent(
                controller: join.lokasiJualan,
                labelText: "Lokasi Jualan",
                maxLength: 50,
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
              StaggeredGridView.countBuilder(
                padding: EdgeInsets.all(0.0),
                shrinkWrap: true,
                primary: false,
                crossAxisCount: 2,
                itemCount: dataPhoto.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    margin: EdgeInsets.zero,
                    elevation: 1,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
                    child: InTouchWidget(
                      radius: 15,
                      callback: ()async{
                        final img = await GeneralHelper.getImage("camera");
                        print(img);
                        dataPhoto[index]["img"]=img["path"];
                        setState(() {});
                      },
                      child: dataPhoto[index]["img"]!=""?Image.file(
                        File(dataPhoto[index]["img"])
                      ):Container(
                          padding: scale.getPadding(3,2),
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                RadiantGradientMask(
                                  child: Icon(FontAwesome5Solid.camera,color: Colors.white,size: scale.getTextSize(15)),
                                ),
                                SizedBox(height: 20),
                                Text(
                                  dataPhoto[index]["title"],
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontSize: 20, color: Colors.black87),
                                )
                              ],
                            ),
                          )
                      ),
                    )
                  );
                },
                staggeredTileBuilder: (int index) => new StaggeredTile.fit(1),
                mainAxisSpacing: 10.0,
                crossAxisSpacing: 10.0,
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
