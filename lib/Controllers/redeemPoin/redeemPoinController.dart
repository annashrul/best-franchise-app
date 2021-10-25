import 'package:bestfranchise/Controllers/baseController.dart';
import 'package:bestfranchise/Models/RedeemPoin/merchandiseModel.dart';
import 'package:bestfranchise/Models/RedeemPoin/voucherModel.dart';
import 'package:flutter/cupertino.dart';

class RedeemPoinController with ChangeNotifier {
  VoucherModel voucherModel;
  MerchandiseModel merchandiseModel;
  bool isLoadingVoucher = true;
  bool isLoadingMerchandise = true;
  int perPage = 10;

  loadVoucher({BuildContext context}) async {
    if (voucherModel == null) isLoadingVoucher = true;
    final res = await BaseController()
        .get(url: "voucher?page=1&perpage=$perPage&status=1", context: context);
    print("############## ${res["data"].length}");
    if (res["data"].length > 0) {
      VoucherModel result = VoucherModel.fromJson(res);
      voucherModel = result;
    } else {
      voucherModel = null;
    }
    isLoadingVoucher = false;
    notifyListeners();
  }

  loadMerchandise({BuildContext context}) async {
    if (merchandiseModel == null) isLoadingMerchandise = true;
    final res = await BaseController().get(
        url: "merchandise?page=1&perpage=$perPage&status=1", context: context);
    print("############## ${res["data"].length}");
    if (res["data"].length > 0) {
      MerchandiseModel result = MerchandiseModel.fromJson(res);
      merchandiseModel = result;
    } else {
      merchandiseModel = null;
    }
    isLoadingMerchandise = false;
    notifyListeners();
  }
}
