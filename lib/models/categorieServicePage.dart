// To parse this JSON data, do
//
//     final categorieServicePage = categorieServicePageFromJson(jsonString);

import 'dart:convert';

List<CategorieServicePage> categorieServicePageFromJson(String str) =>
    List<CategorieServicePage>.from(
        json.decode(str).map((x) => CategorieServicePage.fromJson(x)));

String categorieServicePageToJson(List<CategorieServicePage> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CategorieServicePage {
  CategorieServicePage({
    required this.id,
    required this.name,
    required this.price,
    required this.postDate,
    required this.lieu,
    required this.type,
    required this.photos,
  });

  int id;
  String name;
  int price;
  int postDate;
  Lieu lieu;
  Type type;
  List<Photo> photos;

  factory CategorieServicePage.fromJson(Map<String, dynamic> json) =>
      CategorieServicePage(
        id: json["id"],
        name: json["name"],
        price: json["price"],
        postDate: json["postDate"],
        lieu: Lieu.fromJson(json["lieu"]),
        type: Type.fromJson(json["type"]),
        photos: List<Photo>.from(json["photos"].map((x) => Photo.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "price": price,
        "postDate": postDate,
        "lieu": lieu.toJson(),
        "type": type.toJson(),
        "photos": List<dynamic>.from(photos.map((x) => x.toJson())),
      };
}

class Lieu {
  Lieu({
    required this.id,
    required this.ville,
  });

  int id;
  String ville;

  factory Lieu.fromJson(Map<String, dynamic> json) => Lieu(
        id: json["id"],
        ville: json["ville"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "ville": ville,
      };
}

class Photo {
  Photo({
    required this.id,
    required this.libelle,
  });

  int id;
  String libelle;

  factory Photo.fromJson(Map<String, dynamic> json) => Photo(
        id: json["id"],
        libelle: json["libelle"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "libelle": libelle,
      };
}

class Type {
  Type({
    required this.id,
    required this.libelle,
    required this.prefer,
  });

  int id;
  Libelle? libelle;
  List<dynamic> prefer;

  factory Type.fromJson(Map<String, dynamic> json) => Type(
        id: json["id"],
        libelle: libelleValues.map[json["libelle"]],
        prefer: List<dynamic>.from(json["prefer"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "libelle": libelleValues.reverse[libelle],
        "prefer": List<dynamic>.from(prefer.map((x) => x)),
      };
}

enum Libelle { TRANSPORT }

final libelleValues = EnumValues({"Transport": Libelle.TRANSPORT});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
