import 'dart:io';

import 'package:bestfranchise/Configs/colorConfig.dart';
import 'package:bestfranchise/Configs/formConfig.dart';
import 'package:bestfranchise/Configs/stringConfig.dart';
import 'package:bestfranchise/Controllers/capitalSubmission/capitalSubmissionController.dart';
import 'package:bestfranchise/Helpers/general/generalHelper.dart';
import 'package:bestfranchise/Views/component/capitalSubmission/modalBrandComponent.dart';
import 'package:bestfranchise/Views/component/capitalSubmission/modalInvestComponent.dart';
import 'package:bestfranchise/Views/component/capitalSubmission/modalRequirementsComponent.dart';
import 'package:bestfranchise/Views/component/general/backgroundIconComponent.dart';
import 'package:bestfranchise/Views/component/general/buttonComponent.dart';
import 'package:bestfranchise/Views/component/general/fieldComponent.dart';
import 'package:bestfranchise/Views/component/general/touchEffectComponent.dart';
import 'package:bestfranchise/Views/component/general/uploadImageComponent.dart';
import 'package:bestfranchise/Views/component/home/rewardCardComponent.dart';
import 'package:bestfranchise/Views/component/join/modalTipeInvestasiComponent.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_screen_scaler/flutter_screen_scaler.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';

class CapitalSubmissionWidget extends StatefulWidget {
  final Map<dynamic, dynamic> obj;
  CapitalSubmissionWidget({this.obj});

  @override
  _CapitalSubmissionWidgetState createState() =>_CapitalSubmissionWidgetState();
}

class _CapitalSubmissionWidgetState extends State<CapitalSubmissionWidget> {
  List dataPhoto = [
    {"title":"Foto KTP","img":"","required":"true","base64":""},
    {"title":"Foto KK","img":"","required":"true","base64":""},
    {"title":"Foto NPWP","img":"","required":"true","base64":""},
    {"title":"Foto SKU","img":"","required":"true","base64":""},
    {"title":"Foto Rekening","img":"","required":"true","base64":""},
    {"title":"Foto Lainnya","img":"","required":"false","base64":"-"}
  ];
  String countryCode="62";
  TextEditingController con = TextEditingController();

