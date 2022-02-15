import 'dart:convert';

List<ShuffleService> shuffleServiceFromJson(String str) =>
    List<ShuffleService>.from(
        json.decode(str).map((x) => ShuffleService.fromJson(x)));

String shuffleServiceToJson(List<ShuffleService> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ShuffleService {
  ShuffleService({
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
  List<Photo> photos;

  factory ShuffleService.fromJson(Map<String, dynamic> json) => ShuffleService(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        dateStart: json["dateStart"],
        dateEnd: json["dateEnd"],
        price: json["price"],
        postDate: json["postDate"],
        lieu: Lieu.fromJson(json["lieu"]),
        type: Type.fromJson(json["type"]),
        photos: List<Photo>.from(json["photos"].map((x) => Photo.fromJson(x))),
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
        "photos": List<dynamic>.from(photos.map((x) => x.toJson())),
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
        "libelle": libelleValues.reverse[libelle],
        "defaultPhoto": defaultPhoto,
        "defaultPhotoMobile": defaultPhotoMobile,
        "prefer": List<dynamic>.from(prefer.map((x) => x)),
      };
}

enum Libelle { TRANSPORT, TCHE_MNAGRE, LOISIR, FORMATION, COURSE }

final libelleValues = EnumValues({
  "Course": Libelle.COURSE,
  "Formation": Libelle.FORMATION,
  "Loisir": Libelle.LOISIR,
  "Tâche ménagère": Libelle.TCHE_MNAGRE,
  "Transport": Libelle.TRANSPORT
});

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
