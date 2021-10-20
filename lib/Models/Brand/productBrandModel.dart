// To parse this JSON data, do
//
//     final productBrandModel = productBrandModelFromJson(jsonString);

import 'dart:convert';

ProductBrandModel productBrandModelFromJson(String str) => ProductBrandModel.fromJson(json.decode(str));

String productBrandModelToJson(ProductBrandModel data) => json.encode(data.toJson());

class ProductBrandModel {
  ProductBrandModel({
    this.meta,
    this.data,
    this.pagination,
    this.total,
  });

  Meta meta;
  List<Datum> data;
  Pagination pagination;
  List<dynamic> total;

  factory ProductBrandModel.fromJson(Map<String, dynamic> json) => ProductBrandModel(
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
    this.idCategory,
    this.category,
    this.idMember,
    this.member,
    this.brands,
    this.title,
    this.caption,
    this.photo,
    this.price,
    this.satuan,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  String records;
  String id;
  String idCategory;
  String category;
  String idMember;
  String member;
  String brands;
  String title;
  String caption;
  String photo;
  String price;
  String satuan;
  int status;
  DateTime createdAt;
  DateTime updatedAt;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    records: json["records"],
    id: json["id"],
    idCategory: json["id_category"],
    category: json["category"],
    idMember: json["id_member"],
    member: json["member"],
    brands: json["brands"],
    title: json["title"],
    caption: json["caption"],
    photo: json["photo"],
    price: json["price"],
    satuan: json["satuan"],
    status: json["status"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "records": records,
    "id": id,
    "id_category": idCategory,
    "category": category,
    "id_member": idMember,
    "member": member,
    "brands": brands,
    "title": title,
    "caption": caption,
    "photo": photo,
    "price": price,
    "satuan": satuan,
    "status": status,
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
