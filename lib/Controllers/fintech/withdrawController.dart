import 'package:bestfranchise/Controllers/baseController.dart';
import 'package:bestfranchise/Helpers/general/generalHelper.dart';
import 'package:bestfranchise/Models/withdraw/withdrawModel.dart';

import 'package:bestfranchise/Controllers/home/rewardHomeController.dart';
import 'package:bestfranchise/Views/component/general/modalSuccessComponent.dart';
import 'package:bestfranchise/Views/widget/auth/pinWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class WithdrawController with ChangeNotifier {
  TextEditingController noRekeningController = new TextEditingController();
  TextEditingController atasNamaController = new TextEditingController();
  TextEditingController bankController = new TextEditingController();
  WithdrawModel withdrawModel;
  bool isLoading = true;
  int perPage = 10;

  Future loadWithdraw({BuildContext context}) async {
    if (withdrawModel == null) isLoading = true;
    final res = await BaseController().get(
        url: "transaction/withdrawal?page=1&perpage=$perPage&status=1",
        context: context);
    print("############## ${res["data"].length}");
    if (res["data"].length > 0) {
      WithdrawModel result = WithdrawModel.fromJson(res);
      withdrawModel = result;
    } else {
      withdrawModel = null;
    }
    isLoading = false;
    notifyListeners();
  }

  setField(input, field) {
    if (field == "noRekening") {
      noRekeningController.text = input;
    } else if (field == "atasNama") {
      atasNamaController.text = input;
    } else {
      bankController.text = input;
    }
    notifyListeners();
  }

  Future store({BuildContext context}) async {
    final info = Provider.of<RewardHomeController>(context, listen: false);

    if (noRekeningController.text == "") {
      return GeneralHelper.toast(msg: "No rekening tidak boleh kosong");
    }
    if (atasNamaController.text == "") {
      return GeneralHelper.toast(msg: "Atas nama tidak boleh kosong");
    }
    if (bankController.text == "") {
      return GeneralHelper.toast(msg: "Bank tidak boleh kosong");
    }
    GeneralHelper.modalGeneral(
        child: PinWidget(
          callback: (pin) async {
            print(pin);
            final data = {
              "member_pin": "$pin",
              "id_bank": "${info.infoModel.data.rekening.idBank}",
              "acc_name": atasNamaController.text,
              "acc_no": noRekeningController.text,
              "amount": "${info.infoModel.data.totalSaldo}"
            };
            final res = await BaseController().post(
                url: "transaction/withdrawal", data: data, context: context);
            if (res != null) {
              info.get(context: context);
              GeneralHelper.modal(
                  isBack:true,context: context, child: ModalSuccessComponent());
            }
          },
        ),
        context: context);
    notifyListeners();
  }
}
