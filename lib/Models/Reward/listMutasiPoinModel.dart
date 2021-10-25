// To parse this JSON data, do
//
//     final listMutasiPoinModel = listMutasiPoinModelFromJson(jsonString);

import 'dart:convert';

ListMutasiPoinModel listMutasiPoinModelFromJson(String str) =>
    ListMutasiPoinModel.fromJson(json.decode(str));

String listMutasiPoinModelToJson(ListMutasiPoinModel data) =>
    json.encode(data.toJson());

class ListMutasiPoinModel {
  ListMutasiPoinModel({
    this.meta,
    this.data,
    this.pagination,
    this.total,
  });

  Meta meta;
  List<Datum> data;
  Pagination pagination;
  List<dynamic> total;

  factory ListMutasiPoinModel.fromJson(Map<String, dynamic> json) =>
      ListMutasiPoinModel(
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
  String records;
  String id;
  int type;
  String idMember;
  String member;
  String idDownline;
  String downline;
  String downlinePhoto;
  String downlineMobileNo;
  String idBrand;
  String brand;
  String brandLogo;
  String msg;
  String nominal;
  String createdAt;
  String updatedAt;

  Datum(
      {this.records,
      this.id,
      this.type,
      this.idMember,
      this.member,
      this.idDownline,
      this.downline,
      this.downlinePhoto,
      this.downlineMobileNo,
      this.idBrand,
      this.brand,
      this.brandLogo,
      this.msg,
      this.nominal,
      this.createdAt,
      this.updatedAt});

  Datum.fromJson(Map<String, dynamic> json) {
    records = json['records'];
    id = json['id'];
    type = json['type'];
    idMember = json['id_member'];
    member = json['member'];
    idDownline = json['id_downline'];
    downline = json['downline'];
    downlinePhoto = json['downline_photo'];
    downlineMobileNo = json['downline_mobile_no'];
    idBrand = json['id_brand'];
    brand = json['brand'];
    brandLogo = json['brand_logo'];
    msg = json['msg'];
    nominal = json['nominal'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['records'] = this.records;
    data['id'] = this.id;
    data['type'] = this.type;
    data['id_member'] = this.idMember;
    data['member'] = this.member;
    data['id_downline'] = this.idDownline;
    data['downline'] = this.downline;
    data['downline_photo'] = this.downlinePhoto;
    data['downline_mobile_no'] = this.downlineMobileNo;
    data['id_brand'] = this.idBrand;
    data['brand'] = this.brand;
    data['brand_logo'] = this.brandLogo;
    data['msg'] = this.msg;
    data['nominal'] = this.nominal;
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
