import 'package:bestfranchise/Controllers/baseController.dart';
import 'package:bestfranchise/Models/Slider/sliderHomeModel.dart';
import 'package:flutter/cupertino.dart';

class SliderHomeController with ChangeNotifier{
  SliderHomeModel sliderHomeModel;
  bool isLoading=false;
  get({BuildContext context})async{
    if(sliderHomeModel==null) isLoading=true;
    final res = await BaseController().get(url: "sliders/list/utama?page=1&perpage=10&status=1",context: context);
    print("RESPONSE $res");
    if(res["data"].length>0){
      SliderHomeModel result=SliderHomeModel.fromJson(res);
      sliderHomeModel=result;
    }else{
      sliderHomeModel=null;
    }
    isLoading=false;
    notifyListeners();

  }

}