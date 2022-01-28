// To parse this JSON data, do
//
//     final serviceByUser = serviceByUserFromJson(jsonString);

import 'dart:convert';

List<ServiceByUser> serviceByUserFromJson(String str) =>
    List<ServiceByUser>.from(
        json.decode(str).map((x) => ServiceByUser.fromJson(x)));

String serviceByUserToJson(List<ServiceByUser> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ServiceByUser {
  ServiceByUser({
    required this.id,
    required this.name,
    required this.dateStart,
    required this.dateEnd,
    required this.price,
    required this.postDate,
    required this.lieu,
    required this.photos,
  });

  int id;
  String name;
  int dateStart;
  int dateEnd;
  int price;
  int postDate;
  Lieu lieu;
  List<Photo> photos;

  factory ServiceByUser.fromJson(Map<String, dynamic> json) => ServiceByUser(
        id: json["id"],
        name: json["name"],
        dateStart: json["dateStart"],
        dateEnd: json["dateEnd"],
        price: json["price"],
        postDate: json["postDate"],
        lieu: Lieu.fromJson(json["lieu"]),
        photos: List<Photo>.from(json["photos"].map((x) => Photo.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "dateStart": dateStart,
        "dateEnd": dateEnd,
        "price": price,
        "postDate": postDate,
        "lieu": lieu.toJson(),
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
