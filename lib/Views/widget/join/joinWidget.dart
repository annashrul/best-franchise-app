import 'package:bestfranchise/Configs/colorConfig.dart';
import 'package:bestfranchise/Configs/formConfig.dart';
import 'package:bestfranchise/Configs/stringConfig.dart';
import 'package:bestfranchise/Controllers/brand/franchiseController.dart';
import 'package:bestfranchise/Controllers/join/joinController.dart';
import 'package:bestfranchise/Controllers/user/userController.dart';
import 'package:bestfranchise/Databases/tableDatabase.dart';
import 'package:bestfranchise/Helpers/general/generalHelper.dart';
import 'package:bestfranchise/Views/component/general/buttonComponent.dart';
import 'package:bestfranchise/Views/component/general/fieldComponent.dart';
import 'package:bestfranchise/Views/component/join/modalTipeInvestasiComponent.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screen_scaler/flutter_screen_scaler.dart';
import 'package:provider/provider.dart';

class JoinWidget extends StatefulWidget {
  final dynamic obj;
  JoinWidget({this.obj});

  @override
  _JoinWidgetState createState() => _JoinWidgetState();
}

class _JoinWidgetState extends State<JoinWidget> {
  TextEditingController namaPemilikController = new TextEditingController();
  TextEditingController noTelponController = new TextEditingController();
  TextEditingController lokasiJualan = new TextEditingController();
  TextEditingController tipeController = new TextEditingController();
  String countryCode="62";
  String idTipe="";

  @override
  Widget build(BuildContext context) {
    ScreenScaler scale = ScreenScaler()..init(context);
    final join = Provider.of<JoinController>(context);
    final franchise = Provider.of<FranchiseController>(context);
    final user = Provider.of<UserController>(context);
    print(widget.obj);
    return Scaffold(
      appBar: GeneralHelper.appBarGeneral(context: context, title: "Bergabung"),
      body: ListView(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Image.network(widget.obj["cover"],width: double.infinity,fit: BoxFit.cover,),
              CircleAvatar(
                radius: 30,
                backgroundImage:
                NetworkImage(widget.obj["logo"]),
              )
            ],
          ),
          Container(
            padding: scale.getPadding(1, 2),
            child: Column(children: [
              Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Hi ${user.dataUser[UserTable.fullname]}. Tertarik dengan franchise : ${widget.obj["title"]} ?",
                    style: Theme.of(context).textTheme.headline2,
                  )),
              SizedBox(height: scale.getHeight(2)),
              Text(
                "Silahkan kamu lengkapi data - data di bawah ini ya ! Supaya kami dapat melakukan Verifikasi dengan mudah.",
                style: Theme.of(context).textTheme.headline2,
              ),
              SizedBox(height: scale.getHeight(2)),
              FieldComponent(
                controller: namaPemilikController,
                labelText: "Nama Pemilik",
                maxLength: 50,
              ),
              SizedBox(height: scale.getHeight(1)),
              FieldComponent(
                controller: noTelponController,
                labelText: "Nomor Handphone",
                maxLength: FormConfig.maxLengthPhone,
                keyboardType: TextInputType.number,
                isPhone: true,
                onTapCountry: (code){

                },
              ),
              SizedBox(height: scale.getHeight(1)),
              FieldComponent(
                controller: lokasiJualan,
                labelText: "Lokasi Jualan",
                maxLength: 200,
              ),
              SizedBox(height: scale.getHeight(1)),
              FieldComponent(
                controller: tipeController,
                labelText: "Pilih Tipe Investasi",
                onTap: () {
                  GeneralHelper.modal(context: context, child: ModalTipeInvestasiComponent(
                    idBrand: widget.obj["id"],
                    callback: (data){
                      print(data);
                      idTipe=data["id"];
                      tipeController.text="${data["title"]} - ${GeneralHelper().formatter.format(int.parse(data["price"]))}";
                      setState(() {});
                      franchise.setList(false);
                    },
                  ),callback: (){
                    franchise.setList(true);
                    Navigator.of(context).pop();
                  });
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
          callback: () => join.store(context: context,field: {
            "id_brand":widget.obj["id"],
            "id_type_invest":idTipe,
            "owner":namaPemilikController.text,
            "mobile_no":noTelponController.text,
            "outlet_address":lokasiJualan.text,
            "promo_code":"-",
            "country_code":countryCode
          }),
        ),
      ),
    );
  }
}
