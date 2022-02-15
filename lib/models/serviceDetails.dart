// To parse this JSON data, do
//
//     final serviceDetails = serviceDetailsFromJson(jsonString);

import 'dart:convert';

ServiceDetails serviceDetailsFromJson(String str) =>
    ServiceDetails.fromJson(json.decode(str));

String serviceDetailsToJson(ServiceDetails data) => json.encode(data.toJson());

class ServiceDetails {
  ServiceDetails({
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
    required this.user,
    required this.nbHeure,
    required this.libelle,
    required this.disposerDe,
  });

  int id;
  String name;
  String description;
  int dateStart;
  int dateEnd;
  dynamic state;
  int price;
  int postDate;
  Lieu lieu;
  Type type;
  List<DisposerDe> photos;
  User user;
  int nbHeure;
  String libelle;
  List<DisposerDe> disposerDe;

  factory ServiceDetails.fromJson(Map<String, dynamic> json) => ServiceDetails(
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
        photos: List<DisposerDe>.from(
            json["photos"].map((x) => DisposerDe.fromJson(x))),
        user: User.fromJson(json["user"]),
        nbHeure: json["nbHeure"],
        libelle: json["libelle"],
        disposerDe: List<DisposerDe>.from(
            json["disposer_de"].map((x) => DisposerDe.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "dateStart": dateStart,
        "dateEnd": dateEnd,
        "state": state,
        "price": price,
        "postDate": postDate,
        "lieu": lieu.toJson(),
        "type": type.toJson(),
        "photos": List<dynamic>.from(photos.map((x) => x.toJson())),
        "user": user.toJson(),
        "nbHeure": nbHeure,
        "libelle": libelle,
        "disposer_de": List<dynamic>.from(disposerDe.map((x) => x.toJson())),
      };
}

class DisposerDe {
  DisposerDe({
    required this.id,
    required this.libelle,
  });

  int id;
  String libelle;

  factory DisposerDe.fromJson(Map<String, dynamic> json) => DisposerDe(
        id: json["id"],
        libelle: json["libelle"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "libelle": libelle,
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

class Type {
  Type({
    required this.id,
    required this.libelle,
    required this.defaultPhoto,
    required this.defaultPhotoMobile,
  });

  int id;
  String libelle;
  String defaultPhoto;
  String defaultPhotoMobile;

  factory Type.fromJson(Map<String, dynamic> json) => Type(
        id: json["id"],
        libelle: json["libelle"],
        defaultPhoto: json["defaultPhoto"],
        defaultPhotoMobile: json["defaultPhotoMobile"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "libelle": libelle,
        "defaultPhoto": defaultPhoto,
        "defaultPhotoMobile": defaultPhotoMobile,
      };
}

class User {
  User({
    required this.id,
    required this.name,
    required this.firstname,
    this.profilPicture,
  });

  int id;
  String name;
  String firstname;
  dynamic profilPicture;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"],
        firstname: json["firstname"],
        profilPicture: json["profilPicture"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "firstname": firstname,
        "profilPicture": profilPicture,
      };
}
