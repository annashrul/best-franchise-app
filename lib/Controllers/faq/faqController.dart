import 'package:bestfranchise/Controllers/baseController.dart';
import 'package:bestfranchise/Models/Faq/faqCatModel.dart';
import 'package:bestfranchise/Models/Faq/faqModel.dart';
import 'package:flutter/cupertino.dart';

class FaqController with ChangeNotifier {
  FaqModel faqModel;
  FaqCatModel faqCatModel;
  bool isLoading = true;
  bool isLoadingCat = true;
  int perPage = 10;

  loadFaq({BuildContext context}) async {
    if (faqModel == null) isLoading = true;
    final res = await BaseController()
        .get(url: "faq?page=1&perpage=$perPage&status=1", context: context);
    print("############## ${res["data"].length}");
    if (res["data"].length > 0) {
      FaqModel result = FaqModel.fromJson(res);
      faqModel = result;
    } else {
      faqModel = null;
    }
    isLoading = false;
    notifyListeners();
  }

  loadFaqCat({BuildContext context}) async {
    if (faqCatModel == null) isLoadingCat = true;
    final res = await BaseController().get(
        url: "category/list/faq?page=1&perpage=$perPage&status=1",
        context: context);
    print("############## ${res["data"].length}");
    if (res["data"].length > 0) {
      FaqCatModel result = FaqCatModel.fromJson(res);
      faqCatModel = result;
    } else {
      faqCatModel = null;
    }
    isLoadingCat = false;
    notifyListeners();
  }
}
