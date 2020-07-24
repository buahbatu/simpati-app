// To parse this JSON data, do
//
//     final motherInfo = motherInfoFromJson(jsonString);

import 'dart:convert';

MotherInfo motherInfoFromJson(String str) =>
    MotherInfo.fromJson(json.decode(str));

String motherInfoToJson(MotherInfo data) => json.encode(data.toJson());

class MotherInfo {
  MotherInfo({
    this.status,
    this.message,
    this.data,
  });

  String status;
  String message;
  List<MotherInfoDatum> data;

  factory MotherInfo.fromJson(Map<String, dynamic> json) => MotherInfo(
        status: json["status"],
        message: json["message"],
        data: List<MotherInfoDatum>.from(
            json["data"].map((x) => MotherInfoDatum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class MotherInfoDatum {
  MotherInfoDatum({
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
  Atribut atribut;
  List<dynamic> taksonomi;

  factory MotherInfoDatum.fromJson(Map<String, dynamic> json) =>
      MotherInfoDatum(
        id: json["ID"],
        title: json["title"],
        slug: json["slug"],
        content: json["content"],
        createdAt: DateTime.parse(json["created_at"]),
        status: json["status"],
        atribut: Atribut.fromJson(json["atribut"]),
        taksonomi: List<dynamic>.from(json["taksonomi"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "ID": id,
        "title": title,
        "slug": slug,
        "content": content,
        "created_at": createdAt.toIso8601String(),
        "status": status,
        "atribut": atribut.toJson(),
        "taksonomi": List<dynamic>.from(taksonomi.map((x) => x)),
      };
}

class Atribut {
  Atribut({
    this.ibu,
    this.posyandu,
    this.kehamilanKe,
    this.prediksiKelamin,
    this.terakhirMenstruasi,
  });

  Ibu ibu;
  Ibu posyandu;
  Ibu kehamilanKe;
  Ibu prediksiKelamin;
  Ibu terakhirMenstruasi;

  factory Atribut.fromJson(Map<String, dynamic> json) => Atribut(
        ibu: Ibu.fromJson(json["ibu"]),
        posyandu: Ibu.fromJson(json["posyandu"]),
        kehamilanKe: Ibu.fromJson(json["kehamilan_ke"]),
        prediksiKelamin: Ibu.fromJson(json["prediksi_kelamin"]),
        terakhirMenstruasi: Ibu.fromJson(json["terakhir_menstruasi"]),
      );

  Map<String, dynamic> toJson() => {
        "ibu": ibu.toJson(),
        "posyandu": posyandu.toJson(),
        "kehamilan_ke": kehamilanKe.toJson(),
        "prediksi_kelamin": prediksiKelamin.toJson(),
        "terakhir_menstruasi": terakhirMenstruasi.toJson(),
      };
}

class Ibu {
  Ibu({
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
  List<IbuDatum> data;

  factory Ibu.fromJson(Map<String, dynamic> json) => Ibu(
        id: json["ID"],
        slug: json["slug"],
        title: json["title"],
        content: json["content"],
        data:
            List<IbuDatum>.from(json["data"].map((x) => IbuDatum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "ID": id,
        "slug": slug,
        "title": title,
        "content": content,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class IbuDatum {
  IbuDatum({
    this.id,
    this.content,
    this.caption,
    this.dataType,
  });

  String id;
  String content;
  String caption;
  String dataType;

  factory IbuDatum.fromJson(Map<String, dynamic> json) => IbuDatum(
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
