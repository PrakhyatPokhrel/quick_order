// To parse this JSON data, do
//
//     final catalogueProductModel = catalogueProductModelFromJson(jsonString);

import 'dart:convert';

CatalogueProductModel catalogueProductModelFromJson(String str) =>
    CatalogueProductModel.fromJson(json.decode(str));

String catalogueProductModelToJson(CatalogueProductModel data) =>
    json.encode(data.toJson());

class CatalogueProductModel {
  bool status;
  List<Datum> data;
  String message;

  CatalogueProductModel({
    required this.status,
    required this.data,
    required this.message,
  });

  factory CatalogueProductModel.fromJson(Map<String, dynamic> json) =>
      CatalogueProductModel(
        status: json["status"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "message": message,
      };
}

class Datum {
  int id;
  String name;
  String? photo;
  String? photoUrl;

  Datum({
    required this.id,
    required this.name,
    required this.photo,
    required this.photoUrl,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        name: json["name"],
        photo: json["photo"],
        photoUrl: json["photo_url"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "photo": photo,
        "photo_url": photoUrl,
      };
}
