// To parse this JSON data, do
//
//     final allLokasiBrandModel = allLokasiBrandModelFromJson(jsonString);

import 'dart:convert';

AllLokasiBrandModel allLokasiBrandModelFromJson(String str) => AllLokasiBrandModel.fromJson(json.decode(str));

String allLokasiBrandModelToJson(AllLokasiBrandModel data) => json.encode(data.toJson());

class AllLokasiBrandModel {
  AllLokasiBrandModel({
    this.meta,
    this.data,
    this.pagination,
    this.total,
  });

  Meta meta;
  List<Datum> data;
  Pagination pagination;
  List<dynamic> total;

  factory AllLokasiBrandModel.fromJson(Map<String, dynamic> json) => AllLokasiBrandModel(
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
  Datum({
    this.records,
    this.id,
    this.idMember,
    this.member,
    this.invoiceNo,
    this.idBrand,
    this.brand,
    this.brandLogo,
    this.idTypeInvest,
    this.typeInvest,
    this.owner,
    this.mobileNo,
    this.outletAddress,
    this.longlat,
    this.promoCode,
    this.grandTotal,
    this.status,
    this.estOpening,
    this.draftMou,
    this.idCard,
    this.note,
    this.createdAt,
    this.updatedAt,
  });

  String records;
  String id;
  String idMember;
  String member;
  String invoiceNo;
  String idBrand;
  String brand;
  String brandLogo;
  String idTypeInvest;
  String typeInvest;
  String owner;
  String mobileNo;
  String outletAddress;
  String longlat;
  String promoCode;
  String grandTotal;
  int status;
  dynamic estOpening;
  String draftMou;
  String idCard;
  String note;
  DateTime createdAt;
  DateTime updatedAt;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    records: json["records"],
    id: json["id"],
    idMember: json["id_member"],
    member: json["member"],
    invoiceNo: json["invoice_no"],
    idBrand: json["id_brand"],
    brand: json["brand"],
    brandLogo: json["brand_logo"],
    idTypeInvest: json["id_type_invest"],
    typeInvest: json["type_invest"],
    owner: json["owner"],
    mobileNo: json["mobile_no"],
    outletAddress: json["outlet_address"],
    longlat: json["longlat"],
    promoCode: json["promo_code"],
    grandTotal: json["grand_total"],
    status: json["status"],
    estOpening: json["est_opening"],
    draftMou: json["draft_mou"],
    idCard: json["id_card"],
    note: json["note"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "records": records,
    "id": id,
    "id_member": idMember,
    "member": member,
    "invoice_no": invoiceNo,
    "id_brand": idBrand,
    "brand": brand,
    "brand_logo": brandLogo,
    "id_type_invest": idTypeInvest,
    "type_invest": typeInvest,
    "owner": owner,
    "mobile_no": mobileNo,
    "outlet_address": outletAddress,
    "longlat": longlat,
    "promo_code": promoCode,
    "grand_total": grandTotal,
    "status": status,
    "est_opening": estOpening,
    "draft_mou": draftMou,
    "id_card": idCard,
    "note": note,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
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
