import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'mother.g.dart';

class MotherN extends Equatable {
  final String id;
  final String title;
  final String slug;
  final String content;
  final String createdAt;
  final String status;
  final String posyandu;
  final String nik;
  final String namaSuami;
  final String nikSuami;
  final String tanggalLahir;
  final String tempatLahir;
  final String nomorHandphone;
  final String golonganDarah;
  final String alamat;
  final String nomorBpjs;
  final String statusKeluargaSejahtera;
  final String nomorHandphoneAlternatif;
  final String catatan;

  MotherN(
      {String id,
      String title,
      String slug,
      String content,
      String createdAt,
      String status,
      String posyandu,
      String nik,
      String namaSuami,
      String nikSuami,
      String tanggalLahir,
      String tempatLahir,
      String nomorHandphone,
      String golonganDarah,
      String alamat,
      String nomorBpjs,
      String statusKeluargaSejahtera,
      String nomorHandphoneAlternatif,
      String catatan})
      : this.id = id ?? "",
        this.title = title ?? "",
        this.slug = slug ?? "",
        this.status = status ?? "",
        this.content = content ?? "",
        this.posyandu = posyandu ?? "",
        this.createdAt = createdAt ?? "",
        this.nik = nik ?? "",
        this.namaSuami = namaSuami ?? "",
        this.nikSuami = nikSuami ?? "",
        this.tanggalLahir = tanggalLahir ?? "",
        this.tempatLahir = tempatLahir ?? "",
        this.nomorHandphone = nomorHandphone ?? "",
        this.alamat = alamat ?? "",
        this.nomorBpjs = nomorBpjs ?? "",
        this.golonganDarah = golonganDarah ?? "",
        this.statusKeluargaSejahtera = statusKeluargaSejahtera ?? "",
        this.nomorHandphoneAlternatif = nomorHandphoneAlternatif ?? "",
        this.catatan = catatan ?? "";

  @override
  // TODO: implement props
  List<Object> get props {
    return <Object>[
      this.id,
      this.title,
      this.slug,
      this.content,
      this.createdAt,
      this.status,
      this.posyandu,
      this.nik,
      this.namaSuami,
      this.nikSuami,
      this.tanggalLahir,
      this.tempatLahir,
      this.nomorHandphone,
      this.golonganDarah,
      this.alamat,
      this.nomorBpjs,
      this.statusKeluargaSejahtera,
      this.nomorHandphoneAlternatif,
      this.catatan,
    ];
  }

  MotherN copyWith(
      {String id,
      String title,
      String slug,
      String content,
      String createdAt,
      String status,
      String posyandu,
      String nik,
      String namaSuami,
      String nikSuami,
      String tanggalLahir,
      String tempatLahir,
      String nomorHandphone,
      String golonganDarah,
      String alamat,
      String nomorBpjs,
      String statusKeluargaSejahtera,
      String nomorHandphoneAlternatif,
      String catatan}) {
    return MotherN(
      id: id ?? this.id,
      title: title ?? this.title,
      slug: slug ?? this.slug,
      content: content ?? this.content,
      createdAt: createdAt ?? this.createdAt,
      status: status ?? this.status,
      posyandu: posyandu ?? this.posyandu,
      nik: nik ?? this.nik,
      namaSuami: namaSuami ?? this.namaSuami,
      nikSuami: nikSuami ?? this.nikSuami,
      tanggalLahir: tanggalLahir ?? this.tanggalLahir,
      tempatLahir: tempatLahir ?? this.tempatLahir,
      nomorHandphone: nomorHandphone ?? this.nomorHandphone,
      golonganDarah: golonganDarah ?? this.golonganDarah,
      alamat: alamat ?? this.alamat,
      nomorBpjs: nomorBpjs ?? this.nomorBpjs,
      statusKeluargaSejahtera:
          statusKeluargaSejahtera ?? this.statusKeluargaSejahtera,
      nomorHandphoneAlternatif:
          nomorHandphoneAlternatif ?? this.nomorHandphoneAlternatif,
      catatan: catatan ?? this.catatan,
    );
  }

  MotherRequest motherToMotherRequest(MotherN mother) {
    final motherReq = MotherRequest();
    motherReq.atribut = MotherAtrForRequest();
    motherReq.title = mother.title;
    motherReq.atribut.namaSuami.content = mother.namaSuami;
    motherReq.atribut.nik.content = mother.nik;
    motherReq.atribut.tanggalLahir.content = mother.tanggalLahir;
    motherReq.atribut.nomorHandphone.content = mother.nomorHandphone;
    motherReq.atribut.golonganDarah.content = mother.golonganDarah;
    motherReq.atribut.alamat.content = mother.alamat;

    return motherReq;
  }
}

