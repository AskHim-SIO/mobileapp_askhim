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
    required this.state,
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
  bool state;
  int price;
  int postDate;
  Lieu lieu;
  Type type;
  List<Photo> photos;

  factory CategorieServicePage.fromJson(Map<String, dynamic> json) =>
      CategorieServicePage(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        dateStart: json["dateStart"],
        dateEnd: json["dateEnd"],
        state: json["state"],
        price: json["price"],
        postDate: json["postDate"],
        lieu: Lieu.fromJson(json["lieu"]),
        type: Type.fromJson(json["type"]),
        photos: List<Photo>.from(json["photos"].map((x) => Photo.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": nameValues.reverse![name],
        "description": descriptionValues.reverse![description],
        "dateStart": dateStart,
        "dateEnd": dateEnd,
        "state": state,
        "price": price,
        "postDate": postDate,
        "lieu": lieu.toJson(),
        "type": type.toJson(),
        "photos": List<dynamic>.from(photos.map((x) => x.toJson())),
      };
}

enum Description { B, T, VENDREDI_SOIR_C_EST_CHAPITEAU_NOGENT_LE_ROTROU }

final descriptionValues = EnumValues({
  "b": Description.B,
  "t": Description.T,
  "Vendredi soir c'est chapiteau à Nogent le Rotrou":
      Description.VENDREDI_SOIR_C_EST_CHAPITEAU_NOGENT_LE_ROTROU
});

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
        "adresse": adresseValues.reverse![adresse],
        "codePostal": codePostal,
        "ville": villeValues.reverse![ville],
      };
}

enum Adresse {
  RUE,
  THE_31_RUE_LECOURBE,
  THE_31_RUE_PELLEPORT,
  THE_2_RUE_ADRIEN_RECOUVREUR
}

final adresseValues = EnumValues({
  "Rue": Adresse.RUE,
  "2 Rue Adrien Recouvreur": Adresse.THE_2_RUE_ADRIEN_RECOUVREUR,
  "31 Rue Lecourbe": Adresse.THE_31_RUE_LECOURBE,
  "31 Rue Pelleport": Adresse.THE_31_RUE_PELLEPORT
});

enum Ville { SAINT_JEAN_DE_VDAS, PARIS, BORDEAUX, ANGERS }

final villeValues = EnumValues({
  "Angers": Ville.ANGERS,
  "Bordeaux": Ville.BORDEAUX,
  "Paris": Ville.PARIS,
  "Saint-Jean-de-Védas": Ville.SAINT_JEAN_DE_VDAS
});

enum Name { TEST, T, ON_VA_CHEZ_PRIAM }

final nameValues = EnumValues({
  "On va chez Priam": Name.ON_VA_CHEZ_PRIAM,
  "t": Name.T,
  "Test": Name.TEST
});

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
