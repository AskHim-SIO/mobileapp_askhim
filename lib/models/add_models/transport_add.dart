// To parse this JSON data, do
//
//     final transportAdd = transportAddFromJson(jsonString);

import 'dart:convert';

TransportAdd transportAddFromJson(String str) =>
    TransportAdd.fromJson(json.decode(str));

String transportAddToJson(TransportAdd data) => json.encode(data.toJson());

class TransportAdd {
  TransportAdd({
    required this.dateEnd,
    required this.dateStart,
    required this.description,
    required this.lieuAdresse,
    required this.lieuCodePostal,
    required this.lieuVille,
    required this.motif,
    required this.name,
    required this.nbPlaceDispo,
    required this.pointArriver,
    required this.pointDepart,
    required this.price,
    required this.userToken,
    required this.vehiculePerso,
  });

  DateTime dateEnd;
  DateTime dateStart;
  String description;
  String lieuAdresse;
  int lieuCodePostal;
  String lieuVille;
  String motif;
  String name;
  int nbPlaceDispo;
  String pointArriver;
  String pointDepart;
  int price;
  String userToken;
  String vehiculePerso;

  factory TransportAdd.fromJson(Map<String, dynamic> json) => TransportAdd(
        dateEnd: DateTime.parse(json["dateEnd"]),
        dateStart: DateTime.parse(json["dateStart"]),
        description: json["description"],
        lieuAdresse: json["lieuAdresse"],
        lieuCodePostal: json["lieuCodePostal"],
        lieuVille: json["lieuVille"],
        motif: json["motif"],
        name: json["name"],
        nbPlaceDispo: json["nbPlaceDispo"],
        pointArriver: json["pointArriver"],
        pointDepart: json["pointDepart"],
        price: json["price"],
        userToken: json["userToken"],
        vehiculePerso: json["vehiculePerso"],
      );

  Map<String, dynamic> toJson() => {
        "dateEnd": dateEnd.toIso8601String(),
        "dateStart": dateStart.toIso8601String(),
        "description": description,
        "lieuAdresse": lieuAdresse,
        "lieuCodePostal": lieuCodePostal,
        "lieuVille": lieuVille,
        "motif": motif,
        "name": name,
        "nbPlaceDispo": nbPlaceDispo,
        "pointArriver": pointArriver,
        "pointDepart": pointDepart,
        "price": price,
        "userToken": userToken,
        "vehiculePerso": vehiculePerso,
      };
}
