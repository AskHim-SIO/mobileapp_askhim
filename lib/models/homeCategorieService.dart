// To parse this JSON data, do
//
//     final categorieService = categorieServiceFromJson(jsonString);

import 'dart:convert';

List<CategorieService> categorieServiceFromJson(String str) =>
    List<CategorieService>.from(
        json.decode(str).map((x) => CategorieService.fromJson(x)));

String categorieServiceToJson(List<CategorieService> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CategorieService {
  CategorieService({
    required this.id,
    required this.libelle,
    required this.prefer,
  });

  int id;
  String libelle;
  List<dynamic> prefer;

  factory CategorieService.fromJson(Map<String, dynamic> json) =>
      CategorieService(
        id: json["id"],
        libelle: json["libelle"],
        prefer: List<dynamic>.from(json["prefer"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "libelle": libelle,
        "prefer": List<dynamic>.from(prefer.map((x) => x)),
      };
}
