import 'package:bestfranchise/Controllers/baseController.dart';
import 'package:bestfranchise/Models/Slider/galleryHomeModel.dart';
import 'package:bestfranchise/Models/Slider/sliderHomeModel.dart';
import 'package:bestfranchise/Models/Slider/sliderHomePaketHematModel.dart';
import 'package:bestfranchise/Models/Slider/sliderHomeSolusiModel.dart';
import 'package:bestfranchise/Models/Slider/sliderHomeTestiModel.dart';
import 'package:bestfranchise/Models/Slider/sliderHomeYtModel.dart';
import 'package:flutter/cupertino.dart';

class SliderHomeController with ChangeNotifier {
  SliderHomeModel sliderHomeModel;
  SliderHomePaketHematModel sliderHomePaketHematModel;
  SliderHomeYtModel sliderHomeYtModel;
  SliderHomeSolusiModel sliderHomeSolusiModel;
  SliderHomeTestiModel sliderHomeTestiModel;
  GalleryHomeModel galleryHomeModel;

  bool isLoading = false;
  bool isLoadingPaketHemat = false;
  bool isLoadingYt = false;
  bool isLoadingSolusi = false;
  bool isLoadingTesti = false;
  bool isLoadingGallery = false;

  String route="";
  setRoute(input){
    route=input;
    notifyListeners();
  }

  get({BuildContext context}) async {
    if (sliderHomeModel == null) isLoading = true;
    final res = await BaseController().get(
        url: "sliders/list/utama?page=1&perpage=10&status=1", context: context);
    print("RESPONSE $res");
    if (res["data"].length > 0) {
      SliderHomeModel result = SliderHomeModel.fromJson(res);
      sliderHomeModel = result;
    } else {
      sliderHomeModel = null;
    }
    isLoading = false;
    notifyListeners();
  }

  getPaketHemat({BuildContext context}) async {
    if (sliderHomePaketHematModel == null) isLoadingPaketHemat = true;
    final res = await BaseController()
        .get(url: "sliders/list/paket_hemat?status=1", context: context);
    print("RESPONSE $res");
    if (res["data"].length > 0) {
      SliderHomePaketHematModel result =
          SliderHomePaketHematModel.fromJson(res);
      sliderHomePaketHematModel = result;
    } else {
      sliderHomePaketHematModel = null;
    }
    isLoadingPaketHemat = false;
    notifyListeners();
  }

  getYt({BuildContext context}) async {
    if (sliderHomeYtModel == null) isLoadingYt = true;
    final res = await BaseController()
        .get(url: "sliders/list/video?status=1", context: context);
    print("RESPONSE $res");
    if (res["data"].length > 0) {
      SliderHomeYtModel result = SliderHomeYtModel.fromJson(res);
      sliderHomeYtModel = result;
    } else {
      sliderHomeYtModel = null;
    }
    isLoadingYt = false;
    notifyListeners();
  }

  getSolusi({BuildContext context}) async {
    if (sliderHomeSolusiModel == null) isLoadingSolusi = true;
    final res = await BaseController()
        .get(url: "sliders/list/solusi?status=1", context: context);
    print("RESPONSE $res");
    if (res["data"].length > 0) {
      SliderHomeSolusiModel result = SliderHomeSolusiModel.fromJson(res);
      sliderHomeSolusiModel = result;
    } else {
      sliderHomeSolusiModel = null;
    }
    isLoadingSolusi = false;
    notifyListeners();
  }

  getTesti({BuildContext context}) async {
    if (sliderHomeTestiModel == null) isLoadingTesti = true;
    final res = await BaseController().get(url: "testimoni", context: context);
    print("RESPONSE $res");
    if (res["data"].length > 0) {
      SliderHomeTestiModel result = SliderHomeTestiModel.fromJson(res);
      sliderHomeTestiModel = result;
    } else {
      sliderHomeTestiModel = null;
    }
    isLoadingTesti = false;
    notifyListeners();
  }

  getGallery({BuildContext context}) async {
    if (galleryHomeModel == null) isLoadingGallery = true;
    final res = await BaseController()
        .get(url: "gallery?page=1&perpage=9", context: context);
    print("RESPONSE $res");
    if (res["data"].length > 0) {
      GalleryHomeModel result = GalleryHomeModel.fromJson(res);
      galleryHomeModel = result;
    } else {
      galleryHomeModel = null;
    }
    isLoadingGallery = false;
    notifyListeners();
  }
}
