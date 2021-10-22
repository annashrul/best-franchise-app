// To parse this JSON data, do
//
//     final progressModel = progressModelFromJson(jsonString);

import 'dart:convert';

ProgressModel progressModelFromJson(String str) => ProgressModel.fromJson(json.decode(str));

String progressModelToJson(ProgressModel data) => json.encode(data.toJson());

class ProgressModel {
  ProgressModel({
    this.meta,
    this.data,
    this.pagination,
    this.total,
  });

  Meta meta;
  List<Datum> data;
  Pagination pagination;
  List<dynamic> total;

  factory ProgressModel.fromJson(Map<String, dynamic> json) => ProgressModel(
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
    this.idContent,
    this.content,
    this.caption,
    this.photo,
    this.idFranchise,
    this.percentage,
    this.createdAt,
  });

  String records;
  String id;
  String idContent;
  String content;
  String caption;
  String photo;
  String idFranchise;
  String percentage;
  DateTime createdAt;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    records: json["records"],
    id: json["id"],
    idContent: json["id_content"],
    content: json["content"],
    caption: json["caption"],
    photo: json["photo"],
    idFranchise: json["id_franchise"],
    percentage: json["percentage"],
    createdAt: DateTime.parse(json["created_at"]),
  );

  Map<String, dynamic> toJson() => {
    "records": records,
    "id": id,
    "id_content": idContent,
    "content": content,
    "caption": caption,
    "photo": photo,
    "id_franchise": idFranchise,
    "percentage": percentage,
    "created_at": createdAt.toIso8601String(),
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
