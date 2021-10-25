// To parse this JSON data, do
//
//     final withdrawModel = withdrawModelFromJson(jsonString);

import 'dart:convert';

WithdrawModel withdrawModelFromJson(String str) =>
    WithdrawModel.fromJson(json.decode(str));

String withdrawModelToJson(WithdrawModel data) => json.encode(data.toJson());

class WithdrawModel {
  WithdrawModel({
    this.meta,
    this.data,
    this.pagination,
    this.total,
  });

  Meta meta;
  List<Datum> data;
  Pagination pagination;
  List<dynamic> total;

  factory WithdrawModel.fromJson(Map<String, dynamic> json) => WithdrawModel(
        meta: Meta.fromJson(json["meta"]),
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        pagination: Pagination.fromJson(json["pagination"]),
        total: List<dynamic>.from(json["total"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "meta": meta.toJson(),
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "pagination": pagination.toJson(),
        "total": List<dynamic>.from(total.map((x) => x)),
      };
}

class Datum {
  String totalrecords;
  String id;
  String idMember;
  String fullname;
  String idBank;
  String bankName;
  String accName;
  String accNo;
  String amount;
  String charge;
  int status;
  String kdTrx;
  String createdAt;
  String updatedAt;

  Datum(
      {this.totalrecords,
      this.id,
      this.idMember,
      this.fullname,
      this.idBank,
      this.bankName,
      this.accName,
      this.accNo,
      this.amount,
      this.charge,
      this.status,
      this.kdTrx,
      this.createdAt,
      this.updatedAt});

  Datum.fromJson(Map<String, dynamic> json) {
    totalrecords = json['totalrecords'];
    id = json['id'];
    idMember = json['id_member'];
    fullname = json['fullname'];
    idBank = json['id_bank'];
    bankName = json['bank_name'];
    accName = json['acc_name'];
    accNo = json['acc_no'];
    amount = json['amount'];
    charge = json['charge'];
    status = json['status'];
    kdTrx = json['kd_trx'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['totalrecords'] = this.totalrecords;
    data['id'] = this.id;
    data['id_member'] = this.idMember;
    data['fullname'] = this.fullname;
    data['id_bank'] = this.idBank;
    data['bank_name'] = this.bankName;
    data['acc_name'] = this.accName;
    data['acc_no'] = this.accNo;
    data['amount'] = this.amount;
    data['charge'] = this.charge;
    data['status'] = this.status;
    data['kd_trx'] = this.kdTrx;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
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
  Pagination({
    this.total,
    this.perPage,
    this.offset,
    this.to,
    this.lastPage,
    this.currentPage,
    this.from,
  });

  String total;
  int perPage;
  int offset;
  int to;
  int lastPage;
  int currentPage;
  int from;

  factory Pagination.fromJson(Map<String, dynamic> json) => Pagination(
        total: json["total"],
        perPage: json["per_page"],
        offset: json["offset"],
        to: json["to"],
        lastPage: json["last_page"],
        currentPage: json["current_page"],
        from: json["from"],
      );

  Map<String, dynamic> toJson() => {
        "total": total,
        "per_page": perPage,
        "offset": offset,
        "to": to,
        "last_page": lastPage,
        "current_page": currentPage,
        "from": from,
      };
}
