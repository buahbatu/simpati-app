import 'package:equatable/equatable.dart';
import 'package:intl/intl.dart';
import 'package:simpati/core/result/base_data.dart';
import 'package:simpati/core/tools/data_parser_factory.dart';
import 'package:simpati/core/utils/date_utils.dart';

class Pregnancy extends Equatable implements Data {
  final String id;
  final DateTime lastMenstruation;
  final MenstruationCycle menstruationCycle;
  final double weight;
  final double height;
  final String bloodPressure;

  Pregnancy({
    this.id,
    this.lastMenstruation,
    this.menstruationCycle,
    this.weight,
    this.height,
    this.bloodPressure,
  });

  Pregnancy copyWith({
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

  static Pregnancy mock = Pregnancy(
    id: '1',
    lastMenstruation: DateFormat('dd/MM/yyyy').parse('1/10/2019'),
    menstruationCycle: MenstruationCycle.short,
    weight: 50,
    height: 150,
    bloodPressure: '120/20',
  );

  static Pregnancy fromMap(Map<dynamic, dynamic> map) {
    return Pregnancy(
      id: map['id'],
      lastMenstruation: DateUtils.parseTimeData(map['lastMenstruation']),
      menstruationCycle: MenstruationCycle.parseKey(map['menstruationCycle']),
      weight: double.parse(map['weight'].toString()),
      height: double.parse(map['height'].toString()),
      bloodPressure: map['bloodPressure'],
    );
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
      'lastMenstruation': this.lastMenstruation.millisecondsSinceEpoch,
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

class PregnancyList extends Equatable implements Data {
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
