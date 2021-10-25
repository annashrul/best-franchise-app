import 'package:bestfranchise/Controllers/baseController.dart';
import 'package:bestfranchise/Models/General/infoModel.dart';
import 'package:bestfranchise/Models/Home/rewardModel.dart';
import 'package:flutter/cupertino.dart';

class RewardHomeController with ChangeNotifier {
  InfoModel infoModel;
  bool isLoading = false;
  get({BuildContext context}) async {
    if (infoModel == null) isLoading = true;
    final res =
        await BaseController().get(url: "site/info", context: context);
    print("RESPONSE $res");
    if (res["meta"]['code'] == 200) {
      InfoModel result = InfoModel.fromJson(res);
      infoModel = result;
    } else {
      infoModel = null;
    }
    isLoading = false;
    notifyListeners();
  }
}
