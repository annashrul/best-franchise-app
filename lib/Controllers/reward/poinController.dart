import 'package:bestfranchise/Controllers/baseController.dart';
import 'package:bestfranchise/Helpers/general/generalHelper.dart';
import 'package:bestfranchise/Models/RedeemPoin/merchandiseModel.dart';
import 'package:bestfranchise/Models/RedeemPoin/voucherModel.dart';
import 'package:bestfranchise/Models/Reward/listMutasiPoinModel.dart';
import 'package:bestfranchise/Views/component/general/modalSuccessComponent.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class PoinController with ChangeNotifier {
  TextEditingController id_merchandise = new TextEditingController();
  TextEditingController penerima = new TextEditingController();
  TextEditingController kd_kec = new TextEditingController();
  TextEditingController kd_kota = new TextEditingController();
  TextEditingController kd_prov = new TextEditingController();
  TextEditingController address = new TextEditingController();
  TextEditingController mobile_no = new TextEditingController();

  int indexActive = 0;
  VoucherModel voucherModel;
  MerchandiseModel merchandiseModel;
  ListMutasiPoinModel listMutasiPoinModel;
  bool isLoadingVoucher = true;
  bool isLoadingMerchandise = true;
  bool isLoadingList = true;
  bool isLoadMoreList = false;
  int perPage = 10;
  DateTime dateFrom = DateTime.now(), dateTo = DateTime.now();
  setDate({BuildContext context, input}) {
    dateFrom = input["from"];
    dateTo = input["to"];
    isLoadingList = true;
    loadBonusPin(context: context);
    notifyListeners();
  }

  Future loadBonusPin({BuildContext context}) async {
    if (listMutasiPoinModel == null) isLoadingList = true;
    final res = await BaseController().get(
        url:
            "transaction/report/mutasi_bonus/poin?perpage=$perPage&datefrom=${GeneralHelper.convertDateToYMD(dateFrom)}&dateto=${GeneralHelper.convertDateToYMD(dateTo)}",
        context: context);
    if (res["data"].length > 0) {
      ListMutasiPoinModel result = ListMutasiPoinModel.fromJson(res);
      listMutasiPoinModel = result;
    } else {
      listMutasiPoinModel = null;
    }
    isLoadingList = false;
    isLoadMoreList = false;
    notifyListeners();
  }

  loadMore(BuildContext context) {
    if (perPage < int.parse(listMutasiPoinModel.pagination.total)) {
      isLoadMoreList = true;
      perPage += 10;
      loadBonusPin(context: context);
    } else {
      isLoadMoreList = false;
    }
    notifyListeners();
  }

  Future loadVoucher({BuildContext context}) async {
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

  Future loadMerchandise({BuildContext context}) async {
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

  setIndexActive(input, context) {
    indexActive = input;
    if (input == 0) {
      loadMerchandise(context: context);
    } else {
      loadVoucher(context: context);
    }
    notifyListeners();
  }

  Future redeemV({BuildContext context, Map<String, dynamic> field}) async {
    if (field["id_voucher"] == "") {
      return GeneralHelper.toast(msg: "ID Voucher tidak boleh kosong");
    }
    final data = {
      "id_voucher": field["id_voucher"],
    };

    final res = await BaseController()
        .post(url: "redeem/voucher", data: data, context: context);
    if (res != null) {
      print("========== $res");
      GeneralHelper.modal(context: context, child: ModalSuccessComponent());
    }
    notifyListeners();
  }

  Future redeemM({BuildContext context, Map<String, dynamic> field}) async {
    if (field["id_merchandise"] == "") {
      return GeneralHelper.toast(msg: "id_merchandise tidak boleh kosong");
    }
    if (field["penerima"] == "") {
      return GeneralHelper.toast(msg: "penerima tidak boleh kosong");
    }
    if (field["kd_kec"] == "") {
      return GeneralHelper.toast(msg: "kd_kec tidak boleh kosong");
    }
    if (field["kd_kota"] == "") {
      return GeneralHelper.toast(msg: "kd_kota tidak boleh kosong");
    }
    if (field["kd_prov"] == "") {
      return GeneralHelper.toast(msg: "kd_prov tidak boleh kosong");
    }
    if (field["address"] == "") {
      return GeneralHelper.toast(msg: "address tidak boleh kosong");
    }
    if (field["mobile_no"] == "") {
      return GeneralHelper.toast(msg: "mobile_no tidak boleh kosong");
    }
    final data = {
      "id_merchandise": field["id_merchandise"],
      "penerima": field["penerima"],
      "kd_kec": field["kd_kec"],
      "kd_kota": field["kd_kota"],
      "kd_prov": field["kd_prov"],
      "address": field["address"],
      "mobile_no": field["mobile_no"],
    };

    final res = await BaseController()
        .post(url: "redeem/merchandise", data: data, context: context);
    if (res != null) {
      print(res);
      GeneralHelper.modal(context: context, child: ModalSuccessComponent());
    }
    notifyListeners();
  }
}
