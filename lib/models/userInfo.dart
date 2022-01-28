// To parse this JSON data, do
//
//     final userInfo = userInfoFromJson(jsonString);

import 'dart:convert';

UserInfo userInfoFromJson(String str) => UserInfo.fromJson(json.decode(str));

String userInfoToJson(UserInfo data) => json.encode(data.toJson());

class UserInfo {
  UserInfo({
    required this.name,
    required this.firstname,
    required this.profilPicture,
  });

  String name;
  String firstname;
  dynamic profilPicture;

  factory UserInfo.fromJson(Map<String, dynamic> json) => UserInfo(
        name: json["name"],
        firstname: json["firstname"],
        profilPicture: json["profilPicture"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "firstname": firstname,
        "profilPicture": profilPicture,
      };
}
