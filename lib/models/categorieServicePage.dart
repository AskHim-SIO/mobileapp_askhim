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

  factory CategorieServicePage.fromJson(Map<String, dynamic> json) =>
      CategorieServicePage(
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
  Adresse? adresse;
  int codePostal;
  Ville? ville;

  factory Lieu.fromJson(Map<String, dynamic> json) => Lieu(
        id: json["id"],
        adresse: adresseValues.map[json["adresse"]],
        codePostal: json["codePostal"],
        ville: villeValues.map[json["ville"]],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "adresse": adresseValues.reverse![adresse],
        "codePostal": codePostal,
        "ville": villeValues.reverse![ville],
      };
}

enum Adresse {
  THE_27_RUE_PELLEPORT,
  THE_27_RUE_JUDAIQUE,
  THE_29_RUE_LECOURBE,
  STRING
}

final adresseValues = EnumValues({
  "string": Adresse.STRING,
  "27 Rue Judaique": Adresse.THE_27_RUE_JUDAIQUE,
  "27 Rue Pelleport": Adresse.THE_27_RUE_PELLEPORT,
  "29 Rue Lecourbe": Adresse.THE_29_RUE_LECOURBE
});

enum Ville { BORDEAUX, PARIS, STRING }

final villeValues = EnumValues(
    {"Bordeaux": Ville.BORDEAUX, "Paris": Ville.PARIS, "string": Ville.STRING});

class Type {
  Type({
    required this.id,
    required this.libelle,
    required this.defaultPhoto,
    required this.defaultPhotoMobile,
    required this.prefer,
  });

  int id;
  Libelle? libelle;
  String defaultPhoto;
  String defaultPhotoMobile;
  List<dynamic> prefer;

  factory Type.fromJson(Map<String, dynamic> json) => Type(
        id: json["id"],
        libelle: libelleValues.map[json["libelle"]],
        defaultPhoto: json["defaultPhoto"],
        defaultPhotoMobile: json["defaultPhotoMobile"],
        prefer: List<dynamic>.from(json["prefer"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "libelle": libelleValues.reverse![libelle],
        "defaultPhoto": defaultPhoto,
        "defaultPhotoMobile": defaultPhotoMobile,
        "prefer": List<dynamic>.from(prefer.map((x) => x)),
      };
}

enum Libelle { TRANSPORT }

final libelleValues = EnumValues({"Transport": Libelle.TRANSPORT});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String>? get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
