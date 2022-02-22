// To parse this JSON data, do
//
//     final updateUser = updateUserFromJson(jsonString);

import 'dart:convert';

UpdateUser updateUserFromJson(String str) =>
    UpdateUser.fromJson(json.decode(str));

String updateUserToJson(UpdateUser data) => json.encode(data.toJson());

class UpdateUser {
  UpdateUser({
    required this.address,
    required this.admin,
    required this.credit,
    required this.dateNaiss,
    required this.email,
    required this.firstname,
    required this.id,
    required this.name,
    required this.profilPicture,
    required this.tel,
  });

  String address;
  bool admin;
  int credit;
  DateTime dateNaiss;
  String email;
  String firstname;
  int id;
  String name;
  String profilPicture;
  int tel;

  factory UpdateUser.fromJson(Map<String, dynamic> json) => UpdateUser(
        address: json["address"],
        admin: json["admin"],
        credit: json["credit"],
        dateNaiss: DateTime.parse(json["dateNaiss"]),
        email: json["email"],
        firstname: json["firstname"],
        id: json["id"],
        name: json["name"],
        profilPicture: json["profilPicture"],
        tel: json["tel"],
      );

  Map<String, dynamic> toJson() => {
        "address": address,
        "admin": admin,
        "credit": credit,
        "dateNaiss": dateNaiss.toIso8601String(),
        "email": email,
        "firstname": firstname,
        "id": id,
        "name": name,
        "profilPicture": profilPicture,
        "tel": tel,
      };
}
