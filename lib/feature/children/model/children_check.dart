import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:simpati/feature/children/model/children.dart';
import 'package:equatable/equatable.dart';

part 'children_check.g.dart';

class ChildMedicalCheckup extends Equatable {
  final String id;
  final String title;
  final String slug;
  final String content;
  final String createdAt;
  final String status;
  final String tanggalCek;
  final String metodePengukuran;
  final String posyandu;
  final String anak;
  final String panjangBadan;
  final String umurDalamBulan;
  final String beratBadan;
  final String diameterKepala;

  ChildMedicalCheckup({
    final String id,
    final String title,
    final String slug,
    final String content,
    final String createdAt,
    final String status,
    final String tanggalCek,
    final String metodePengukuran,
    final String posyandu,
    final String anak,
    final String panjangBadan,
    final String umurDalamBulan,
    final String beratBadan,
    final String diameterKepala,
  })  : this.id = id ?? "",
        this.title = title ?? "",
        this.slug = slug ?? "",
        this.status = status ?? "",
        this.content = content ?? "",
        this.posyandu = posyandu ?? "",
        this.createdAt = createdAt ?? "",
        this.metodePengukuran = metodePengukuran ?? "",
        this.anak = anak ?? "",
        this.tanggalCek = tanggalCek ?? "",
        this.umurDalamBulan = umurDalamBulan ?? "",
        this.panjangBadan = panjangBadan ?? "",
        this.beratBadan = beratBadan ?? "",
        this.diameterKepala = diameterKepala ?? "";
  @override
  List<Object> get props => <Object>[
        this.id,
        this.title,
        this.slug,
        this.status,
        this.content,
        this.posyandu,
        this.createdAt,
        this.metodePengukuran,
        this.anak,
        this.tanggalCek,
        this.umurDalamBulan,
        this.panjangBadan,
        this.beratBadan,
        this.diameterKepala,
      ];

  ChildMedicalCheckup copyWith({
    String id,
    String title,
    String slug,
    String content,
    String createdAt,
    String status,
    String tanggalCek,
    String metodePengukuran,
    String posyandu,
    String anak,
    String panjangBadan,
    String umurDalamBulan,
    String beratBadan,
    String diameterKepala,
  }) {
    return ChildMedicalCheckup(
      id: id ?? this.id,
      title: title ?? this.title,
      slug: slug ?? this.slug,
      status: status ?? this.status,
      content: content ?? this.content,
      posyandu: posyandu ?? this.posyandu,
      createdAt: createdAt ?? this.createdAt,
      metodePengukuran: metodePengukuran ?? this.metodePengukuran,
      anak: anak ?? this.anak,
      tanggalCek: tanggalCek ?? this.tanggalCek,
      umurDalamBulan: umurDalamBulan ?? this.umurDalamBulan,
      panjangBadan: panjangBadan ?? this.panjangBadan,
      beratBadan: beratBadan ?? this.beratBadan,
      diameterKepala: diameterKepala ?? this.diameterKepala,
    );
  }

  ChildMedicalCheckRequest medChildRequest(ChildMedicalCheckup child) {
    final medCheckReq = ChildMedicalCheckRequest();
    medCheckReq.atribut = ChildMedicalCheckAtrForRequest();
    medCheckReq.title = child.title;
    medCheckReq.content = child.content;
    medCheckReq.atribut.anak.content = child.anak;
    medCheckReq.atribut.tanggalCek.content = child.tanggalCek;
    medCheckReq.atribut.metodeUkur.content = child.metodePengukuran;
    medCheckReq.atribut.panjangBadan.content = child.panjangBadan;
    medCheckReq.atribut.beratBadan.content = child.beratBadan;

    return medCheckReq;
  }
}

@JsonSerializable()
class CheckChildResponse extends Equatable {
  @JsonKey(name: "data")
  final List<CheckChildForResponse> checkChildList;
  final childMed = List<ChildMedicalCheckup>();
  CheckChildResponse({this.checkChildList});

  factory CheckChildResponse.fromJson(json) =>
      _$CheckChildResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CheckChildResponseToJson(this);

  @override
  List<Object> get props {
    return <Object>[this.checkChildList];
  }

  List<ChildMedicalCheckup> mapToChildCheck() {
    for (var item in checkChildList) {
      ChildMedicalCheckup childMedCheck = ChildMedicalCheckup();
      childMedCheck = childMedCheck.copyWith(
        id: item.id,
        title: item.title,
        slug: item.slug,
        status: item.status,
        content: item.content,
        posyandu: getContentOrElse(item.atribut.posyandu),
        createdAt: item.createdAt ?? "",
        metodePengukuran: getContentOrElse(item.atribut.metodePengukuran),
        anak: getContentOrElse(item.atribut.anak),
        tanggalCek: getContentOrElse(item.atribut.tanggalCek),
        umurDalamBulan: getContentOrElse(item.atribut.umurDalamBulan),
        panjangBadan: getContentOrElse(item.atribut.panjangBadan),
        beratBadan: getContentOrElse(item.atribut.beratBadan),
        diameterKepala: getContentOrElse(item.atribut.diameterKepala),
      );
      childMed.add(childMedCheck);
    }
    return childMed;
  }

