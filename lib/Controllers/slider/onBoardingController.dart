import 'package:bestfranchise/Controllers/baseController.dart';
import 'package:bestfranchise/Models/Slider/galleryHomeModel.dart';
import 'package:bestfranchise/Models/Slider/sliderHomeModel.dart';
import 'package:bestfranchise/Models/Slider/sliderHomePaketHematModel.dart';
import 'package:bestfranchise/Models/Slider/sliderHomeSolusiModel.dart';
import 'package:bestfranchise/Models/Slider/sliderHomeTestiModel.dart';
import 'package:bestfranchise/Models/Slider/sliderHomeYtModel.dart';
import 'package:bestfranchise/Models/Slider/sliderOnBoardingModel.dart';
import 'package:flutter/cupertino.dart';

class OnBoardingController with ChangeNotifier {
  SliderOnBoardingModel sliderOnBoardingModel;
  bool isLoading = false;
  loadData({BuildContext context}) async {
    if (sliderOnBoardingModel == null) isLoading = true;
    final res = await BaseController().get(url: "sliders/new/onboarding?status=1", context: context);
    print("################## RESPONSE ONBOARDING $res");
    if (res["data"].length > 0) {
      SliderOnBoardingModel result = SliderOnBoardingModel.fromJson(res);
      sliderOnBoardingModel = result;
    } else {
      sliderOnBoardingModel = null;
    }
    isLoading = false;
    notifyListeners();
  }

}