  @override
  Widget build(BuildContext context) {
    ScreenScaler scale = ScreenScaler()..init(context);
    final join = Provider.of<CapitalSubmissionController>(context);
    print("#############${widget.obj}");
    return Scaffold(
      appBar: GeneralHelper.appBarGeneral(context: context, title: "Pengajuan Modal Usaha"),
      body: ListView(
        padding: scale.getPaddingLTRB(0,2,0,0),
        shrinkWrap: true,
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Image.network(widget.obj["banner"]),
            ],
          ),
          Container(
            padding: scale.getPadding(1, 2),
            child: Column(children: [
              Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    widget.obj["caption"],
                    style: Theme.of(context).textTheme.headline2,
                  )
              ),
              SizedBox(height: scale.getHeight(1),),
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
                onTapCountry: (code){
                  countryCode=code;
                  setState(() {});
                },
              ),
              SizedBox(height: scale.getHeight(1)),
              FieldComponent(
                controller: join.lokasiJualan,
                labelText: "Lokasi Jualan",
                maxLength: 200,
              ),
              SizedBox(height: scale.getHeight(1)),
              FieldComponent(
                readonly: true,
                controller: join.brandController,
                labelText: "Pilih Brand",
                onTap: () {
                  GeneralHelper.modal(context: context, child: Container(
                    height: scale.getHeight(85),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10)
                    ),
                    child: ModalBrandComponent(
                      callback: (data){
                        join.setOther(data["id"],"brand");
                        join.brandController.text=data["title"];
                        join.investController.text="";
                        join.idInvestType="";
                      },
                    ),
                  ));
                },
              ),
              SizedBox(height: scale.getHeight(1)),
              FieldComponent(
                readonly: true,
                controller: join.investController,
                labelText: "Pilih Tipe Investasi",
                onTap: () {
                  if(join.idBrand!=""){
                    GeneralHelper.modal(context: context, child: ModalTipeInvestasiComponent(
                      idBrand:join.idBrand,
                      callback: (data){
                        join.setOther(data["id"],"");
                        join.investController.text="${data["title"]} - ${GeneralHelper().formatter.format(int.parse(data["price"]))}";
                      },
                    ));
                  }
                  else{
                    GeneralHelper.toast(msg: "silahkan pilih brand terlebih dahulu");
                  }

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
              // SizedBox(height: scale.getHeight(1)),
              // FieldComponent(
              //   controller: con,
              //   labelText: "Lokasi Jualan",
              //   maxLength: 100000000,
              // ),
              // StaggeredGridView.countBuilder(
              //   padding: EdgeInsets.all(0.0),
              //   shrinkWrap: true,
              //   primary: false,
              //   crossAxisCount: 2,
              //   itemCount: dataPhoto.length,
              //   itemBuilder: (BuildContext context, int index) {
              //     return Card(
              //       margin: EdgeInsets.zero,
              //       elevation: 1,
              //       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
              //       child: InTouchWidget(
              //         radius: 15,
              //         callback: ()async{
              //           GeneralHelper.modal(
              //             context: context,
              //             child: UploadImageComponent(
              //               callback: (data){
              //                 Navigator.of(context).pop();
              //                 dataPhoto[index]["img"]=data["path"];
              //                 dataPhoto[index]["base64"]=data["base64"];
              //                 setState(() {});
              //               },
              //               isPreview: false,
              //             )
              //           );
              //         },
              //         child: dataPhoto[index]["img"]!=""?Image.file(
              //           File(dataPhoto[index]["img"]),
              //         ):Container(
              //             padding: scale.getPadding(3,2),
              //             child: Center(
              //               child: Column(
              //                 mainAxisAlignment: MainAxisAlignment.center,
              //                 crossAxisAlignment: CrossAxisAlignment.center,
              //                 children: <Widget>[
              //                   BackgroundIconComponent(
              //                     child: Icon(FontAwesome5Solid.camera,color: Colors.white,size: scale.getTextSize(15)),
              //                   ),
              //                   SizedBox(height: 20),
              //                   Text(
              //                     dataPhoto[index]["title"],
              //                     textAlign: TextAlign.center,
              //                     style: Theme.of(context).textTheme.headline2,
              //                   ),
              //                   if(dataPhoto[index]["required"]=="false")Text(
              //                     "( Opsional )",
              //                     textAlign: TextAlign.center,
              //                       style: Theme.of(context).textTheme.headline2,
              //                   )
              //                 ],
              //               ),
              //             )
              //         ),
              //       )
              //     );
              //   },
              //   staggeredTileBuilder: (int index) => new StaggeredTile.fit(1),
              //   mainAxisSpacing: 10.0,
              //   crossAxisSpacing: 10.0,
              // ),
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
          callback: () => join.store(context,dataPhoto,countryCode),
          // callback: (){
          //   GeneralHelper.modalGeneral(
          //       context: context,
          //       child: UploadImageComponent(
          //         callback: (data)async{},
          //         isPreview: true,
          //         isProgress: true,
          //         titleHeader: "Upload Foto KTP",
          //         callbackProgress: (data)async{
          //           Navigator.of(context).pop();
          //           GeneralHelper.modalGeneral(
          //               context: context,
          //               child: UploadImageComponent(
          //                 isPreview: true,
          //                 titleHeader: "Upload Foto KK",
          //                 isProgress: true,
          //                 callback: (data)async{},
          //                 callbackProgress: (data){
          //                   Navigator.of(context).pop();
          //                   GeneralHelper.modalGeneral(
          //                       context: context,
          //                       child: UploadImageComponent(
          //                         callback: (data)async{},
          //                         isPreview: true,
          //                         titleHeader: "Upload Foto NPWP",
          //                         isProgress: true,
          //                         callbackProgress: (data)async{
          //                           Navigator.of(context).pop();
          //                           GeneralHelper.modalGeneral(
          //                               context: context,
          //                               child: UploadImageComponent(
          //                                 callback: (data)async{},
          //                                 isPreview: true,
          //                                 titleHeader: "Upload Foto SKU",
          //                                 isProgress: true,
          //                                 callbackProgress: (data){
          //                                   Navigator.of(context).pop();
          //                                   GeneralHelper.modalGeneral(
          //                                       context: context,
          //                                       child: UploadImageComponent(
          //                                         callback: (data)async{},
          //                                         isPreview: true,
          //                                         titleHeader: "Upload Foto Rekeing",
          //                                         isProgress: true,
          //                                         callbackProgress: (data){
          //                                           Navigator.of(context).pop();
          //                                           GeneralHelper.modalGeneral(
          //                                               context: context,
          //                                               child: UploadImageComponent(
          //                                                 callback: (data)async{},
          //                                                 isPreview: true,
          //                                                 titleHeader: "Upload Foto Lainnya (opsional)",
          //                                                 isProgress: true,
          //                                                 callbackProgress: (data){
          //
          //                                                 },
          //                                               )
          //                                           );
          //                                         },
          //                                       )
          //                                   );
          //                                 },
          //                               )
          //                           );
          //                         },
          //                       )
          //                   );
          //                 },
          //               )
          //           );
          //         },
          //       )
          //   );
          // },
        ),
      ),
    );
  }
}