@JsonSerializable(explicitToJson: true)
class MotherRequest extends Equatable {
  String title;
  String content;
  MotherAtrForRequest atribut;

  MotherRequest({this.title, this.content, this.atribut});

  Map<String, dynamic> toJson() => _$MotherRequestToJson(this);

  @override
  List<Object> get props {
    return <Object>[this.title, this.content, this.atribut];
  }
}

@JsonSerializable()
class MotherAtrForRequest extends Equatable {
  @JsonKey(name: "nik")
  DataRequest nik;
  @JsonKey(name: "nama_suami")
  DataRequest namaSuami;
  @JsonKey(name: "nik_suami")
  DataRequest nikSuami;
  @JsonKey(name: "tanggal_lahir")
  DataRequest tanggalLahir;
  @JsonKey(name: "nomor_handphone")
  DataRequest nomorHandphone;
  @JsonKey(name: "golongan_darah")
  DataRequest golonganDarah;
  @JsonKey(name: "alamat")
  DataRequest alamat;

  MotherAtrForRequest({
    DataRequest nik,
    DataRequest namaSuami,
    DataRequest nikSuami,
    DataRequest tanggalLahir,
    DataRequest nomorHandphone,
    DataRequest golonganDarah,
    DataRequest alamat,
  })  : this.nik = nik ?? DataRequest(),
        this.namaSuami = nik ?? DataRequest(),
        this.nikSuami = nik ?? DataRequest(),
        this.tanggalLahir = nik ?? DataRequest(),
        this.nomorHandphone = nik ?? DataRequest(),
        this.golonganDarah = nik ?? DataRequest(),
        this.alamat = nik ?? DataRequest();

  Map<String, dynamic> toJson() => _$MotherAtrForRequestToJson(this);

  @override
  // TODO: implement props
  List<Object> get props {
    return <Object>[
      this.nik,
      this.namaSuami,
      this.nikSuami,
      this.tanggalLahir,
      this.nomorHandphone,
      this.golonganDarah,
      this.alamat,
    ];
  }
}

@JsonSerializable()
class DataRequest extends Equatable {
  DataRequest({
    this.content,
    this.caption,
  });

  String content;
  String caption;
  Map<String, dynamic> toJson() => _$DataRequestToJson(this);

  @override
  // TODO: implement props
  List<Object> get props {
    return <Object>[
      this.content,
      this.caption,
    ];
  }
}

@JsonSerializable(explicitToJson: false)
class ResponseMother extends Equatable {
  @JsonKey(name: 'data')
  final List<MotherForResponse> motherList;
  final mothers = List<MotherN>();
  ResponseMother({this.motherList});

  factory ResponseMother.fromJson(json) => _$ResponseMotherFromJson(json);

  List<MotherN> mapToMothers() {
    for (var item in motherList) {
      MotherN mother = MotherN();
      mother = mother.copyWith(id: item.id);
      mother = mother.copyWith(title: item.title);
      mother = mother.copyWith(slug: item.slug);
      mother = mother.copyWith(content: item.content);
      mother = mother.copyWith(createdAt: item.createdAt);
      mother = mother.copyWith(status: item.status);
      mother = mother.copyWith(posyandu: item.atribut.posyandu.content);
      mother = mother.copyWith(nik: item.atribut.nik.content);
      mother = mother.copyWith(namaSuami: item.atribut.namaSuami.content);
      mother = mother.copyWith(nikSuami: item.atribut.nikSuami.content);
      mother = mother.copyWith(tanggalLahir: item.atribut.tanggalLahir.content);
      mother = mother.copyWith(tempatLahir: item.atribut.tempatLahir.content);
      mother =
          mother.copyWith(nomorHandphone: item.atribut.nomorHandphone.content);
      mother =
          mother.copyWith(golonganDarah: item.atribut.golonganDarah.content);
      mother = mother.copyWith(alamat: item.atribut.alamat.content);
      mother = mother.copyWith(nomorBpjs: item.atribut.nomorBpjs.content);
      mother = mother.copyWith(
          statusKeluargaSejahtera:
              item.atribut.statusKeluargaSejahtera.content);
      mother = mother.copyWith(
          nomorHandphoneAlternatif:
              item.atribut.nomorHandphoneAlternatif.content);
      mother = mother.copyWith(catatan: item.atribut.catatan.content);
      mothers.add(mother);
    }
    return mothers;
  }

  @override
  // TODO: implement props
  List<Object> get props => <Object>[this.motherList];
}

