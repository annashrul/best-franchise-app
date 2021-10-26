import 'package:bestfranchise/Configs/apiConfig.dart';
import 'package:bestfranchise/Controllers/baseController.dart';
import 'package:bestfranchise/Controllers/user/userController.dart';
import 'package:bestfranchise/Databases/tableDatabase.dart';
import 'package:bestfranchise/Helpers/general/generalHelper.dart';
import 'package:bestfranchise/Views/component/general/modalSuccessComponent.dart';
import 'package:bestfranchise/Views/component/general/uploadImageComponent.dart';
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

    final field={
      "id_brand":idBrand,
      "id_type_invest":idInvestType,
      "peminjam":namaPemilikController.text,
      "mobile_no":"$countryCode${noTelponController.text}",
      "outlet_address":lokasiJualan.text,
      "foto_ktp":"-",
      "foto_kk":"-",
      "foto_npwp":"-",
      "foto_sku":"-",
      "foto_rek":"-",
      "foto_lainnya":"-",
    };


    final res = await BaseController().post(url: "pengajuan_modal",data: field,context: context);
    if(res!=null){
      // idBrand="";
      // idInvestType="";
      // namaPemilikController.text="";
      // noTelponController.text="";
      // lokasiJualan.text="";
      // brandController.text="";
      // investController.text="";
      String id=res["data"]["insertId"];
      GeneralHelper.modalGeneral(
          isBack: false,
          context: context,
          child: UploadImageComponent(
            callback: (data)async{},
            isPreview: true,
            isProgress: true,
            titleHeader: "Upload Foto KTP",
            callbackProgress: (data)async{
              final ktp=await update(context: context,id: id,field: {"foto_ktp":"${data["base64"]}"});
              if(ktp!=null){
                Navigator.of(context).pop();
                GeneralHelper.modalGeneral(
                    isBack: false,
                    context: context,
                    child: UploadImageComponent(
                      isPreview: true,
                      titleHeader: "Upload Foto KK",
                      isProgress: true,
                      callback: (data)async{},
                      callbackProgress: (data)async{
                        final kk=await update(context: context,id: id,field: {"foto_kk":"${data["base64"]}"});
                        if(kk!=null){
                          Navigator.of(context).pop();
                          GeneralHelper.modalGeneral(
                              isBack: false,
                              context: context,
                              child: UploadImageComponent(
                                callback: (data)async{},
                                isPreview: true,
                                titleHeader: "Upload Foto NPWP",
                                isProgress: true,
                                callbackProgress: (data)async{
                                  final npwp=await update(context: context,id: id,field: {"foto_npwp":"${data["base64"]}"});
                                  if(npwp!=null){
                                    Navigator.of(context).pop();
                                    GeneralHelper.modalGeneral(
                                        isBack: false,
                                        context: context,
                                        child: UploadImageComponent(
                                          callback: (data)async{},
                                          isPreview: true,
                                          titleHeader: "Upload Foto SKU",
                                          isProgress: true,
                                          callbackProgress: (data)async{
                                            final sku=await update(context: context,id: id,field: {"foto_sku":"${data["base64"]}"});
                                            if(sku!=null){
                                              Navigator.of(context).pop();
                                              GeneralHelper.modalGeneral(
                                                  isBack: false,
                                                  context: context,
                                                  child: UploadImageComponent(
                                                    callback: (data)async{},
                                                    isPreview: true,
                                                    titleHeader: "Upload Foto Rekeing",
                                                    isProgress: true,
                                                    callbackProgress: (data)async{
                                                      final rek=await update(context: context,id: id,field: {"foto_rek":"${data["base64"]}"});
                                                      if(rek!=null){
                                                        Navigator.of(context).pop();
                                                        GeneralHelper.modalGeneral(
                                                            isBack: false,
                                                            context: context,
                                                            child: UploadImageComponent(
                                                              callback: (data)async{},
                                                              isPreview: true,
                                                              titleHeader: "Upload Foto Lainnya (opsional)",
                                                              isProgress: true,
                                                              callbackProgress: (data)async{
                                                                final lainnya=await update(context: context,id: id,field: {"foto_lainnya":"${data["base64"]}"});
                                                                if(lainnya!=null){
                                                                  GeneralHelper.modalGeneral(context: context,child: ModalSuccessComponent(),isBack: false);
                                                                }
                                                              },
                                                            ),

                                                        );
                                                      }
                                                    },
                                                  )
                                              );
                                            }
                                          },
                                        )
                                    );
                                  }
                                },
                              )
                          );
                        }
                      },
                    )
                );
              }
            },
          )
      );
    }
    notifyListeners();
  }

  Future update({BuildContext context,id,dynamic field})async{
    final res=await BaseController().put(url: "pengajuan_modal/$id",data: field,context: context);
    return res;
  }
}
