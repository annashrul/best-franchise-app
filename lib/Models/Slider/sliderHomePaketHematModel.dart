// To parse this JSON data, do
//
//     final sliderHomePaketHematModel = sliderHomePaketHematModelFromJson(jsonString);

import 'dart:convert';

SliderHomePaketHematModel sliderHomePaketHematModelFromJson(String str) =>
    SliderHomePaketHematModel.fromJson(json.decode(str));

String sliderHomePaketHematModelToJson(SliderHomePaketHematModel data) =>
    json.encode(data.toJson());

class SliderHomePaketHematModel {
  SliderHomePaketHematModel({
    this.meta,
    this.data,
    this.pagination,
    this.total,
  });

  Meta meta;
  List<Datum> data;
  Pagination pagination;
  List<dynamic> total;

  factory SliderHomePaketHematModel.fromJson(Map<String, dynamic> json) =>
      SliderHomePaketHematModel(
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
    this.type,
    this.status,
    this.route,
    this.idRoute,
    this.title,
    this.caption,
    this.link,
    this.bgColor,
    this.banner,
    this.createdAt,
    this.updatedAt,
  });

  String records;
  String id;
  int type;
  int status;
  String route;
  String idRoute;
  String title;
  String caption;
  String link;
  String bgColor;
  String banner;
  DateTime createdAt;
  DateTime updatedAt;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        records: json["records"],
        id: json["id"],
        type: json["type"],
        status: json["status"],
        route: json["route"],
        idRoute: json["id_route"],
        title: json["title"],
        caption: json["caption"],
        link: json["link"],
        bgColor: json["bg_color"],
        banner: json["banner"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "records": records,
        "id": id,
        "type": type,
        "status": status,
        "route": route,
        "id_route": idRoute,
        "title": title,
        "caption": caption,
        "link": link,
        "bg_color": bgColor,
        "banner": banner,
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
