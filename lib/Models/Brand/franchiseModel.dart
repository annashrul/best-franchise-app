// To parse this JSON data, do
//
//     final franchiseModel = franchiseModelFromJson(jsonString);

import 'dart:convert';

FranchiseModel franchiseModelFromJson(String str) => FranchiseModel.fromJson(json.decode(str));

String franchiseModelToJson(FranchiseModel data) => json.encode(data.toJson());

class FranchiseModel {
  FranchiseModel({
    this.meta,
    this.data,
    this.pagination,
    this.total,
  });

  Meta meta;
  List<Datum> data;
  Pagination pagination;
  List<dynamic> total;

  factory FranchiseModel.fromJson(Map<String, dynamic> json) => FranchiseModel(
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
    this.id,
    this.idBrand,
    this.title,
    this.price,
    this.contract,
    this.bookingFee,
    this.createdAt,
    this.updatedAt,
    this.detail,
  });

  String id;
  String idBrand;
  String title;
  String price;
  int contract;
  String bookingFee;
  dynamic createdAt;
  dynamic updatedAt;
  List<Detail> detail;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    idBrand: json["id_brand"],
    title: json["title"],
    price: json["price"],
    contract: json["contract"],
    bookingFee: json["booking_fee"],
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
    detail: List<Detail>.from(json["detail"].map((x) => Detail.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "id_brand": idBrand,
    "title": title,
    "price": price,
    "contract": contract,
    "booking_fee": bookingFee,
    "created_at": createdAt,
    "updated_at": updatedAt,
    "detail": List<dynamic>.from(detail.map((x) => x.toJson())),
  };
}

class Detail {
  Detail({
    this.id,
    this.idTypeInvest,
    this.title,
    this.createdAt,
    this.updatedAt,
  });

  String id;
  String idTypeInvest;
  String title;
  DateTime createdAt;
  DateTime updatedAt;

  factory Detail.fromJson(Map<String, dynamic> json) => Detail(
    id: json["id"],
    idTypeInvest: json["id_type_invest"],
    title: json["title"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "id_type_invest": idTypeInvest,
    "title": title,
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
