// To parse this JSON data, do
//
//     final detailBrandModel = detailBrandModelFromJson(jsonString);

import 'dart:convert';

DetailBrandModel detailBrandModelFromJson(String str) => DetailBrandModel.fromJson(json.decode(str));

String detailBrandModelToJson(DetailBrandModel data) => json.encode(data.toJson());

class DetailBrandModel {
  DetailBrandModel({
    this.meta,
    this.data,
    this.pagination,
    this.total,
  });

  Meta meta;
  Data data;
  Pagination pagination;
  List<dynamic> total;

  factory DetailBrandModel.fromJson(Map<String, dynamic> json) => DetailBrandModel(
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
    this.id,
    this.idCategory,
    this.category,
    this.idOwner,
    this.owner,
    this.totalOutlet,
    this.title,
    this.logo,
    this.cover,
    this.ho,
    this.caption,
    this.since,
    this.createdAt,
    this.updatedAt,
  });

  String id;
  String idCategory;
  String category;
  String idOwner;
  String owner;
  String totalOutlet;
  String title;
  String logo;
  String cover;
  String ho;
  String caption;
  String since;
  DateTime createdAt;
  DateTime updatedAt;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"],
    idCategory: json["id_category"],
    category: json["category"],
    idOwner: json["id_owner"],
    owner: json["owner"],
    totalOutlet: json["total_outlet"],
    title: json["title"],
    logo: json["logo"],
    cover: json["cover"],
    ho: json["ho"],
    caption: json["caption"],
    since: json["since"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "id_category": idCategory,
    "category": category,
    "id_owner": idOwner,
    "owner": owner,
    "total_outlet": totalOutlet,
    "title": title,
    "logo": logo,
    "cover": cover,
    "ho": ho,
    "caption": caption,
    "since": since,
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
  Pagination();

  factory Pagination.fromJson(Map<String, dynamic> json) => Pagination(
  );

  Map<String, dynamic> toJson() => {
  };
}
