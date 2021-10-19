// To parse this JSON data, do
//
//     final rewardModel = rewardModelFromJson(jsonString);

import 'dart:convert';

RewardModel rewardModelFromJson(String str) =>
    RewardModel.fromJson(json.decode(str));

String rewardModelToJson(RewardModel data) => json.encode(data.toJson());

class RewardModel {
  RewardModel({
    this.meta,
    this.data,
    this.pagination,
    this.total,
  });

  Meta meta;
  Datum data;
  Pagination pagination;
  List<dynamic> total;

  factory RewardModel.fromJson(Map<String, dynamic> json) => RewardModel(
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
  String bonusPoin;
  String bonusKomisi;
  String bonusRoyalti;
  String otpType;
  String provider;
  String createdAt;
  String updatedAt;

  Datum(
      {this.id,
      this.bonusPoin,
      this.bonusKomisi,
      this.bonusRoyalti,
      this.otpType,
      this.provider,
      this.createdAt,
      this.updatedAt});

  Datum.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    bonusPoin = json['bonus_poin'];
    bonusKomisi = json['bonus_komisi'];
    bonusRoyalti = json['bonus_royalti'];
    otpType = json['otp_type'];
    provider = json['provider'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['bonus_poin'] = this.bonusPoin;
    data['bonus_komisi'] = this.bonusKomisi;
    data['bonus_royalti'] = this.bonusRoyalti;
    data['otp_type'] = this.otpType;
    data['provider'] = this.provider;
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
