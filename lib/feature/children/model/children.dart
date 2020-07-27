import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'children.g.dart';

class Children extends Equatable {
  final String id;
  final String title;
  final String slug;
  final String content;
  final String createdAt;
  final String status;
  final String ibu;
  final String kehamilan;
  final String posyandu;
  final String nik;
  final String tempatLahir;
  final String tanggalLahir;
  final String nomorBpjs;
  final String note;
  final String jenisKelamin;
  final String golonganDarah;

  Children({
    final String id,
    final String title,
    final String slug,
    final String content,
    final String createdAt,
    final String status,
    final String ibu,
    final String kehamilan,
    final String posyandu,
    final String nik,
    final String tempatLahir,
    final String tanggalLahir,
    final String nomorBpjs,
    final String note,
    final String jenisKelamin,
    final String golonganDarah,
  })  : this.id = id ?? "",
        this.title = title ?? "",
        this.slug = slug ?? "",
        this.status = status ?? "",
        this.content = content ?? "",
        this.posyandu = posyandu ?? "",
        this.createdAt = createdAt ?? "",
        this.kehamilan = kehamilan ?? "",
        this.jenisKelamin = jenisKelamin ?? "",
        this.nik = nik ?? "",
        this.ibu = ibu ?? "",
        this.tanggalLahir = tanggalLahir ?? "",
        this.tempatLahir = tempatLahir ?? "",
        this.nomorBpjs = nomorBpjs ?? "",
        this.golonganDarah = golonganDarah ?? "",
        this.note = note ?? "";

  @override
  // TODO: implement props
  List<Object> get props {
    return <Object>[
      this.id,
      this.title,
      this.slug,
      this.status,
      this.content,
      this.posyandu,
      this.createdAt,
      this.kehamilan,
      this.jenisKelamin,
      this.nik,
      this.ibu,
      this.tanggalLahir,
      this.tempatLahir,
      this.nomorBpjs,
      this.golonganDarah,
      this.note,
    ];
  }

  Children copyWith(
      {final String id,
      final String title,
      final String slug,
      final String content,
      final String createdAt,
      final String status,
      final String ibu,
      final String kehamilan,
      final String posyandu,
      final String nik,
      final String tempatLahir,
      final String tanggalLahir,
      final String nomorBpjs,
      final String note,
      final String jenisKelamin,
      final String golonganDarah}) {
    return Children(
        id: id ?? this.id,
        title: title ?? this.title,
        slug: slug ?? this.slug,
        status: status ?? this.status,
        content: content ?? this.content,
        posyandu: posyandu ?? this.posyandu,
        createdAt: createdAt ?? this.createdAt,
        kehamilan: kehamilan ?? this.kehamilan,
        jenisKelamin: jenisKelamin ?? this.jenisKelamin,
        nik: nik ?? this.nik,
        ibu: ibu ?? this.ibu,
        tanggalLahir: tanggalLahir ?? this.tanggalLahir,
        tempatLahir: tempatLahir ?? this.tempatLahir,
        nomorBpjs: nomorBpjs ?? this.nomorBpjs,
        golonganDarah: golonganDarah ?? this.golonganDarah,
        note: note ?? this.note);
  }
}

@JsonSerializable(explicitToJson: false)
class ResponseChildren extends Equatable {
  @JsonKey(name: 'data')
  final List<ChildrenForResponse> childrenList;
  final mothers = List<Children>();
  ResponseChildren({this.childrenList});

  factory ResponseChildren.fromJson(json) => _$ResponseChildrenFromJson(json);

  @override
  // TODO: implement props
  List<Object> get props => <Object>[this.childrenList];
}

@JsonSerializable()
class ChildrenForResponse extends Equatable {
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
  ChildrenForResponse({
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

  ChildrenForResponse copyWith({
    String id,
    String title,
    String slug,
    String content,
    String createdAt,
    String status,
    AtributForResponse atribut,
  }) {
    return ChildrenForResponse(
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

  factory ChildrenForResponse.fromJson(Map<String, dynamic> json) =>
      _$ChildrenForResponseFromJson(json);
  Map<String, dynamic> toJson() => _$ChildrenForResponseToJson(this);
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
  final String id;
  final String content;
  final String caption;
  final String dataType;

  Data({
    String id = "",
    String content = "",
    String caption = "",
    String dataType = "",
  })  : this.id = id ?? "",
        this.content = content ?? "",
        this.caption = caption ?? "",
        this.dataType = dataType ?? "";

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  @override
  List<Object> get props {
    return <Object>[
      this.id,
      this.content,
      this.caption,
      this.dataType,
    ];
  }
}
