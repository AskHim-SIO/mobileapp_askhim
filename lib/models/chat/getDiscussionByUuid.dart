// To parse this JSON data, do
//
//     final getDiscussionByUuid = getDiscussionByUuidFromJson(jsonString);

import 'dart:convert';

GetDiscussionByUuid getDiscussionByUuidFromJson(String str) =>
    GetDiscussionByUuid.fromJson(json.decode(str));

String getDiscussionByUuidToJson(GetDiscussionByUuid data) =>
    json.encode(data.toJson());

class GetDiscussionByUuid {
  GetDiscussionByUuid({
    required this.uuid,
    required this.service,
    required this.messages,
    required this.users,
  });

  String uuid;
  Service service;
  List<Message> messages;
  List<User> users;

  factory GetDiscussionByUuid.fromJson(Map<String, dynamic> json) =>
      GetDiscussionByUuid(
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
  });

  String uuid;
  User author;
  int postDate;
  String message;

  factory Message.fromJson(Map<String, dynamic> json) => Message(
        uuid: json["uuid"],
        author: User.fromJson(json["author"]),
        postDate: json["postDate"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "uuid": uuid,
        "author": author.toJson(),
        "postDate": postDate,
        "message": message,
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
  int tel;
  Address? address;
  int dateNaiss;
  int credit;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"],
        firstname: json["firstname"],
        profilPicture: json["profilPicture"],
        admin: json["admin"],
        email: json["email"],
        tel: json["tel"] == null ? 0 : json["tel"],
        address:
            json["address"] == null ? null : addressValues.map[json["address"]],
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
        "tel": tel == null ? null : tel,
        "address": address == null ? null : addressValues.reverse![address],
        "dateNaiss": dateNaiss,
        "credit": credit,
      };
}

enum Address { THE_27_RUE_LECOURBE_75015_PARIS }

final addressValues = EnumValues(
    {"27 Rue Lecourbe 75015 Paris": Address.THE_27_RUE_LECOURBE_75015_PARIS});

enum Email { MALCOM_GMAIL_COM, CONTACT_ASKHIM_FR, EMMANUEL_MACRON_GOUV_FR }

final emailValues = EnumValues({
  "contact@askhim.fr": Email.CONTACT_ASKHIM_FR,
  "emmanuel.macron@gouv.fr": Email.EMMANUEL_MACRON_GOUV_FR,
  "malcom@gmail.com": Email.MALCOM_GMAIL_COM
});

enum Firstname { MALCOM, CONTACT, EMMANUEL }

final firstnameValues = EnumValues({
  "Contact": Firstname.CONTACT,
  "Emmanuel": Firstname.EMMANUEL,
  "Malcom": Firstname.MALCOM
});

enum Name { MOREL, ASK_HIM, MACRON }

final nameValues = EnumValues(
    {"AskHim": Name.ASK_HIM, "Macron": Name.MACRON, "Morel": Name.MOREL});

class Service {
  Service({
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
  List<dynamic> photos;

  factory Service.fromJson(Map<String, dynamic> json) => Service(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        dateStart: json["dateStart"],
        dateEnd: json["dateEnd"],
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
