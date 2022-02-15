// To parse this JSON data, do
//
//     final adresse = adresseFromJson(jsonString);

import 'dart:convert';

Adresse adresseFromJson(String str) => Adresse.fromJson(json.decode(str));

String adresseToJson(Adresse data) => json.encode(data.toJson());

class Adresse {
  Adresse({
    required this.type,
    required this.version,
    required this.features,
    required this.attribution,
    required this.licence,
    required this.query,
    required this.limit,
  });

  String type;
  String version;
  List<Feature> features;
  String attribution;
  String licence;
  String query;
  int limit;

  factory Adresse.fromJson(Map<String, dynamic> json) => Adresse(
        type: json["type"],
        version: json["version"],
        features: List<Feature>.from(
            json["features"].map((x) => Feature.fromJson(x))),
        attribution: json["attribution"],
        licence: json["licence"],
        query: json["query"],
        limit: json["limit"],
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "version": version,
        "features": List<dynamic>.from(features.map((x) => x.toJson())),
        "attribution": attribution,
        "licence": licence,
        "query": query,
        "limit": limit,
      };
}

class Feature {
  Feature({
    required this.type,
    required this.geometry,
    required this.properties,
  });

  String type;
  Geometry geometry;
  Properties properties;

  factory Feature.fromJson(Map<String, dynamic> json) => Feature(
        type: json["type"],
        geometry: Geometry.fromJson(json["geometry"]),
        properties: Properties.fromJson(json["properties"]),
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "geometry": geometry.toJson(),
        "properties": properties.toJson(),
      };
}

class Geometry {
  Geometry({
    required this.type,
    required this.coordinates,
  });

  String type;
  List<double> coordinates;

  factory Geometry.fromJson(Map<String, dynamic> json) => Geometry(
        type: json["type"],
        coordinates:
            List<double>.from(json["coordinates"].map((x) => x.toDouble())),
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "coordinates": List<dynamic>.from(coordinates.map((x) => x)),
      };
}

class Properties {
  Properties({
    required this.label,
    required this.score,
    required this.housenumber,
    required this.id,
    required this.type,
    required this.name,
    required this.postcode,
    required this.citycode,
    required this.x,
    required this.y,
    required this.city,
    required this.context,
    required this.importance,
    required this.street,
  });

  String label;
  double score;
  String? housenumber;
  String id;
  String type;
  String name;
  String postcode;
  String citycode;
  double x;
  double y;
  String city;
  String context;
  double importance;
  String? street;

  factory Properties.fromJson(Map<String, dynamic> json) => Properties(
        label: json["label"],
        score: json["score"].toDouble(),
        housenumber: json["housenumber"],
        id: json["id"],
        type: json["type"],
        name: json["name"],
        postcode: json["postcode"],
        citycode: json["citycode"],
        x: json["x"].toDouble(),
        y: json["y"].toDouble(),
        city: json["city"],
        context: json["context"],
        importance: json["importance"].toDouble(),
        street: json["street"],
      );

  Map<String, dynamic> toJson() => {
        "label": label,
        "score": score,
        "housenumber": housenumber,
        "id": id,
        "type": type,
        "name": name,
        "postcode": postcode,
        "citycode": citycode,
        "x": x,
        "y": y,
        "city": city,
        "context": context,
        "importance": importance,
        "street": street,
      };
}