@JsonSerializable()
class MotherForResponse extends Equatable {
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
  final AtributForResponse atribut;
  MotherForResponse({
    String id,
    String title,
    String slug,
    String content,
    String createdAt,
    String status,
    AtributForResponse atribut,
  })  : this.id = id ?? "",
        this.title = title ?? "",
        this.slug = slug ?? "",
        this.status = status ?? "",
        this.content = content ?? "",
        this.createdAt = createdAt ?? "",
        this.atribut = atribut ?? AtributForResponse();

  MotherForResponse copyWith({
    String id,
    String title,
    String slug,
    String content,
    String createdAt,
    String status,
    AtributForResponse atribut,
  }) {
    return MotherForResponse(
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

  factory MotherForResponse.fromJson(Map<String, dynamic> json) =>
      _$MotherForResponseFromJson(json);
  Map<String, dynamic> toJson() => _$MotherForResponseToJson(this);
}

@JsonSerializable(explicitToJson: true)
class AtributForResponse extends Equatable {
  @JsonKey(name: 'posyandu')
  final DataAtribut posyandu;
  @JsonKey(name: 'nik')
  final DataAtribut nik;
  @JsonKey(name: 'nama_suami')
  final DataAtribut namaSuami;
  @JsonKey(name: 'nik_suami')
  final DataAtribut nikSuami;
  @JsonKey(name: 'tanggal_lahir')
  final DataAtribut tanggalLahir;
  @JsonKey(name: 'tempat_lahir')
  final DataAtribut tempatLahir;
  @JsonKey(name: 'nomor_handphone')
  final DataAtribut nomorHandphone;
  @JsonKey(name: 'golongan_darah')
  final DataAtribut golonganDarah;
  @JsonKey(name: 'alamat')
  final DataAtribut alamat;
  @JsonKey(name: 'nomor_bpjs')
  final DataAtribut nomorBpjs;
  @JsonKey(name: 'status_keluarga_sejahtera')
  final DataAtribut statusKeluargaSejahtera;
  @JsonKey(name: 'status_keluarga_sejahtera(alternatif)')
  final DataAtribut nomorHandphoneAlternatif;
  @JsonKey(name: 'catatan')
  final DataAtribut catatan;

  AtributForResponse(
      {DataAtribut posyandu,
      DataAtribut nik,
      DataAtribut namaSuami,
      DataAtribut nikSuami,
      DataAtribut tanggalLahir,
      DataAtribut tempatLahir,
      DataAtribut nomorHandphone,
      DataAtribut golonganDarah,
      DataAtribut alamat,
      DataAtribut nomorBpjs,
      DataAtribut statusKeluargaSejahtera,
      DataAtribut nomorHandphoneAlternatif,
      DataAtribut catatan})
      : this.posyandu = posyandu ?? DataAtribut(),
        this.nik = nik ?? DataAtribut(),
        this.namaSuami = namaSuami ?? DataAtribut(),
        this.nikSuami = nikSuami ?? DataAtribut(),
        this.tanggalLahir = tanggalLahir ?? DataAtribut(),
        this.tempatLahir = tempatLahir ?? DataAtribut(),
        this.nomorHandphone = nomorHandphone ?? DataAtribut(),
        this.alamat = alamat ?? DataAtribut(),
        this.nomorBpjs = nomorBpjs ?? DataAtribut(),
        this.golonganDarah = golonganDarah ?? DataAtribut(),
        this.statusKeluargaSejahtera = statusKeluargaSejahtera ?? DataAtribut(),
        this.nomorHandphoneAlternatif =
            nomorHandphoneAlternatif ?? DataAtribut(),
        this.catatan = catatan ?? DataAtribut();
  factory AtributForResponse.fromJson(Map<String, dynamic> json) =>
      _$AtributForResponseFromJson(json);

  @override
  List<Object> get props {
    return [
      this.posyandu,
      this.nik,
      this.namaSuami,
      this.nikSuami,
      this.tanggalLahir,
      this.tempatLahir,
      this.nomorHandphone,
      this.golonganDarah,
      this.alamat,
      this.nomorBpjs,
      this.statusKeluargaSejahtera,
      this.nomorHandphoneAlternatif,
      this.catatan
    ];
  }
}

@JsonSerializable(explicitToJson: false)
class DataAtribut extends Equatable {
  final String id;
  final String slug;
  final String title;
  final String content;
  final List<Data> data;

  DataAtribut({
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

  factory DataAtribut.fromJson(Map<String, dynamic> json) =>
      _$DataAtributFromJson(json);

  @override
  List<Object> get props {
    return <Object>[
      this.id,
      this.slug,
      this.title,
      this.content,
      this.data,
    ];
  }
}

@JsonSerializable(explicitToJson: false)
class Data extends Equatable {
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

  @override
  // TODO: implement props
  List<Object> get props {
    return <Object>[
      this.id,
      this.content,
      this.caption,
      this.dataType,
    ];
  }
}
