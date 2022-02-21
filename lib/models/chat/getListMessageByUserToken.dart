// To parse this JSON data, do
//
//     final getListMessageByUserToken = getListMessageByUserTokenFromJson(jsonString);

import 'dart:convert';

List<GetListMessageByUserToken> getListMessageByUserTokenFromJson(String str) =>
    List<GetListMessageByUserToken>.from(
        json.decode(str).map((x) => GetListMessageByUserToken.fromJson(x)));

String getListMessageByUserTokenToJson(List<GetListMessageByUserToken> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GetListMessageByUserToken {
  GetListMessageByUserToken({
    required this.uuid,
    required this.service,
    required this.messages,
    required this.users,
  });

  String uuid;
  Service service;
  List<Message> messages;
  List<User> users;

  factory GetListMessageByUserToken.fromJson(Map<String, dynamic> json) =>
      GetListMessageByUserToken(
        uuid: json["uuid"],
        service: Service.fromJson(json["service"]),
        messages: List<Message>.from(
            json["messages"].map((x) => Message.fromJson(x))),
        users: List<User>.from(json["users"].map((x) => User.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "uuid": uuid,
        "service": service.toJson(),
        "messages": List<dynamic>.from(messages.map((x) => x.toJson())),
        "users": List<dynamic>.from(users.map((x) => x.toJson())),
      };
}

class Message {
  Message({
    required this.uuid,
    required this.author,
    required this.postDate,
    required this.message,
    required this.unreaded,
  });

  String uuid;
  User author;
  int postDate;
  String message;
  bool unreaded;

  factory Message.fromJson(Map<String, dynamic> json) => Message(
        uuid: json["uuid"],
        author: User.fromJson(json["author"]),
        postDate: json["postDate"],
        message: json["message"],
        unreaded: json["unreaded"],
      );

  Map<String, dynamic> toJson() => {
        "uuid": uuid,
        "author": author.toJson(),
        "postDate": postDate,
        "message": message,
        "unreaded": unreaded,
      };
}

class User {
  User({
    required this.id,
    required this.name,
    required this.firstname,
    required this.profilPicture,
    required this.admin,
    required this.email,
    required this.tel,
    required this.address,
    required this.dateNaiss,
    required this.credit,
  });

  int id;
  String name;
  String firstname;
  String profilPicture;
  bool admin;
  String email;
  dynamic tel;
  dynamic address;
  int dateNaiss;
  int credit;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"],
        firstname: json["firstname"],
        profilPicture: json["profilPicture"],
        admin: json["admin"],
        email: json["email"],
        tel: json["tel"],
        address: json["address"],
        dateNaiss: json["dateNaiss"],
        credit: json["credit"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": nameValues.reverse![name],
        "firstname": firstnameValues.reverse![firstname],
        "profilPicture": profilPicture,
        "admin": admin,
        "email": emailValues.reverse![email],
        "tel": tel,
        "address": address,
        "dateNaiss": dateNaiss,
        "credit": credit,
      };
}

enum Email { BMETAIS_ASKHIM_FR, CTREMPE_ASKHIM_FR }

final emailValues = EnumValues({
  "bmetais@askhim.fr": Email.BMETAIS_ASKHIM_FR,
  "ctrempe@askhim.fr": Email.CTREMPE_ASKHIM_FR
});

enum Firstname { BASTIEN, CLMENT }

final firstnameValues =
    EnumValues({"Bastien": Firstname.BASTIEN, "Clément": Firstname.CLMENT});

enum Name { MTAIS, TREMP }

final nameValues = EnumValues({"Métais": Name.MTAIS, "Trempé": Name.TREMP});

class Service {
  Service({
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
  List<dynamic> photos;

  factory Service.fromJson(Map<String, dynamic> json) => Service(
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
        photos: List<dynamic>.from(json["photos"].map((x) => x)),
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
        "photos": List<dynamic>.from(photos.map((x) => x)),
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

class Type {
  Type({
    required this.id,
    required this.libelle,
    required this.defaultPhoto,
    required this.defaultPhotoMobile,
    required this.prefer,
  });

  int id;
  String libelle;
  String defaultPhoto;
  String defaultPhotoMobile;
  List<dynamic> prefer;

  factory Type.fromJson(Map<String, dynamic> json) => Type(
        id: json["id"],
        libelle: json["libelle"],
        defaultPhoto: json["defaultPhoto"],
        defaultPhotoMobile: json["defaultPhotoMobile"],
        prefer: List<dynamic>.from(json["prefer"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "libelle": libelle,
        "defaultPhoto": defaultPhoto,
        "defaultPhotoMobile": defaultPhotoMobile,
        "prefer": List<dynamic>.from(prefer.map((x) => x)),
      };
}

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
