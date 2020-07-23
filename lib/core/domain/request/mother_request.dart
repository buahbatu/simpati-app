// To parse this JSON data, do
//
//     final requestMother = requestMotherFromJson(jsonString);

import 'dart:convert';

List<RequestMother> requestMotherFromJson(String str) =>
    List<RequestMother>.from(
        json.decode(str).map((x) => RequestMother.fromJson(x)));

String requestMotherToJson(List<RequestMother> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class RequestMother {
  // RequestMother({
  //   this.title,
  //   this.content,
  //   this.atribut = const Atribut(),
  // });
  RequestMother({String title, String content, Atribut atribut})
      : this.title = title ?? "alif",
        this.content = content ?? "gibran",
        this.atribut = atribut ?? Atribut();

  String title;
  String content;
  Atribut atribut;

  factory RequestMother.fromJson(Map<String, dynamic> json) => RequestMother(
        title: json["title"],
        content: json["content"],
        atribut: Atribut.fromJson(json["atribut"]),
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "content": content,
        "atribut": atribut.toJson(),
      };
}

class Atribut {
  Atribut({
    Alamat nik,
    Alamat tanggalLahir,
    Alamat namaSuami,
    Alamat alamat,
    Alamat golonganDarah,
    Alamat nomerTelpon,
  })  : this.nik = nik ?? Alamat(),
        this.tanggalLahir = nik ?? Alamat(),
        this.namaSuami = nik ?? Alamat(),
        this.alamat = nik ?? Alamat(),
        this.golonganDarah = nik ?? Alamat(),
        this.nomerTelpon = nik ?? Alamat();

  final Alamat nik;
  final Alamat tanggalLahir;
  final Alamat namaSuami;
  final Alamat alamat;
  final Alamat golonganDarah;
  final Alamat nomerTelpon;

  factory Atribut.fromJson(Map<String, dynamic> json) => Atribut(
      nik: json["nik"],
      tanggalLahir: json["tanggal_lahir"],
      namaSuami: json["nama_suami"],
      alamat: json["alamat"],
      golonganDarah: json["golongan_darah"],
      nomerTelpon: json["nomer_telpon"]);

  Map<String, dynamic> toJson() => {
        "nik": nik,
        "tanggal_lahir": tanggalLahir,
        "nama_suami": namaSuami,
        "alamat": alamat,
        "golongan_darah": golonganDarah,
        "nomer_telpon": nomerTelpon
      };
}

class Alamat {
  Alamat({
    this.content,
    this.caption,
  });

  String content;
  String caption;

  factory Alamat.fromJson(Map<String, dynamic> json) => Alamat(
        content: json["content"],
        caption: json["caption"],
      );

  Map<String, dynamic> toJson() => {
        "content": content,
        "caption": caption,
      };
}
