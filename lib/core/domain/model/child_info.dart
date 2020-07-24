// To parse this JSON data, do
//
//     final childInfo = childInfoFromJson(jsonString);

import 'dart:convert';

ChildInfo childInfoFromJson(String str) => ChildInfo.fromJson(json.decode(str));

String childInfoToJson(ChildInfo data) => json.encode(data.toJson());

class ChildInfo {
  ChildInfo({
    this.status,
    this.message,
    this.data,
  });

  String status;
  String message;
  List<ChildInfoDatum> data;

  factory ChildInfo.fromJson(Map<String, dynamic> json) => ChildInfo(
        status: json["status"],
        message: json["message"],
        data: List<ChildInfoDatum>.from(
            json["data"].map((x) => ChildInfoDatum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class ChildInfoDatum {
  ChildInfoDatum({
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

  factory ChildInfoDatum.fromJson(Map<String, dynamic> json) => ChildInfoDatum(
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
  String dataType;

  factory AtributDatum.fromJson(Map<String, dynamic> json) => AtributDatum(
        id: json["ID"],
        content: json["content"],
        caption: json["caption"],
        dataType: json["data_type"],
      );

  Map<String, dynamic> toJson() => {
        "ID": id,
        "content": content,
        "caption": caption,
        "data_type": dataType,
      };
}
