// To parse this JSON data, do
//
//     final courseAdd = courseAddFromJson(jsonString);

import 'dart:convert';

CourseAdd courseAddFromJson(String str) => CourseAdd.fromJson(json.decode(str));

String courseAddToJson(CourseAdd data) => json.encode(data.toJson());

class CourseAdd {
  CourseAdd({
    required this.accompagnement,
    required this.dateEnd,
    required this.dateStart,
    required this.description,
    required this.lieuAdresse,
    required this.lieuCodePostal,
    required this.lieuVille,
    required this.listeCourse,
    required this.name,
    required this.price,
    required this.typeLieu,
    required this.userToken,
  });

  String accompagnement;
  DateTime dateEnd;
  DateTime dateStart;
  String description;
  String lieuAdresse;
  int lieuCodePostal;
  String lieuVille;
  String listeCourse;
  String name;
  int price;
  String typeLieu;
  String userToken;

  factory CourseAdd.fromJson(Map<String, dynamic> json) => CourseAdd(
        accompagnement: json["accompagnement"],
        dateEnd: DateTime.parse(json["dateEnd"]),
        dateStart: DateTime.parse(json["dateStart"]),
        description: json["description"],
        lieuAdresse: json["lieuAdresse"],
        lieuCodePostal: json["lieuCodePostal"],
        lieuVille: json["lieuVille"],
        listeCourse: json["listeCourse"],
        name: json["name"],
        price: json["price"],
        typeLieu: json["typeLieu"],
        userToken: json["userToken"],
      );

  Map<String, dynamic> toJson() => {
        "accompagnement": accompagnement,
        "dateEnd": dateEnd.toIso8601String(),
        "dateStart": dateStart.toIso8601String(),
        "description": description,
        "lieuAdresse": lieuAdresse,
        "lieuCodePostal": lieuCodePostal,
        "lieuVille": lieuVille,
        "listeCourse": listeCourse,
        "name": name,
        "price": price,
        "typeLieu": typeLieu,
        "userToken": userToken,
      };
}
