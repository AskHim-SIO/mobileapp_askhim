// To parse this JSON data, do
//
//     final getSearchByQuery = getSearchByQueryFromJson(jsonString);

import 'dart:convert';

List<GetSearchByQuery> getSearchByQueryFromJson(String str) =>
    List<GetSearchByQuery>.from(
        json.decode(str).map((x) => GetSearchByQuery.fromJson(x)));

String getSearchByQueryToJson(List<GetSearchByQuery> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GetSearchByQuery {
  GetSearchByQuery({
    required this.id,
    required this.name,
    required this.description,
    required this.dateStart,
    required this.dateEnd,
    required this.price,
    required this.postDate,
    required this.lieu,
    required this.type,
    required this.photos,
  });

  int id;
  String name;
  String description;
  int dateStart;
  int dateEnd;
  int price;
  int postDate;
  Lieu lieu;
  Type type;
  List<dynamic> photos;

  factory GetSearchByQuery.fromJson(Map<String, dynamic> json) =>
      GetSearchByQuery(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        dateStart: json["dateStart"],
        dateEnd: json["dateEnd"],
        price: json["price"],
        postDate: json["postDate"],
        lieu: Lieu.fromJson(json["lieu"]),
        type: Type.fromJson(json["type"]),
        photos: List<dynamic>.from(json["photos"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "dateStart": dateStart,
        "dateEnd": dateEnd,
        "price": price,
        "postDate": postDate,
        "lieu": lieu.toJson(),
        "type": type.toJson(),
        "photos": List<dynamic>.from(photos.map((x) => x)),
      };
}

class Lieu {
  Lieu({
    required this.id,
    required this.adresse,
    required this.codePostal,
    required this.ville,
  });

  int id;
  String adresse;
  int codePostal;
  String ville;

  factory Lieu.fromJson(Map<String, dynamic> json) => Lieu(
        id: json["id"],
        adresse: json["adresse"],
        codePostal: json["codePostal"],
        ville: json["ville"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "adresse": adresse,
        "codePostal": codePostal,
        "ville": ville,
      };
}

class Type {
  Type({
    required this.id,
    required this.libelle,
    required this.defaultPhoto,
    required this.defaultPhotoMobile,
    required this.prefer,
  });

  int id;
  String libelle;
  String defaultPhoto;
  String defaultPhotoMobile;
  List<dynamic> prefer;

  factory Type.fromJson(Map<String, dynamic> json) => Type(
        id: json["id"],
        libelle: json["libelle"],
        defaultPhoto: json["defaultPhoto"],
        defaultPhotoMobile: json["defaultPhotoMobile"],
        prefer: List<dynamic>.from(json["prefer"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "libelle": libelle,
        "defaultPhoto": defaultPhoto,
        "defaultPhotoMobile": defaultPhotoMobile,
        "prefer": List<dynamic>.from(prefer.map((x) => x)),
      };
}
