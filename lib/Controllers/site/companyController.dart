import 'package:bestfranchise/Controllers/baseController.dart';
import 'package:bestfranchise/Models/site/companyModel.dart';
import 'package:flutter/cupertino.dart';

class CompanyController with ChangeNotifier {
  CompanyModel companyModel;
  bool isLoading = true;
  int perPage = 10;

  loadCompany({BuildContext context}) async {
    if (companyModel == null) isLoading = true;
    final res =
        await BaseController().get(url: "site/company", context: context);
    print("############## ${res["data"].length}");
    if (res["data"] != {}) {
      CompanyModel result = CompanyModel.fromJson(res);
      companyModel = result;
    } else {
      companyModel = null;
    }
    isLoading = false;
    notifyListeners();
  }
}
