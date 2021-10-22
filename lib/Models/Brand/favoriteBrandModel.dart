// To parse this JSON data, do
//
//     final favoriteBrandModel = favoriteBrandModelFromJson(jsonString);

import 'dart:convert';

FavoriteBrandModel favoriteBrandModelFromJson(String str) => FavoriteBrandModel.fromJson(json.decode(str));

String favoriteBrandModelToJson(FavoriteBrandModel data) => json.encode(data.toJson());

class FavoriteBrandModel {
  FavoriteBrandModel({
    this.meta,
    this.data,
    this.pagination,
    this.total,
  });

  Meta meta;
  List<Datum> data;
  Pagination pagination;
  List<dynamic> total;

  factory FavoriteBrandModel.fromJson(Map<String, dynamic> json) => FavoriteBrandModel(
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
    this.idCategory,
    this.category,
    this.idOwner,
    this.owner,
    this.title,
    this.logo,
    this.cover,
    this.ho,
    this.caption,
    this.since,
    this.createdAt,
    this.updatedAt,
    this.totalOutlet,
  });

  String records;
  String id;
  String idMember;
  String idCategory;
  String category;
  String idOwner;
  String owner;
  String title;
  String logo;
  String cover;
  String ho;
  String caption;
  String since;
  DateTime createdAt;
  DateTime updatedAt;
  String totalOutlet;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    records: json["records"],
    id: json["id"],
    idMember: json["id_member"],
    idCategory: json["id_category"],
    category: json["category"],
    idOwner: json["id_owner"],
    owner: json["owner"],
    title: json["title"],
    logo: json["logo"],
    cover: json["cover"],
    ho: json["ho"],
    caption: json["caption"],
    since: json["since"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    totalOutlet: json["total_outlet"],
  );

  Map<String, dynamic> toJson() => {
    "records": records,
    "id": id,
    "id_member": idMember,
    "id_category": idCategory,
    "category": category,
    "id_owner": idOwner,
    "owner": owner,
    "title": title,
    "logo": logo,
    "cover": cover,
    "ho": ho,
    "caption": caption,
    "since": since,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "total_outlet": totalOutlet,
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
