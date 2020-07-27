import 'package:equatable/equatable.dart';
import 'package:intl/intl.dart';
import 'package:json_annotation/json_annotation.dart';

import 'package:simpati/core/result/base_data.dart';
import 'package:simpati/core/tools/data_parser_factory.dart';
import 'package:simpati/feature/mother/model/mother.dart';

part 'pregnancy.g.dart';

class Pregnancy extends Equatable {
  final String nik;
  final String title;
  final String tanggalLahir;
  final String namaSuami;
  final String id;
  final String lastMenstruation;
  final MenstruationCycle menstruationCycle;
  final double weight;
  final double height;
  final String bloodPressure;

  Pregnancy({
    this.title,
    this.nik,
    this.tanggalLahir,
    this.namaSuami,
    this.id,
    this.lastMenstruation,
    this.menstruationCycle,
    this.weight,
    this.height,
    this.bloodPressure,
  });

  Pregnancy copyWith({
    String title,
    String nik,
    String tanggalLahir,
    String namaSuami,
    String id,
    DateTime lastMenstruation,
    MenstruationCycle menstruationCycle,
    double weight,
    double height,
    String bloodPressure,
  }) {
    return Pregnancy(
      id: id ?? this.id,
      lastMenstruation: lastMenstruation ?? this.lastMenstruation,
      menstruationCycle: menstruationCycle ?? this.menstruationCycle,
      weight: weight ?? this.weight,
      height: height ?? this.height,
      bloodPressure: bloodPressure ?? this.bloodPressure,
    );
  }

  PregnancyRequest pregnancyToMotherRequest(Pregnancy pregnancy) {
    final pregnancyReq = PregnancyRequest();
    pregnancyReq.atribut = PregnancyAtrForRequest();
    pregnancyReq.title = pregnancy.title;
    pregnancyReq.atribut.namaSuami.content = pregnancy.namaSuami;
    pregnancyReq.atribut.nik.content = pregnancy.nik;
    pregnancyReq.atribut.tanggalLahir.content = pregnancy.tanggalLahir;
    pregnancyReq.atribut.lastMenstruation.content = pregnancy.lastMenstruation;
    pregnancyReq.atribut.bloodPressure.content = pregnancy.bloodPressure;
    pregnancyReq.atribut.menstruationCycle.content =
        pregnancy.menstruationCycle.title;

    return pregnancyReq;
  }

  @override
  List<Object> get props => [
        this.id,
        this.lastMenstruation,
        this.menstruationCycle,
        this.weight,
        this.height,
        this.bloodPressure,
      ];

  @override
  Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'lastMenstruation': this.lastMenstruation,
      'menstruationCycle': this.menstruationCycle.key,
      'weight': this.weight,
      'height': this.height,
      'bloodPressure': this.bloodPressure,
    };
  }
}

class MenstruationCycle {
  final String key;
  final String title;

  MenstruationCycle(this.key, this.title);

  factory MenstruationCycle.parseKey(String key) {
    switch (key) {
      case 'short':
        return short;
      case 'regular':
        return regular;
      case 'long':
        return long;
      default:
        throw ArgumentError('Unknown key for menstruation');
    }
  }

  factory MenstruationCycle.parse(String title) {
    switch (title) {
      case 'Pendek (<28 Hari)':
        return short;
      case 'Normal (28-30 Hari)':
        return regular;
      case 'Panjang (>30 Hari)':
        return long;
      default:
        throw ArgumentError('Unknown key for menstruation');
    }
  }

  static MenstruationCycle short = MenstruationCycle(
    'short',
    'Pendek (<28 Hari)',
  );

  static MenstruationCycle regular = MenstruationCycle(
    'regular',
    'Normal (28-30 Hari)',
  );

  static MenstruationCycle long = MenstruationCycle(
    'long',
    'Panjang (>30 Hari)',
  );
}

class PregnancyList extends Equatable {
  final List<Pregnancy> pregnancy;

  PregnancyList(this.pregnancy);

  @override
  List<Object> get props => pregnancy;

  @override
  Map<String, dynamic> toMap() {
    return {pregnancyKey: pregnancy.map((e) => e.toMap()).toList()};
  }

  static PregnancyList fromMap(Map<dynamic, dynamic> map) {
    final articleRawList = map[pregnancyKey] as List;
    final list = articleRawList
        .map((e) => DataParserFactory.get().decode<Pregnancy>(e))
        .toList();
    return PregnancyList(list);
  }

  static const String pregnancyKey = 'pregnancy';
}

@JsonSerializable()
class PregnancyRequest extends Equatable {
  String title;
  String content;
  PregnancyAtrForRequest atribut;

  PregnancyRequest({
    this.title,
    this.content,
    this.atribut,
  });

  Map<String, dynamic> toJson() => _$PregnancyRequestToJson(this);

  @override
  List<Object> get props {
    return <Object>[this.title, this.content, this.atribut];
  }
}

@JsonSerializable()
class PregnancyAtrForRequest extends Equatable {
  @JsonKey(name: "title")
  final DataRequest title;
  @JsonKey(name: "nik")
  final DataRequest nik;
  @JsonKey(name: "nama_suami")
  final DataRequest namaSuami;
  @JsonKey(name: "tanggal_lahir")
  final DataRequest tanggalLahir;
  @JsonKey(name: "terakhir_mensturasi")
  final DataRequest lastMenstruation;
  @JsonKey(name: "siklus_menstruasi")
  final DataRequest menstruationCycle;
  @JsonKey(name: "berat")
  final DataRequest weight;
  @JsonKey(name: "tinggi")
  final DataRequest height;
  @JsonKey(name: "tekanan_darah")
  final DataRequest bloodPressure;

  PregnancyAtrForRequest(
      {String title,
      DataRequest nik,
      DataRequest namaSuami,
      DataRequest tanggalLahir,
      DataRequest lastMenstruation,
      DataRequest menstruationCycle,
      DataRequest weight,
      DataRequest height,
      DataRequest bloodPressure})
      : this.title = title ?? DataRequest(),
        this.nik = nik ?? DataRequest(),
        this.namaSuami = nik ?? DataRequest(),
        this.tanggalLahir = nik ?? DataRequest(),
        this.lastMenstruation = lastMenstruation ?? DataRequest(),
        this.menstruationCycle = menstruationCycle ?? DataRequest(),
        this.weight = weight ?? DataRequest(),
        this.height = height ?? DataRequest(),
        this.bloodPressure = bloodPressure ?? DataRequest();

  Map<String, dynamic> toJson() => _$PregnancyAtrForRequestToJson(this);

  factory PregnancyAtrForRequest.fromJson(Map<String, dynamic> json) =>
      _$PregnancyAtrForRequestFromJson(json);

  @override
  // TODO: implement props
  List<Object> get props {
    return <Object>[
      this.nik,
      this.namaSuami,
      this.tanggalLahir,
      this.lastMenstruation,
      this.menstruationCycle,
      this.weight,
      this.height,
      this.bloodPressure,
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
