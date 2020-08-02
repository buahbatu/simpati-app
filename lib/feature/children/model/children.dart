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

  final String anakKe;
  final String nomorKK;
  final String beratLahir;
  final String tinggi;
  final String kia;
  final String imd;
  final String nikIbu;
  final String hpIbu;
  final String namaAnak;
  final String alamat;
  final String rt;
  final String rw;

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
    final String anakKe,
    final String status,
    final String ibu,
    final String namaAnak,
    final String kehamilan,
    final String nomorKK,
    final String beratLahir,
    final String tinggi,
    final String kia,
    final String imd,
    final String nikIbu,
    final String hpIbu,
    final String alamat,
    final String posyandu,
    final String nik,
    final String tempatLahir,
    final String tanggalLahir,
    final String nomorBpjs,
    final String note,
    final String jenisKelamin,
    final String rt,
    final String rw,
    final String golonganDarah,
  })  : this.id = id ?? "",
        this.title = title ?? "",
        this.anakKe = anakKe ?? "",
        this.slug = slug ?? "",
        this.status = status ?? "",
        this.content = content ?? "",
        this.posyandu = posyandu ?? "",
        this.createdAt = createdAt ?? "",
        this.nomorKK = nomorKK ?? "",
        this.namaAnak = namaAnak ?? "",
        this.beratLahir = beratLahir ?? "",
        this.tinggi = tinggi ?? "",
        this.kia = kia ?? "",
        this.imd = imd ?? "",
        this.nikIbu = nikIbu ?? "",
        this.hpIbu = hpIbu ?? "",
        this.alamat = alamat ?? "",
        this.kehamilan = kehamilan ?? "",
        this.jenisKelamin = jenisKelamin ?? "",
        this.rt = rt ?? "",
        this.rw = rw ?? "",
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
      this.nomorKK,
      this.beratLahir,
      this.tinggi,
      this.kia,
      this.imd,
      this.nikIbu,
      this.hpIbu,
      this.alamat,
      this.jenisKelamin,
      this.anakKe,
      this.nik,
      this.ibu,
      this.tanggalLahir,
      this.tempatLahir,
      this.nomorBpjs,
      this.golonganDarah,
      this.note,
    ];
  }

  Children copyWith({
    final String id,
    final String title,
    final String slug,
    final String content,
    final String createdAt,
    final String anakKe,
    final String status,
    final String ibu,
    final String kehamilan,
    final String nomorKK,
    final String beratLahir,
    final String tinggi,
    final String kia,
    final String imd,
    final String nikIbu,
    final String hpIbu,
    final String alamat,
    final String posyandu,
    final String nik,
    final String tempatLahir,
    final String tanggalLahir,
    final String nomorBpjs,
    final String namaAnak,
    final String note,
    final String jenisKelamin,
    final String rt,
    final String rw,
    final String golonganDarah,
  }) {
    return Children(
      id: id ?? this.id,
      title: title ?? this.title,
      slug: slug ?? this.slug,
      content: content ?? this.content,
      createdAt: createdAt ?? this.createdAt,
      anakKe: anakKe ?? this.anakKe,
      status: status ?? this.status,
      namaAnak: namaAnak ?? this.namaAnak,
      ibu: ibu ?? this.ibu,
      kehamilan: kehamilan ?? this.kehamilan,
      nomorKK: nomorKK ?? this.nomorKK,
      beratLahir: beratLahir ?? this.beratLahir,
      tinggi: tinggi ?? this.tinggi,
      kia: kia ?? this.kia,
      imd: imd ?? this.imd,
      nikIbu: nikIbu ?? this.nikIbu,
      hpIbu: hpIbu ?? this.hpIbu,
      alamat: alamat ?? this.alamat,
      posyandu: posyandu ?? this.posyandu,
      nik: nik ?? this.nik,
      tempatLahir: tempatLahir ?? this.tempatLahir,
      tanggalLahir: tanggalLahir ?? this.tanggalLahir,
      nomorBpjs: nomorBpjs ?? this.nomorBpjs,
      note: note ?? this.note,
      jenisKelamin: jenisKelamin ?? this.jenisKelamin,
      rt: rt ?? this.rt,
      rw: rw ?? this.rw,
    );
  }

  ChildAddRequest toRequestBody() {
    final childAdd = ChildAddRequest();
    childAdd.atribut = ChildAddAtrForRequest();
    childAdd.title = this.namaAnak;
    childAdd.atribut.anakKe.content = this.anakKe;
    childAdd.atribut.nomorKK.content = this.nomorKK;
    childAdd.atribut.jenisKelamin.content = this.jenisKelamin;
    childAdd.atribut.nik.content = this.nik;
    childAdd.atribut.namaAnak.content = this.title;
    childAdd.atribut.tanggalLahir.content = this.tanggalLahir;
    childAdd.atribut.beratLahir.content = this.beratLahir;
    childAdd.atribut.tinggi.content = this.tinggi;
    childAdd.atribut.kia.content = this.kia;
    childAdd.atribut.imd.content = this.imd;
    childAdd.atribut.nikOrtu.content = this.nikIbu;
    //nik ibu required
    childAdd.atribut.ibu.content = this.nikIbu;
    childAdd.atribut.hpOrtu.content = this.hpIbu;
    childAdd.atribut.namaOrtu.content = this.ibu;
    childAdd.atribut.alamat.content = this.alamat;
    childAdd.atribut.rt.content = this.rt;
    childAdd.atribut.rw.content = this.rw;
    return childAdd;
  }
}

