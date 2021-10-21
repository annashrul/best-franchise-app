// To parse this JSON data, do
//
//     final reviewBrandModel = reviewBrandModelFromJson(jsonString);

import 'dart:convert';

ReviewBrandModel reviewBrandModelFromJson(String str) => ReviewBrandModel.fromJson(json.decode(str));

String reviewBrandModelToJson(ReviewBrandModel data) => json.encode(data.toJson());

class ReviewBrandModel {
  ReviewBrandModel({
    this.meta,
    this.data,
    this.pagination,
    this.total,
  });

  Meta meta;
  List<Datum> data;
  Pagination pagination;
  List<dynamic> total;

  factory ReviewBrandModel.fromJson(Map<String, dynamic> json) => ReviewBrandModel(
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
    this.idBrand,
    this.brand,
    this.message,
    this.rating,
    this.photo,
    this.createdAt,
    this.updatedAt,
  });

  String records;
  String id;
  String idMember;
  String member;
  String idBrand;
  String brand;
  String message;
  dynamic rating;
  String photo;
  dynamic createdAt;
  dynamic updatedAt;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    records: json["records"],
    id: json["id"],
    idMember: json["id_member"],
    member: json["member"],
    idBrand: json["id_brand"],
    brand: json["brand"],
    message: json["message"],
    rating: json["rating"],
    photo: json["photo"],
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
  );

  Map<String, dynamic> toJson() => {
    "records": records,
    "id": id,
    "id_member": idMember,
    "member": member,
    "id_brand": idBrand,
    "brand": brand,
    "message": message,
    "rating": rating,
    "photo": photo,
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
