// To parse this JSON data, do
//
//     final addFormation = addFormationFromJson(jsonString);

import 'dart:convert';

AddFormation addFormationFromJson(String str) =>
    AddFormation.fromJson(json.decode(str));

String addFormationToJson(AddFormation data) => json.encode(data.toJson());

class AddFormation {
  AddFormation({
    required this.competence,
    required this.dateEnd,
    required this.dateStart,
    required this.description,
    required this.lieuAdresse,
    required this.lieuCodePostal,
    required this.lieuVille,
    required this.materiel,
    required this.name,
    required this.nbHeure,
    required this.presence,
    required this.price,
    required this.userToken,
  });

  String competence;
  DateTime dateEnd;
  DateTime dateStart;
  String description;
  String lieuAdresse;
  int lieuCodePostal;
  String lieuVille;
  String materiel;
  String name;
  int nbHeure;
  String presence;
  int price;
  String userToken;

  factory AddFormation.fromJson(Map<String, dynamic> json) => AddFormation(
        competence: json["competence"],
        dateEnd: DateTime.parse(json["dateEnd"]),
        dateStart: DateTime.parse(json["dateStart"]),
        description: json["description"],
        lieuAdresse: json["lieuAdresse"],
        lieuCodePostal: json["lieuCodePostal"],
        lieuVille: json["lieuVille"],
        materiel: json["materiel"],
        name: json["name"],
        nbHeure: json["nbHeure"],
        presence: json["presence"],
        price: json["price"],
        userToken: json["userToken"],
      );

  Map<String, dynamic> toJson() => {
        "competence": competence,
        "dateEnd": dateEnd.toIso8601String(),
        "dateStart": dateStart.toIso8601String(),
        "description": description,
        "lieuAdresse": lieuAdresse,
        "lieuCodePostal": lieuCodePostal,
        "lieuVille": lieuVille,
        "materiel": materiel,
        "name": name,
        "nbHeure": nbHeure,
        "presence": presence,
        "price": price,
        "userToken": userToken,
      };
}
