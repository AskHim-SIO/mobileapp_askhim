// To parse this JSON data, do
//
//     final getUserById = getUserByIdFromJson(jsonString);

import 'dart:convert';

GetUserById getUserByIdFromJson(String str) =>
    GetUserById.fromJson(json.decode(str));

String getUserByIdToJson(GetUserById data) => json.encode(data.toJson());

class GetUserById {
  GetUserById({
    required this.id,
    required this.name,
    required this.firstname,
    required this.profilPicture,
    required this.email,
    required this.tel,
    required this.adress,
    required this.dateNaiss,
    required this.admin,
  });

  int id;
  String name;
  String firstname;
  String profilPicture;
  String email;
  dynamic tel;
  dynamic adress;
  int dateNaiss;
  bool admin;

  factory GetUserById.fromJson(Map<String, dynamic> json) => GetUserById(
        id: json["id"],
        name: json["name"],
        firstname: json["firstname"],
        profilPicture: json["profilPicture"],
        email: json["email"],
        tel: json["tel"],
        adress: json["adress"],
        dateNaiss: json["dateNaiss"],
        admin: json["admin"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "firstname": firstname,
        "profilPicture": profilPicture,
        "email": email,
        "tel": tel,
        "adress": adress,
        "dateNaiss": dateNaiss,
        "admin": admin,
      };
}
