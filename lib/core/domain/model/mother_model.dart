// To parse this JSON data, do
//
//     final mother = motherFromJson(jsonString);

import 'dart:convert';

Mother motherFromJson(String str) => Mother.fromJson(json.decode(str));

String motherToJson(Mother data) => json.encode(data.toJson());

class Mother {
  Mother({
    this.status,
    this.message,
    this.data,
  });

  String status;
  String message;
  List<MotherDatum> data;

  factory Mother.fromJson(Map<String, dynamic> json) => Mother(
        status: json["status"],
        message: json["message"],
        data: List<MotherDatum>.from(
            json["data"].map((x) => MotherDatum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class MotherDatum {
  MotherDatum({
    this.id,
    this.title,
    this.slug,
    this.content,
    this.createdAt,
    this.status,
    this.atribut,
    this.taksonomi,
  });

  String id;
  String title;
  String slug;
  String content;
  DateTime createdAt;
  String status;
  Map<String, Atribut> atribut;
  List<dynamic> taksonomi;

  factory MotherDatum.fromJson(Map<String, dynamic> json) => MotherDatum(
        id: json["ID"],
        title: json["title"],
        slug: json["slug"],
        content: json["content"],
        createdAt: DateTime.parse(json["created_at"]),
        status: json["status"],
        atribut: Map.from(json["atribut"])
            .map((k, v) => MapEntry<String, Atribut>(k, Atribut.fromJson(v))),
        taksonomi: List<dynamic>.from(json["taksonomi"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "ID": id,
        "title": title,
        "slug": slug,
        "content": content,
        "created_at": createdAt.toIso8601String(),
        "status": status,
        "atribut": Map.from(atribut)
            .map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
        "taksonomi": List<dynamic>.from(taksonomi.map((x) => x)),
      };
}

class Atribut {
  Atribut({
    this.id,
    this.slug,
    this.title,
    this.content,
    this.data,
  });

  String id;
  String slug;
  String title;
  String content;
  List<AtributDatum> data;

  factory Atribut.fromJson(Map<String, dynamic> json) => Atribut(
        id: json["ID"],
        slug: json["slug"],
        title: json["title"],
        content: json["content"],
        data: List<AtributDatum>.from(
            json["data"].map((x) => AtributDatum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "ID": id,
        "slug": slug,
        "title": title,
        "content": content,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class AtributDatum {
  AtributDatum({
    this.id,
    this.content,
    this.caption,
    this.dataType,
  });

  String id;
  String content;
  String caption;
  DataType dataType;

  factory AtributDatum.fromJson(Map<String, dynamic> json) => AtributDatum(
        id: json["ID"],
        content: json["content"],
        caption: json["caption"],
        dataType: dataTypeValues.map[json["data_type"]],
      );

  Map<String, dynamic> toJson() => {
        "ID": id,
        "content": content,
        "caption": caption,
        "data_type": dataTypeValues.reverse[dataType],
      };
}

enum DataType { PLAIN, KLASTER_RELATION }

final dataTypeValues = EnumValues(
    {"klaster_relation": DataType.KLASTER_RELATION, "plain": DataType.PLAIN});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
