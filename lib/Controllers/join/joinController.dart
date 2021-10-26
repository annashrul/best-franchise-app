import 'package:bestfranchise/Configs/formConfig.dart';
import 'package:bestfranchise/Controllers/baseController.dart';
import 'package:bestfranchise/Helpers/general/generalHelper.dart';
import 'package:bestfranchise/Views/component/general/modalSuccessComponent.dart';
import 'package:flutter/cupertino.dart';

class JoinController with ChangeNotifier {


  Future store({BuildContext context,Map<String,dynamic> field}) async {
    if (field["owner"] == "") {
      return GeneralHelper.toast(msg: "Nama pemilik tidak boleh kosong");
    }
    if (field["mobile_no"] == "") {
      return GeneralHelper.toast(msg: "Nomor Handphone tidak boleh kosong");
    }
    if (field["outlet_address"] == "") {
      return GeneralHelper.toast(msg: "Lokasi Jualan tidak boleh kosong");
    }
    if (field["id_type_invest"] == "") {
      return GeneralHelper.toast(msg: "Tipe Investasi tidak boleh kosong");
    }
    String phone = FormConfig.validatePhoneNumber("${field["country_code"]}","${field["mobile_no"]}");
    if(phone.length<FormConfig.minLengthPhone){
      return GeneralHelper.toast(msg: "Nomor Handphone terlalu pendek");
    }

    final data={
      "id_brand":field["id_brand"],
      "id_type_invest":field["id_type_invest"],
      "owner":field["owner"],
      "mobile_no":phone,
      "outlet_address":field["outlet_address"],
      "promo_code":"-"
    };
    final res = await BaseController().post(url: "franchise",data: data,context: context);
    if(res!=null){
      print(res);
      GeneralHelper.modalGeneral(context: context, child:ModalSuccessComponent());
    }
    notifyListeners();
  }
}
