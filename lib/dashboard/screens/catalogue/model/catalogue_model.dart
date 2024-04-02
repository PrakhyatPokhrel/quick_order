// To parse this JSON data, do
//
//     final catalogue = catalogueFromJson(jsonString);

import 'dart:convert';

Catalogue catalogueFromJson(String str) => Catalogue.fromJson(json.decode(str));

String catalogueToJson(Catalogue data) => json.encode(data.toJson());

class Catalogue {
  bool success;
  List<Datum> data;
  String message;

  Catalogue({
    required this.success,
    required this.data,
    required this.message,
  });

  factory Catalogue.fromJson(Map<String, dynamic> json) => Catalogue(
        success: json["success"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "message": message,
      };
}

class Datum {
  int id;
  String name;
  String image;
  String imageUrl;

  Datum({
    required this.id,
    required this.name,
    required this.image,
    required this.imageUrl,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        name: json["name"],
        image: json["image"],
        imageUrl: json["image_url"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image": image,
        "image_url": imageUrl,
      };
}
