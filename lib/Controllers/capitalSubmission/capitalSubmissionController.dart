import 'package:bestfranchise/Controllers/baseController.dart';
import 'package:bestfranchise/Helpers/general/generalHelper.dart';
import 'package:bestfranchise/Views/component/general/modalSuccessComponent.dart';
import 'package:flutter/cupertino.dart';

class CapitalSubmissionController with ChangeNotifier {
  TextEditingController namaPemilikController = new TextEditingController();
  TextEditingController noTelponController = new TextEditingController();
  TextEditingController lokasiJualan = new TextEditingController();
  TextEditingController brandController = new TextEditingController();
  TextEditingController investController = new TextEditingController();
  String idBrand="";
  String idInvestType="";

  setOther(input,type){
    if(type=="brand"){
      idBrand=input;
    }else{
      idInvestType=input;
    }
    notifyListeners();
  }

  Future store(BuildContext context,List dataPhoto,countryCode) async {



    if (namaPemilikController.text == "") {
      return GeneralHelper.toast(msg: "Nama pemilik tidak boleh kosong");
    }
    if (noTelponController.text == "") {
      return GeneralHelper.toast(msg: "Nomor Handphone tidak boleh kosong");
    }
    if (lokasiJualan.text == "") {
      return GeneralHelper.toast(msg: "Lokasi Jualan tidak boleh kosong");
    }
    if (brandController.text == "") {
      return GeneralHelper.toast(msg: "Brand tidak boleh kosong");
    }
    if (investController.text == "") {
      return GeneralHelper.toast(msg: "Tipe investasi tidak boleh kosong");
    }
    for(int i=0;i<dataPhoto.length;i++){
      if(dataPhoto[i]["required"]=="true" && dataPhoto[i]["img"]==""){
        GeneralHelper.toast(msg: "${dataPhoto[i]["title"]} tidak boleh kosong");
        print(dataPhoto[i]);
        return;
      }
    }
    Map<dynamic,dynamic> field={
      "id_brand":idBrand,
      "id_type_invest":idInvestType,
      "peminjam":namaPemilikController.text,
      "mobile_no":"$countryCode${noTelponController.text}",
      "outlet_address":lokasiJualan.text,
      "foto_ktp":"${dataPhoto[0]["base64"]}",
      "foto_kk":dataPhoto[1]["base64"].toString(),
      "foto_npwp":dataPhoto[2]["base64"].toString(),
      "foto_sku":dataPhoto[3]["base64"].toString(),
      "foto_rek":dataPhoto[4]["base64"].toString(),
      "foto_lainnya":dataPhoto[5]["base64"].toString()
    };
    print(field);
    final res = await BaseController().post(url: "pengajuan_modal",data: field,context: context);
    if(res!=null){
      idBrand="";
      idInvestType="";
      namaPemilikController.text="";
      noTelponController.text="";
      lokasiJualan.text="";
      brandController.text="";
      investController.text="";
      GeneralHelper.modal(
        context: context,
        child: ModalSuccessComponent()
      );

    }
    notifyListeners();
  }
}