@JsonSerializable(explicitToJson: false)
class ResponseChildren extends Equatable {
  @JsonKey(name: 'data')
  final List<ChildrenForResponse> childrenList;
  final childrens = List<Children>();
  ResponseChildren({this.childrenList});

  factory ResponseChildren.fromJson(json) => _$ResponseChildrenFromJson(json);

  List<Children> mapToChildren() {
    for (var item in childrenList) {
      Children child = Children();
      child = child.copyWith(
          id: item.id,
          title: item.title,
          content: item.content,
          status: item.status,
          createdAt: item.createdAt,
          slug: item.slug,
          note: getContentOrElse(item.atribut.note),
          golonganDarah: getContentOrElse(item.atribut.golonganDarah),
          ibu: getContentOrElse(item.atribut.ibu),
          jenisKelamin: getContentOrElse(item.atribut.jenisKelamin),
          kehamilan: getContentOrElse(item.atribut.kehamilan),
          nik: getContentOrElse(item.atribut.nik),
          nomorBpjs: getContentOrElse(item.atribut.nomorBpjs),
          posyandu: getContentOrElse(item.atribut.posyandu),
          tanggalLahir: getContentOrElse(item.atribut.tanggalLahir),
          tempatLahir: getContentOrElse(item.atribut.tempatLahir));

      childrens.add(child);
    }
    return childrens;
  }

  Children mapToChild() {
    Children child = Children();
    ChildrenForResponse item = childrenList.first;
    child = child.copyWith(
        id: item.id,
        title: item.title,
        content: item.content,
        status: item.status,
        createdAt: item.createdAt,
        slug: item.slug,
        note: getContentOrElse(item.atribut.note),
        golonganDarah: getContentOrElse(item.atribut.golonganDarah),
        ibu: getContentOrElse(item.atribut.ibu),
        jenisKelamin: getContentOrElse(item.atribut.jenisKelamin),
        kehamilan: getContentOrElse(item.atribut.kehamilan),
        nik: getContentOrElse(item.atribut.nik),
        nomorBpjs: getContentOrElse(item.atribut.nomorBpjs),
        posyandu: getContentOrElse(item.atribut.posyandu),
        tanggalLahir: getContentOrElse(item.atribut.tanggalLahir),
        tempatLahir: getContentOrElse(item.atribut.tempatLahir));

    childrens.add(child);

    return child;
  }

  String getContentOrElse(DataAtribut atribut, [String defaultValue = ""]) {
    if (atribut.data.isEmpty) return defaultValue;
    return atribut.data.first.content;
  }

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
  @JsonKey(name: 'ibu')
  final DataAtribut ibu;
  @JsonKey(name: 'kehamilan')
  final DataAtribut kehamilan;
  @JsonKey(name: 'tanggal_lahir')
  final DataAtribut tanggalLahir;
  @JsonKey(name: 'tempat_lahir')
  final DataAtribut tempatLahir;
  @JsonKey(name: 'golongan_darah')
  final DataAtribut golonganDarah;
  @JsonKey(name: 'bpjs_number')
  final DataAtribut nomorBpjs;
  @JsonKey(name: 'jenis_kelamin')
  final DataAtribut jenisKelamin;
  @JsonKey(name: 'note')
  final DataAtribut note;

  AtributForResponse({
    DataAtribut posyandu,
    DataAtribut nik,
    DataAtribut ibu,
    DataAtribut kehamilan,
    DataAtribut tanggalLahir,
    DataAtribut tempatLahir,
    DataAtribut golonganDarah,
    DataAtribut nomorBpjs,
    DataAtribut jenisKelamin,
    DataAtribut note,
  })  : this.posyandu = posyandu ?? DataAtribut(),
        this.nik = nik ?? DataAtribut(),
        this.ibu = ibu ?? DataAtribut(),
        this.kehamilan = kehamilan ?? DataAtribut(),
        this.tanggalLahir = tanggalLahir ?? DataAtribut(),
        this.tempatLahir = tempatLahir ?? DataAtribut(),
        this.golonganDarah = golonganDarah ?? DataAtribut(),
        this.nomorBpjs = nomorBpjs ?? DataAtribut(),
        this.jenisKelamin = jenisKelamin ?? DataAtribut(),
        this.note = note ?? DataAtribut();

  factory AtributForResponse.fromJson(Map<String, dynamic> json) =>
      _$AtributForResponseFromJson(json);
  Map<String, dynamic> toJson() => _$AtributForResponseToJson(this);

