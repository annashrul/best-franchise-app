// To parse this JSON data, do
//
//     final tentangAplikasiModel = tentangAplikasiModelFromJson(jsonString);

import 'dart:convert';

TentangAplikasiModel tentangAplikasiModelFromJson(String str) => TentangAplikasiModel.fromJson(json.decode(str));

String tentangAplikasiModelToJson(TentangAplikasiModel data) => json.encode(data.toJson());

class TentangAplikasiModel {
  TentangAplikasiModel({
    this.meta,
    this.data,
    this.pagination,
    this.total,
  });

  Meta meta;
  Data data;
  Pagination pagination;
  List<dynamic> total;

  factory TentangAplikasiModel.fromJson(Map<String, dynamic> json) => TentangAplikasiModel(
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
    this.title,
    this.logo,
    this.cover,
    this.caption,
    this.bep,
    this.totalBrand,
    this.totalFranchise,
    this.totalPenghargaan,
    this.tag,
    this.tagCaption,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  String title;
  String logo;
  String cover;
  String caption;
  String bep;
  String totalBrand;
  String totalFranchise;
  String totalPenghargaan;
  String tag;
  String tagCaption;
  DateTime createdAt;
  DateTime updatedAt;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"],
    title: json["title"],
    logo: json["logo"],
    cover: json["cover"],
    caption: json["caption"],
    bep: json["bep"],
    totalBrand: json["total_brand"],
    totalFranchise: json["total_franchise"],
    totalPenghargaan: json["total_penghargaan"],
    tag: json["tag"],
    tagCaption: json["tag_caption"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "logo": logo,
    "cover": cover,
    "caption": caption,
    "bep": bep,
    "total_brand": totalBrand,
    "total_franchise": totalFranchise,
    "total_penghargaan": totalPenghargaan,
    "tag": tag,
    "tag_caption": tagCaption,
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
