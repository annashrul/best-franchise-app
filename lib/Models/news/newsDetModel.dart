// To parse this JSON data, do
//
//     final newsDetModel = newsDetModelFromJson(jsonString);

import 'dart:convert';

NewsDetModel newsDetModelFromJson(String str) =>
    NewsDetModel.fromJson(json.decode(str));

String newsDetModelToJson(NewsDetModel data) => json.encode(data.toJson());

class NewsDetModel {
  NewsDetModel({
    this.meta,
    this.data,
    this.pagination,
    this.total,
  });

  Meta meta;
  Datum data;
  Pagination pagination;
  List<dynamic> total;

  factory NewsDetModel.fromJson(Map<String, dynamic> json) => NewsDetModel(
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
  String id;
  String idCategory;
  String category;
  String idUser;
  String user;
  String title;
  String caption;
  String photo;
  String source;
  int status;
  int type;
  String createdAt;
  String updatedAt;

  Datum(
      {this.id,
      this.idCategory,
      this.category,
      this.idUser,
      this.user,
      this.title,
      this.caption,
      this.photo,
      this.source,
      this.status,
      this.type,
      this.createdAt,
      this.updatedAt});

  Datum.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    idCategory = json['id_category'];
    category = json['category'];
    idUser = json['id_user'];
    user = json['user'];
    title = json['title'];
    caption = json['caption'];
    photo = json['photo'];
    source = json['source'];
    status = json['status'];
    type = json['type'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['id_category'] = this.idCategory;
    data['category'] = this.category;
    data['id_user'] = this.idUser;
    data['user'] = this.user;
    data['title'] = this.title;
    data['caption'] = this.caption;
    data['photo'] = this.photo;
    data['source'] = this.source;
    data['status'] = this.status;
    data['type'] = this.type;
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
