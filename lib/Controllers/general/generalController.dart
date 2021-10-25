import 'package:bestfranchise/Controllers/baseController.dart';
import 'package:bestfranchise/Models/General/tentangAplikasiModel.dart';
import 'package:flutter/cupertino.dart';

class GeneralController with ChangeNotifier{
  TentangAplikasiModel tentangAplikasiModel;
  bool isLoadingTentangAplikasi=true;

  Future loadTentangAplikasi({BuildContext context})async{
    if(tentangAplikasiModel==null) isLoadingTentangAplikasi=true;
    final res=await BaseController().get(url: "site/company",context: context);

    TentangAplikasiModel result=TentangAplikasiModel.fromJson(res);
    tentangAplikasiModel=result;
    isLoadingTentangAplikasi=false;
    notifyListeners();
  }

}