  String getContentOrElse(DataAtribut atribut, [String defaultValue = ""]) {
    if (atribut.data.isEmpty) {
      return defaultValue;
    }
    return atribut.data.first.content;
  }
}

@JsonSerializable()
class CheckChildForResponse extends Equatable {
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
  CheckChildForResponse({
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

  factory CheckChildForResponse.fromJson(json) =>
      _$CheckChildForResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CheckChildForResponseToJson(this);

  CheckChildForResponse copyWith({
    String id,
    String title,
    String slug,
    String content,
    String createdAt,
    String status,
    AtributForResponse atribut,
  }) {
    return CheckChildForResponse(
        id: id ?? this.id,
        title: title ?? this.title,
        slug: slug ?? this.slug,
        status: status ?? this.status,
        content: content ?? this.content,
        createdAt: createdAt ?? this.createdAt,
        atribut: atribut ?? this.atribut);
  }

  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();
}

@JsonSerializable(explicitToJson: true)
class AtributForResponse extends Equatable {
  @JsonKey(name: "tanggal_cek")
  final DataAtribut tanggalCek;
  @JsonKey(name: "metode_pengukuran")
  final DataAtribut metodePengukuran;
  @JsonKey(name: "posyandu")
  final DataAtribut posyandu;
  @JsonKey(name: "anak")
  final DataAtribut anak;
  @JsonKey(name: "panjang_badan")
  final DataAtribut panjangBadan;
  @JsonKey(name: "umur_(dalam_bulan)")
  final DataAtribut umurDalamBulan;
  @JsonKey(name: "berat_badan")
  final DataAtribut beratBadan;
  @JsonKey(name: "diameter_kepala")
  final DataAtribut diameterKepala;

  AtributForResponse({
    DataAtribut tanggalCek,
    DataAtribut metodePengukuran,
    DataAtribut posyandu,
    DataAtribut anak,
    DataAtribut panjangBadan,
    DataAtribut umurDalamBulan,
    DataAtribut beratBadan,
    DataAtribut diameterKepala,
  })  : this.tanggalCek = tanggalCek ?? DataAtribut(),
        this.metodePengukuran = metodePengukuran ?? DataAtribut(),
        this.posyandu = posyandu ?? DataAtribut(),
        this.anak = anak ?? DataAtribut(),
        this.panjangBadan = panjangBadan ?? DataAtribut(),
        this.umurDalamBulan = umurDalamBulan ?? DataAtribut(),
        this.beratBadan = beratBadan ?? DataAtribut(),
        this.diameterKepala = diameterKepala ?? DataAtribut();

  factory AtributForResponse.fromJson(Map<String, dynamic> json) =>
      _$AtributForResponseFromJson(json);
  Map<String, dynamic> toJson() => _$AtributForResponseToJson(this);

  @override
  List<Object> get props {
    return [
      this.tanggalCek,
      this.metodePengukuran,
      this.posyandu,
      this.anak,
      this.panjangBadan,
      this.umurDalamBulan,
      this.beratBadan,
      this.diameterKepala,
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
class ChildMedicalCheckRequest extends Equatable {
  String title;
  String content;
  ChildMedicalCheckAtrForRequest atribut;

  ChildMedicalCheckRequest({this.title, this.content, this.atribut});

  Map<String, dynamic> toJson() => _$ChildMedicalCheckRequestToJson(this);

  @override
  List<Object> get props {
    return <Object>[this.title, this.content, this.atribut];
  }
}

@JsonSerializable()
class ChildMedicalCheckAtrForRequest extends Equatable {
  @JsonKey(name: "anak")
  final DataRequest anak;
  @JsonKey(name: "tanggal_cek")
  final DataRequest tanggalCek;
  @JsonKey(name: "metode_pengukuran")
  final DataRequest metodeUkur;
  @JsonKey(name: "panjang_badan")
  final DataRequest panjangBadan;
  @JsonKey(name: "berat_badan")
  final DataRequest beratBadan;

  ChildMedicalCheckAtrForRequest({
    DataRequest anak,
    DataRequest tanggalCek,
    DataRequest metodeUkur,
    DataRequest panjangBadan,
    DataRequest beratBadan,
  })  : this.anak = anak ?? DataRequest(),
        this.tanggalCek = tanggalCek ?? DataRequest(),
        this.metodeUkur = metodeUkur ?? DataRequest(),
        this.panjangBadan = panjangBadan ?? DataRequest(),
        this.beratBadan = beratBadan ?? DataRequest();

  Map<String, dynamic> toJson() => _$ChildMedicalCheckAtrForRequestToJson(this);

  factory ChildMedicalCheckAtrForRequest.fromJson(Map<String, dynamic> json) =>
      _$ChildMedicalCheckAtrForRequestFromJson(json);

  @override
  // TODO: implement props
  List<Object> get props {
    return <Object>[
      this.anak,
      this.tanggalCek,
      this.metodeUkur,
      this.panjangBadan,
      this.beratBadan,
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
