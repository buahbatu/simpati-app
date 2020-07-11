// To parse this JSON data, do
//
//     final children = childrenFromJson(jsonString);

import 'dart:convert';

Children childrenFromJson(String str) => Children.fromJson(json.decode(str));

String childrenToJson(Children data) => json.encode(data.toJson());

class Children {
  Children({
    this.status,
    this.message,
    this.data,
  });

  String status;
  String message;
  List<ChildrenDatum> data;

  factory Children.fromJson(Map<String, dynamic> json) => Children(
        status: json["status"],
        message: json["message"],
        data: List<ChildrenDatum>.from(
            json["data"].map((x) => ChildrenDatum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class ChildrenDatum {
  ChildrenDatum({
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

  factory ChildrenDatum.fromJson(Map<String, dynamic> json) => ChildrenDatum(
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

enum DataType { KLASTER_RELATION, TEXT }

final dataTypeValues = EnumValues(
    {"klaster_relation": DataType.KLASTER_RELATION, "text": DataType.TEXT});

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
