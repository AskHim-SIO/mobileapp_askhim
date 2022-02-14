// To parse this JSON data, do
//
//     final getAdresseDetail = getAdresseDetailFromJson(jsonString);

import 'dart:convert';

GetAdresseDetail getAdresseDetailFromJson(String str) =>
    GetAdresseDetail.fromJson(json.decode(str));

String getAdresseDetailToJson(GetAdresseDetail data) =>
    json.encode(data.toJson());

class GetAdresseDetail {
  GetAdresseDetail({
    required this.spatialReference,
    required this.candidates,
  });

  SpatialReference spatialReference;
  List<Candidate> candidates;

  factory GetAdresseDetail.fromJson(Map<String, dynamic> json) =>
      GetAdresseDetail(
        spatialReference: SpatialReference.fromJson(json["spatialReference"]),
        candidates: List<Candidate>.from(
            json["candidates"].map((x) => Candidate.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "spatialReference": spatialReference.toJson(),
        "candidates": List<dynamic>.from(candidates.map((x) => x.toJson())),
      };
}

class Candidate {
  Candidate({
    required this.address,
    required this.location,
    required this.score,
    required this.attributes,
    required this.extent,
  });

  String address;
  Location location;
  double score;
  Attributes attributes;
  Extent extent;

  factory Candidate.fromJson(Map<String, dynamic> json) => Candidate(
        address: json["address"],
        location: Location.fromJson(json["location"]),
        score: json["score"].toDouble(),
        attributes: Attributes.fromJson(json["attributes"]),
        extent: Extent.fromJson(json["extent"]),
      );

  Map<String, dynamic> toJson() => {
        "address": address,
        "location": location.toJson(),
        "score": score,
        "attributes": attributes.toJson(),
        "extent": extent.toJson(),
      };
}

class Attributes {
  Attributes({
    required this.matchAddr,
    required this.stAddr,
  });

  String matchAddr;
  String stAddr;

  factory Attributes.fromJson(Map<String, dynamic> json) => Attributes(
        matchAddr: json["Match_addr"],
        stAddr: json["StAddr"],
      );

  Map<String, dynamic> toJson() => {
        "Match_addr": matchAddr,
        "StAddr": stAddr,
      };
}

class Extent {
  Extent({
    required this.xmin,
    required this.ymin,
    required this.xmax,
    required this.ymax,
  });

  double xmin;
  double ymin;
  double xmax;
  double ymax;

  factory Extent.fromJson(Map<String, dynamic> json) => Extent(
        xmin: json["xmin"].toDouble(),
        ymin: json["ymin"].toDouble(),
        xmax: json["xmax"].toDouble(),
        ymax: json["ymax"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "xmin": xmin,
        "ymin": ymin,
        "xmax": xmax,
        "ymax": ymax,
      };
}

class Location {
  Location({
    required this.x,
    required this.y,
  });

  double x;
  double y;

  factory Location.fromJson(Map<String, dynamic> json) => Location(
        x: json["x"].toDouble(),
        y: json["y"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "x": x,
        "y": y,
      };
}

class SpatialReference {
  SpatialReference({
    required this.wkid,
    required this.latestWkid,
  });

  int wkid;
  int latestWkid;

  factory SpatialReference.fromJson(Map<String, dynamic> json) =>
      SpatialReference(
        wkid: json["wkid"],
        latestWkid: json["latestWkid"],
      );

  Map<String, dynamic> toJson() => {
        "wkid": wkid,
        "latestWkid": latestWkid,
      };
}
