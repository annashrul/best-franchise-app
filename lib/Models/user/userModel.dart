// To parse this JSON data, do
//
//     final companyModel = companyModelFromJson(jsonString);

import 'dart:convert';

UserModel companyModelFromJson(String str) =>
    UserModel.fromJson(json.decode(str));

String companyModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  UserModel({
    this.meta,
    this.data,
    this.pagination,
    this.total,
  });

  Meta meta;
  Datum data;
  Pagination pagination;
  List<dynamic> total;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
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
  String fullname;
  String mobileNo;
  String email;
  String referral;
  int status;
  String totalDownline;
  String location;
  String photo;
  String cover;
  String createdAt;
  String updatedAt;

  Datum(
      {this.id,
      this.fullname,
      this.mobileNo,
      this.email,
      this.referral,
      this.status,
      this.totalDownline,
      this.location,
      this.photo,
      this.cover,
      this.createdAt,
      this.updatedAt});

  Datum.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fullname = json['fullname'];
    mobileNo = json['mobile_no'];
    email = json['email'];
    referral = json['referral'];
    status = json['status'];
    totalDownline = json['total_downline'];
    location = json['location'];
    photo = json['photo'];
    cover = json['cover'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['fullname'] = this.fullname;
    data['mobile_no'] = this.mobileNo;
    data['email'] = this.email;
    data['referral'] = this.referral;
    data['status'] = this.status;
    data['total_downline'] = this.totalDownline;
    data['location'] = this.location;
    data['photo'] = this.photo;
    data['cover'] = this.cover;
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
