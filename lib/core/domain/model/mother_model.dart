// To parse this JSON data, do
//
//     final mother = motherFromJson(jsonString);

import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'mother_model.g.dart';

@JsonSerializable(explicitToJson: false)
class Mother extends Equatable {
  @JsonKey(name: 'ID')
  final String id;
  @JsonKey(name: 'title')
  final String title;
  @JsonKey(name: 'slug')
  final String slug;
  @JsonKey(name: 'content')
  final String content;
  @JsonKey(name: 'created_at')
  final String createdAt;
  @JsonKey(name: 'status')
  final String status;
  @JsonKey(name: 'atribut')
  final Atribut atribut;
  Mother({
    String id,
    String title,
    String slug,
    String content,
    String createdAt,
    String status,
    Atribut atribut,
  })  : this.id = id ?? "",
        this.title = title ?? "",
        this.slug = slug ?? "",
        this.status = status ?? "",
        this.content = content ?? "",
        this.createdAt = createdAt ?? "",
        this.atribut = atribut ?? Atribut();

  Mother copyWith({
    String id,
    String title,
    String slug,
    String content,
    String createdAt,
    String status,
    Atribut atribut,
  }) {
    return Mother(
        id: id ?? this.id,
        title: title ?? this.title,
        slug: slug ?? this.slug,
        status: status ?? this.status,
        content: content ?? this.content,
        createdAt: createdAt ?? this.createdAt,
        atribut: atribut ?? this.atribut);
  }

  // final List<Null> taksonomi;

  @override
  List<Object> get props {
    return <Object>[
      this.id,
      this.title,
      this.slug,
      this.content,
      this.createdAt,
      this.status
    ];
  }

  factory Mother.fromJson(Map<String, dynamic> json) => _$MotherFromJson(json);
  Map<String, dynamic> toJson() => _$MotherToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Atribut {
  @JsonKey(name: 'posyandu')
  final Posyandu posyandu;
  @JsonKey(name: 'nik')
  final Posyandu nik;
  @JsonKey(name: 'nama_suami')
  final Posyandu namaSuami;
  @JsonKey(name: 'nik_suami')
  final Posyandu nikSuami;
  @JsonKey(name: 'tanggal_lahir')
  final Posyandu tanggalLahir;
  @JsonKey(name: 'tempat_lahir')
  final Posyandu tempatLahir;
  @JsonKey(name: 'nomor_handphone')
  final Posyandu nomorHandphone;
  @JsonKey(name: 'golongan_darah')
  final Posyandu golonganDarah;
  @JsonKey(name: 'alamat')
  final Posyandu alamat;
  @JsonKey(name: 'nomor_bpjs')
  final Posyandu nomorBpjs;
  @JsonKey(name: 'status_keluarga_sejahtera')
  final Posyandu statusKeluargaSejahtera;
  @JsonKey(name: 'status_keluarga_sejahtera(alternatif)')
  final Posyandu nomorHandphoneAlternatif;
  @JsonKey(name: 'catatan')
  final Posyandu catatan;

  Atribut(
      {Posyandu posyandu,
      Posyandu nik,
      Posyandu namaSuami,
      Posyandu nikSuami,
      Posyandu tanggalLahir,
      Posyandu tempatLahir,
      Posyandu nomorHandphone,
      Posyandu golonganDarah,
      Posyandu alamat,
      Posyandu nomorBpjs,
      Posyandu statusKeluargaSejahtera,
      Posyandu nomorHandphoneAlternatif,
      Posyandu catatan})
      : this.posyandu = posyandu ?? Posyandu(),
        this.nik = nik ?? Posyandu(),
        this.namaSuami = namaSuami ?? Posyandu(),
        this.nikSuami = nikSuami ?? Posyandu(),
        this.tanggalLahir = tanggalLahir ?? Posyandu(),
        this.tempatLahir = tempatLahir ?? Posyandu(),
        this.nomorHandphone = nomorHandphone ?? Posyandu(),
        this.alamat = alamat ?? Posyandu(),
        this.nomorBpjs = nomorBpjs ?? Posyandu(),
        this.golonganDarah = golonganDarah ?? Posyandu(),
        this.statusKeluargaSejahtera = statusKeluargaSejahtera ?? Posyandu(),
        this.nomorHandphoneAlternatif = nomorHandphoneAlternatif ?? Posyandu(),
        this.catatan = catatan ?? Posyandu();
  factory Atribut.fromJson(Map<String, dynamic> json) =>
      _$AtributFromJson(json);
}

@JsonSerializable(explicitToJson: false)
class Posyandu {
  final String id;
  final String slug;
  final String title;
  final String content;
  final List<Data> data;

  Posyandu({
    String id,
    String slug,
    String title,
    String content,
    List<Data> data,
  })  : this.id = id ?? "",
        this.slug = slug ?? "",
        this.title = title ?? "",
        this.content = content ?? "",
        this.data = data ?? [];

  factory Posyandu.fromJson(Map<String, dynamic> json) =>
      _$PosyanduFromJson(json);
}

@JsonSerializable(explicitToJson: false)
class Data {
  String id;
  String content;
  String caption;
  String dataType;

  Data({
    String id,
    String content,
    String caption,
    String dataType,
  })  : this.id = id ?? "",
        this.content = content ?? "",
        this.caption = caption ?? "",
        this.dataType = dataType ?? "";

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
}

@JsonSerializable(explicitToJson: false)
class MotherResponse {
  final List<Mother> motherList;
  final mother = Mother();

  MotherResponse({this.motherList});

  factory MotherResponse.fromJson(json) => _$MotherResponseFromJson(json);
}

@JsonSerializable(explicitToJson: true)
class RequestMother {
  RequestMother({String title, String content, Atribut atribut})
      : this.title = title ?? "alif",
        this.content = content ?? "gibran",
        this.atribut = atribut ?? Atribut();

  String title;
  String content;
  Atribut atribut;

  Map<String, dynamic> toJson() => {
        "title": title,
        "content": content,
        "atribut": jsonEncode(atribut),
      };
}

@JsonSerializable()
class Alamat {
  Alamat({
    this.content,
    this.caption,
  });

  String content;
  String caption;

  factory Alamat.fromJson(Map<String, dynamic> json) => _$AlamatFromJson(json);
}
