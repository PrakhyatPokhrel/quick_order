// To parse this JSON data, do
//
//     final catalogue = catalogueFromJson(jsonString);

import 'dart:convert';

Catalogue catalogueFromJson(String str) => Catalogue.fromJson(json.decode(str));

String catalogueToJson(Catalogue data) => json.encode(data.toJson());

class Catalogue {
  bool status;
  List<Datum> data;
  String message;

  Catalogue({
    required this.status,
    required this.data,
    required this.message,
  });

  factory Catalogue.fromJson(Map<String, dynamic> json) => Catalogue(
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
  String photo;
  String photoUrl;

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
