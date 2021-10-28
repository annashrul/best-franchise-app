// To parse this JSON data, do
//
//     final infoModel = infoModelFromJson(jsonString);

import 'dart:convert';

InfoModel infoModelFromJson(String str) => InfoModel.fromJson(json.decode(str));

String infoModelToJson(InfoModel data) => json.encode(data.toJson());

class InfoModel {
  InfoModel({
    this.meta,
    this.data,
    this.pagination,
    this.total,
  });

  Meta meta;
  Data data;
  Pagination pagination;
  List<dynamic> total;

  factory InfoModel.fromJson(Map<String, dynamic> json) => InfoModel(
        meta: Meta.fromJson(json["meta"]),
        data: Data.fromJson(json["data"]),
        pagination: Pagination.fromJson(json["pagination"]),
        total: List<dynamic>.from(json["total"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "meta": meta.toJson(),
        "data": data.toJson(),
        "pagination": pagination.toJson(),
        "total": List<dynamic>.from(total.map((x) => x)),
      };
}

class Data {
  Data({
    this.totalSaldo,
    this.totalWd,
    this.waAdmin,
    this.saldoKomisi,
    this.saldoRoyalti,
    this.poin,
    this.minWd,
    this.rekening,
  });

  String totalSaldo;
  String totalWd;
  String waAdmin;
  String saldoKomisi;
  String saldoRoyalti;
  String poin;
  String minWd;
  Rekening rekening;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        totalSaldo: json["total_saldo"],
        totalWd: json["total_wd"],
        waAdmin: json["wa_admin"],
        saldoKomisi: json["saldo_komisi"],
        saldoRoyalti: json["saldo_royalti"],
        poin: json["poin"],
        minWd: json["min_wd"],
        rekening: Rekening.fromJson(json["rekening"]),
      );

  Map<String, dynamic> toJson() => {
        "total_saldo": totalSaldo,
        "total_wd": totalWd,
        "wa_admin": waAdmin,
        "saldo_komisi": saldoKomisi,
        "saldo_royalti": saldoRoyalti,
        "poin": poin,
        "min_wd": minWd,
        "rekening": rekening.toJson(),
      };
}

class Rekening {
  Rekening({
    this.id,
    this.idMember,
    this.fullname,
    this.idBank,
    this.bankName,
    this.bankLogo,
    this.accName,
    this.accNo,
    this.createdAt,
    this.updatedAt,
  });

  String id;
  String idMember;
  String fullname;
  String idBank;
  String bankName;
  String bankLogo;
  String accName;
  String accNo;
  dynamic createdAt;
  dynamic updatedAt;

  factory Rekening.fromJson(Map<String, dynamic> json) => Rekening(
        id: json["id"],
        idMember: json["id_member"],
        fullname: json["fullname"],
        idBank: json["id_bank"],
        bankName: json["bank_name"],
        bankLogo: json["bank_logo"],
        accName: json["acc_name"],
        accNo: json["acc_no"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "id_member": idMember,
        "fullname": fullname,
        "id_bank": idBank,
        "bank_name": bankName,
        "bank_logo": bankLogo,
        "acc_name": accName,
        "acc_no": accNo,
        "created_at": createdAt,
        "updated_at": updatedAt,
      };
}

class Meta {
  Meta({
    this.status,
    this.code,
    this.message,
  });

  String status;
  int code;
  String message;

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        status: json["status"],
        code: json["code"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "code": code,
        "message": message,
      };
}

class Pagination {
  Pagination();

  factory Pagination.fromJson(Map<String, dynamic> json) => Pagination();

  Map<String, dynamic> toJson() => {};
}
