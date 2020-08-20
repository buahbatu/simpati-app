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

  final String umurDalamHari;
  final String beratBadan;
  final String diameterKepala;
  final String statusGiziBbU;
  final String statusGiziTbU;
  final String statusGiziBbTb;
  final String zScoreBbU;
  final String zScoreTbU;
  final String zScoreBbTb;
  final String vitaminA;
  final String asiBulan1;
  final String asiBulan2;
  final String asiBulan3;
  final String asiBulan4;
  final String asiBulan5;
  final String asiBulan6;
  final String pemberianKe;
  final String sumberPmt;
  final String pemberianPusat;
  final String tahunProduksi;
  final String pemberianDaerah;

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
    final String umurDalamHari,
    final String beratBadan,
    final String diameterKepala,
    final String statusGiziBbU,
    final String statusGiziTbU,
    final String statusGiziBbTb,
    final String zScoreBbU,
    final String zScoreTbU,
    final String zScoreBbTb,
    final String vitaminA,
    final String asiBulan1,
    final String asiBulan2,
    final String asiBulan3,
    final String asiBulan4,
    final String asiBulan5,
    final String asiBulan6,
    final String pemberianKe,
    final String sumberPmt,
    final String pemberianPusat,
    final String tahunProduksi,
    final String pemberianDaerah,
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
        this.umurDalamHari = umurDalamHari ?? "",
        this.beratBadan = beratBadan ?? "",
        this.panjangBadan = panjangBadan ?? "",
        this.diameterKepala = diameterKepala ?? "",
        this.statusGiziBbU = statusGiziBbU ?? "",
        this.statusGiziTbU = statusGiziTbU ?? "",
        this.statusGiziBbTb = statusGiziBbTb ?? "",
        this.zScoreBbU = zScoreBbU ?? "",
        this.zScoreTbU = zScoreTbU ?? "",
        this.zScoreBbTb = zScoreBbTb ?? "",
        this.vitaminA = vitaminA ?? "",
        this.asiBulan1 = asiBulan1 ?? "",
        this.asiBulan2 = asiBulan2 ?? "",
        this.asiBulan3 = asiBulan3 ?? "",
        this.asiBulan4 = asiBulan4 ?? "",
        this.asiBulan5 = asiBulan5 ?? "",
        this.asiBulan6 = asiBulan6 ?? "",
        this.pemberianKe = pemberianKe ?? "",
        this.sumberPmt = sumberPmt ?? "",
        this.pemberianPusat = pemberianPusat ?? "",
        this.tahunProduksi = tahunProduksi ?? "",
        this.pemberianDaerah = pemberianDaerah ?? "";
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
        this.umurDalamHari,
        this.beratBadan,
        this.panjangBadan,
        this.diameterKepala,
        this.statusGiziBbU,
        this.statusGiziTbU,
        this.statusGiziBbTb,
        this.zScoreBbU,
        this.zScoreTbU,
        this.zScoreBbTb,
        this.vitaminA,
        this.asiBulan1,
        this.asiBulan2,
        this.asiBulan3,
        this.asiBulan4,
        this.asiBulan5,
        this.asiBulan6,
        this.pemberianKe,
        this.sumberPmt,
        this.pemberianPusat,
        this.tahunProduksi,
        this.pemberianDaerah,
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
    String umurDalamHari,
    String beratBadan,
    String diameterKepala,
    String statusGiziBbU,
    String statusGiziTbU,
    String statusGiziBbTb,
    String zScoreBbU,
    String zScoreTbU,
    String zScoreBbTb,
    String vitaminA,
    String asiBulan1,
    String asiBulan2,
    String asiBulan3,
    String asiBulan4,
    String asiBulan5,
    String asiBulan6,
    String pemberianKe,
    String sumberPmt,
    String pemberianPusat,
    String tahunProduksi,
    String pemberianDaerah,
  }) {
    return ChildMedicalCheckup(
      id: id ?? this.id,
      title: title ?? this.title,
      slug: slug ?? this.slug,
      content: content ?? this.content,
      createdAt: createdAt ?? this.createdAt,
      status: status ?? this.status,
      tanggalCek: tanggalCek ?? this.tanggalCek,
      metodePengukuran: metodePengukuran ?? this.metodePengukuran,
      posyandu: posyandu ?? this.posyandu,
      anak: anak ?? this.anak,
      panjangBadan: panjangBadan ?? this.panjangBadan,
      umurDalamHari: umurDalamHari ?? this.umurDalamHari,
      beratBadan: beratBadan ?? this.beratBadan,
      diameterKepala: diameterKepala ?? this.diameterKepala,
      statusGiziBbU: statusGiziBbU ?? this.statusGiziBbU,
      statusGiziTbU: statusGiziTbU ?? this.statusGiziTbU,
      statusGiziBbTb: statusGiziBbTb ?? this.statusGiziBbTb,
      zScoreBbU: zScoreBbU ?? this.zScoreBbU,
      zScoreTbU: zScoreTbU ?? this.zScoreTbU,
      zScoreBbTb: zScoreBbTb ?? this.zScoreBbTb,
      vitaminA: vitaminA ?? this.vitaminA,
      asiBulan1: asiBulan1 ?? this.asiBulan1,
      asiBulan2: asiBulan2 ?? this.asiBulan2,
      asiBulan3: asiBulan3 ?? this.asiBulan3,
      asiBulan4: asiBulan4 ?? this.asiBulan4,
      asiBulan5: asiBulan5 ?? this.asiBulan5,
      asiBulan6: asiBulan6 ?? this.asiBulan6,
      pemberianKe: pemberianKe ?? this.pemberianKe,
      sumberPmt: sumberPmt ?? this.sumberPmt,
      pemberianPusat: pemberianPusat ?? this.pemberianPusat,
      tahunProduksi: tahunProduksi ?? this.tahunProduksi,
      pemberianDaerah: pemberianDaerah ?? this.pemberianDaerah,
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
    medCheckReq.atribut.umurDalamHari.content = child.umurDalamHari;
    medCheckReq.atribut.diameterKepala.content = child.diameterKepala;

    medCheckReq.atribut.vitaminA.content = child.vitaminA;
    medCheckReq.atribut.asi1.content = child.asiBulan1;
    medCheckReq.atribut.asi2.content = child.asiBulan2;
    medCheckReq.atribut.asi3.content = child.asiBulan3;
    medCheckReq.atribut.asi4.content = child.asiBulan4;
    medCheckReq.atribut.asi5.content = child.asiBulan5;
    medCheckReq.atribut.asi6.content = child.asiBulan6;
    medCheckReq.atribut.pemberianKe.content = child.pemberianKe;
    medCheckReq.atribut.pemberianPusat.content = child.pemberianPusat;
    medCheckReq.atribut.tahunProduksi.content = child.tahunProduksi;
    medCheckReq.atribut.pemberianDaerah.content = child.pemberianDaerah;
    medCheckReq.atribut.sumberPmt.content = child.sumberPmt;

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
        umurDalamHari: getContentOrElse(item.atribut.umurDalamHari),
        panjangBadan: getContentOrElse(item.atribut.panjangBadan),
        beratBadan: getContentOrElse(item.atribut.beratBadan),
        diameterKepala: getContentOrElse(item.atribut.diameterKepala),
        statusGiziBbU: getContentOrElse(item.atribut.statusGiziBbU),
        statusGiziTbU: getContentOrElse(item.atribut.statusGiziTbU),
        statusGiziBbTb: getContentOrElse(item.atribut.statusGiziBbTb),
        zScoreBbU: getContentOrElse(item.atribut.zScoreBbU),
        zScoreTbU: getContentOrElse(item.atribut.zScoreTbU),
        zScoreBbTb: getContentOrElse(item.atribut.zScoreBbTb),
        vitaminA: getContentOrElse(item.atribut.vitaminA),
        asiBulan1: getContentOrElse(item.atribut.asiBulan1),
        asiBulan2: getContentOrElse(item.atribut.asiBulan2),
        asiBulan3: getContentOrElse(item.atribut.asiBulan3),
        asiBulan4: getContentOrElse(item.atribut.asiBulan4),
        asiBulan5: getContentOrElse(item.atribut.asiBulan5),
        asiBulan6: getContentOrElse(item.atribut.asiBulan6),
        pemberianKe: getContentOrElse(item.atribut.pemberianKe),
        sumberPmt: getContentOrElse(item.atribut.sumberPmt),
        pemberianPusat: getContentOrElse(item.atribut.pemberianPusat),
        tahunProduksi: getContentOrElse(item.atribut.tahunProduksi),
        pemberianDaerah: getContentOrElse(item.atribut.pemberianDaerah),
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
  @JsonKey(name: "umur_dalam_hari")
  final DataAtribut umurDalamHari;
  @JsonKey(name: "berat_badan")
  final DataAtribut beratBadan;
  @JsonKey(name: "diameter_kepala")
  final DataAtribut diameterKepala;
  @JsonKey(name: "status_gizi_bb_u")
  DataAtribut statusGiziBbU;
  @JsonKey(name: "status_gizi_tb_u")
  DataAtribut statusGiziTbU;
  @JsonKey(name: "status_gizi_bb_tb")
  DataAtribut statusGiziBbTb;
  @JsonKey(name: "zscore_bb_u")
  DataAtribut zScoreBbU;
  @JsonKey(name: "zscore_tb_u")
  DataAtribut zScoreTbU;
  @JsonKey(name: "zscore_bb_tb")
  DataAtribut zScoreBbTb;
  @JsonKey(name: "vitamin_a")
  DataAtribut vitaminA;
  @JsonKey(name: "asi_bulan_1")
  DataAtribut asiBulan1;
  @JsonKey(name: "asi_bulan_2")
  DataAtribut asiBulan2;
  @JsonKey(name: "asi_bulan_3")
  DataAtribut asiBulan3;
  @JsonKey(name: "asi_bulan_4")
  DataAtribut asiBulan4;
  @JsonKey(name: "asi_bulan_5")
  DataAtribut asiBulan5;
  @JsonKey(name: "asi_bulan_6")
  DataAtribut asiBulan6;
  @JsonKey(name: "pemberian_ke")
  DataAtribut pemberianKe;
  @JsonKey(name: "sumber_pmt")
  DataAtribut sumberPmt;
  @JsonKey(name: "pemberian_pusat")
  DataAtribut pemberianPusat;
  @JsonKey(name: "tahun_produksi")
  DataAtribut tahunProduksi;
  @JsonKey(name: "pemberian_daerah")
  DataAtribut pemberianDaerah;
  AtributForResponse({
    DataAtribut tanggalCek,
    DataAtribut metodePengukuran,
    DataAtribut posyandu,
    DataAtribut anak,
    DataAtribut panjangBadan,
    DataAtribut umurDalamHari,
    DataAtribut beratBadan,
    DataAtribut diameterKepala,
  })  : this.tanggalCek = tanggalCek ?? DataAtribut(),
        this.metodePengukuran = metodePengukuran ?? DataAtribut(),
        this.posyandu = posyandu ?? DataAtribut(),
        this.anak = anak ?? DataAtribut(),
        this.panjangBadan = panjangBadan ?? DataAtribut(),
        this.umurDalamHari = umurDalamHari ?? DataAtribut(),
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
      this.umurDalamHari,
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
  @JsonKey(name: "umur_dalam_hari")
  final DataRequest umurDalamHari;
  @JsonKey(name: "diameter_kepala")
  final DataRequest diameterKepala;
  @JsonKey(name: "vitamin_a")
  final DataRequest vitaminA;
  @JsonKey(name: "asi_bulan_1")
  final DataRequest asi1;
  @JsonKey(name: "asi_bulan_2")
  final DataRequest asi2;
  @JsonKey(name: "asi_bulan_3")
  final DataRequest asi3;
  @JsonKey(name: "asi_bulan_4")
  final DataRequest asi4;
  @JsonKey(name: "asi_bulan_5")
  final DataRequest asi5;
  @JsonKey(name: "asi_bulan_6")
  final DataRequest asi6;
  @JsonKey(name: "pemberian_ke")
  final DataRequest pemberianKe;
  @JsonKey(name: "sumber_pmt")
  final DataRequest sumberPmt;
  @JsonKey(name: "pemberian_pusat")
  final DataRequest pemberianPusat;
  @JsonKey(name: "tahun_produksi")
  final DataRequest tahunProduksi;
  @JsonKey(name: "pemberian_daerah")
  final DataRequest pemberianDaerah;

  ChildMedicalCheckAtrForRequest({
    DataRequest anak,
    DataRequest tanggalCek,
    DataRequest metodeUkur,
    DataRequest panjangBadan,
    DataRequest beratBadan,
    DataRequest umurDalamHari,
    DataRequest diameterKepala,
    DataRequest vitaminA,
    DataRequest asi1,
    DataRequest asi2,
    DataRequest asi3,
    DataRequest asi4,
    DataRequest asi5,
    DataRequest asi6,
    DataRequest pemberianKe,
    DataRequest sumberPmt,
    DataRequest pemberianPusat,
    DataRequest tahunProduksi,
    DataRequest pemberianDaerah,
  })  : this.anak = anak ?? DataRequest(),
        this.tanggalCek = tanggalCek ?? DataRequest(),
        this.metodeUkur = metodeUkur ?? DataRequest(),
        this.panjangBadan = panjangBadan ?? DataRequest(),
        this.beratBadan = beratBadan ?? DataRequest(),
        this.umurDalamHari = umurDalamHari ?? DataRequest(),
        this.diameterKepala = diameterKepala ?? DataRequest(),
        this.vitaminA = vitaminA ?? DataRequest(),
        this.asi1 = asi1 ?? DataRequest(),
        this.asi2 = asi2 ?? DataRequest(),
        this.asi3 = asi3 ?? DataRequest(),
        this.asi4 = asi4 ?? DataRequest(),
        this.asi5 = asi5 ?? DataRequest(),
        this.asi6 = asi6 ?? DataRequest(),
        this.pemberianKe = pemberianKe ?? DataRequest(),
        this.sumberPmt = sumberPmt ?? DataRequest(),
        this.pemberianPusat = pemberianPusat ?? DataRequest(),
        this.tahunProduksi = tahunProduksi ?? DataRequest(),
        this.pemberianDaerah = pemberianDaerah ?? DataRequest();

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