  @override
  List<Object> get props {
    return [
      this.posyandu,
      this.nik,
      this.ibu,
      this.kehamilan,
      this.tanggalLahir,
      this.tempatLahir,
      this.golonganDarah,
      this.nomorBpjs,
      this.jenisKelamin,
      this.note,
    ];
  }
}

@JsonSerializable(explicitToJson: false)
class DataAtribut extends Equatable {
  @JsonKey(name: "ID")
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

  Map<String, dynamic> toJson() => _$DataAtributToJson(this);

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
  @JsonKey(name: "ID")
  final String id;
  final String content;
  final String caption;
  @JsonKey(name: "data_type")
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

@JsonSerializable(explicitToJson: true)
class ChildAddRequest extends Equatable {
  String title;
  String content;
  ChildAddAtrForRequest atribut;

  ChildAddRequest({this.title, this.content, this.atribut});

  Map<String, dynamic> toJson() => _$ChildAddRequestToJson(this);

  @override
  List<Object> get props {
    return <Object>[this.title, this.content, this.atribut];
  }
}

@JsonSerializable()
class ChildAddAtrForRequest extends Equatable {
  @JsonKey(name: "tanggal_lahir")
  final DataRequest tanggalLahir;
  @JsonKey(name: "anak_ke")
  final DataRequest anakKe;
  @JsonKey(name: "jenis_kelamin")
  final DataRequest jenisKelamin;
  @JsonKey(name: "nomor_KK")
  final DataRequest nomorKK;
  @JsonKey(name: "nik")
  final DataRequest nik;
  @JsonKey(name: "nama_anak")
  final DataRequest namaAnak;

  @JsonKey(name: "berat_lahir")
  final DataRequest beratLahir;
  @JsonKey(name: "tinggi")
  final DataRequest tinggi;
  @JsonKey(name: "kia")
  final DataRequest kia;
  @JsonKey(name: "imd")
  final DataRequest imd;
  @JsonKey(name: "nama_ortu")
  final DataRequest namaOrtu;
  @JsonKey(name: "ibu")
  final DataRequest ibu;

  @JsonKey(name: "nik_ortu")
  final DataRequest nikOrtu;
  @JsonKey(name: "hp_ortu")
  final DataRequest hpOrtu;
  @JsonKey(name: "alamat")
  final DataRequest alamat;
  @JsonKey(name: "rt")
  final DataRequest rt;
  @JsonKey(name: "rw")
  final DataRequest rw;

  ChildAddAtrForRequest({
    DataRequest tanggalLahir,
    DataRequest anakKe,
    DataRequest jenisKelamin,
    DataRequest nomorKK,
    DataRequest nik,
    DataRequest namaAnak,
    DataRequest beratLahir,
    DataRequest tinggi,
    DataRequest kia,
    DataRequest ibu,
    DataRequest imd,
    DataRequest namaOrtu,
    DataRequest nikOrtu,
    DataRequest hpOrtu,
    DataRequest alamat,
    DataRequest rt,
    DataRequest rw,
  })  : this.tanggalLahir = tanggalLahir ?? DataRequest(),
        this.jenisKelamin = jenisKelamin ?? DataRequest(),
        this.anakKe = anakKe ?? DataRequest(),
        this.nomorKK = nomorKK ?? DataRequest(),
        this.nik = nik ?? DataRequest(),
        this.ibu = ibu ?? DataRequest(),
        this.namaAnak = namaAnak ?? DataRequest(),
        this.beratLahir = beratLahir ?? DataRequest(),
        this.tinggi = tinggi ?? DataRequest(),
        this.kia = kia ?? DataRequest(),
        this.imd = imd ?? DataRequest(),
        this.namaOrtu = namaOrtu ?? DataRequest(),
        this.nikOrtu = nikOrtu ?? DataRequest(),
        this.hpOrtu = hpOrtu ?? DataRequest(),
        this.alamat = alamat ?? DataRequest(),
        this.rt = rt ?? DataRequest(),
        this.rw = rw ?? DataRequest();

  Map<String, dynamic> toJson() => _$ChildAddAtrForRequestToJson(this);

  factory ChildAddAtrForRequest.fromJson(Map<String, dynamic> json) =>
      _$ChildAddAtrForRequestFromJson(json);

  @override
  // TODO: implement props
  List<Object> get props {
    return <Object>[
      this.tanggalLahir,
      this.jenisKelamin,
      this.nomorKK,
      this.nik,
      this.namaAnak,
      this.beratLahir,
      this.tinggi,
      this.kia,
      this.imd,
      this.namaOrtu,
      this.nikOrtu,
      this.hpOrtu,
      this.alamat,
      this.rt,
      this.rw,
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
  factory DataRequest.fromJson(Map<String, dynamic> json) =>
      _$DataRequestFromJson(json);

  @override
  // TODO: implement props
  List<Object> get props {
    return <Object>[
      this.content,
      this.caption,
    ];
  }
}
