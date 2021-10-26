// To parse this JSON data, do
//
//     final companyModel = companyModelFromJson(jsonString);

import 'dart:convert';

CompanyModel companyModelFromJson(String str) =>
    CompanyModel.fromJson(json.decode(str));

String companyModelToJson(CompanyModel data) => json.encode(data.toJson());

class CompanyModel {
  CompanyModel({
    this.meta,
    this.data,
    this.pagination,
    this.total,
  });

  Meta meta;
  Datum data;
  Pagination pagination;
  List<dynamic> total;

  factory CompanyModel.fromJson(Map<String, dynamic> json) => CompanyModel(
        meta: Meta.fromJson(json["meta"]),
        data: Datum.fromJson(json["data"]),
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

class Datum {
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
  String createdAt;
  String updatedAt;
  String tos;

  Datum(
      {this.id,
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
      this.tos});

  Datum.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    logo = json['logo'];
    cover = json['cover'];
    caption = json['caption'];
    bep = json['bep'];
    totalBrand = json['total_brand'];
    totalFranchise = json['total_franchise'];
    totalPenghargaan = json['total_penghargaan'];
    tag = json['tag'];
    tagCaption = json['tag_caption'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    tos = json['tos'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['logo'] = this.logo;
    data['cover'] = this.cover;
    data['caption'] = this.caption;
    data['bep'] = this.bep;
    data['total_brand'] = this.totalBrand;
    data['total_franchise'] = this.totalFranchise;
    data['total_penghargaan'] = this.totalPenghargaan;
    data['tag'] = this.tag;
    data['tag_caption'] = this.tagCaption;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['tos'] = this.tos;
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
