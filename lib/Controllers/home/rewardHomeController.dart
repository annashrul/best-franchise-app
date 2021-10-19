import 'package:bestfranchise/Controllers/baseController.dart';
import 'package:bestfranchise/Models/Home/rewardModel.dart';
import 'package:flutter/cupertino.dart';

class RewardHomeController with ChangeNotifier {
  RewardModel rewardHomeModel;
  bool isLoading = false;
  get({BuildContext context}) async {
    if (rewardHomeModel == null) isLoading = true;
    final res =
        await BaseController().get(url: "site/config", context: context);
    print("RESPONSE $res");
    if (res["meta"]['code'] == 200) {
      RewardModel result = RewardModel.fromJson(res);
      rewardHomeModel = result;
    } else {
      rewardHomeModel = null;
    }
    isLoading = false;
    notifyListeners();
  }
}
