import 'package:equatable/equatable.dart';
import 'package:intl/intl.dart';
import 'package:simpati/core/result/base_data.dart';
import 'package:simpati/core/utils/date_utils.dart';

class Pregnancy extends Equatable implements Data {
  final DateTime lastMenstruation;
  final MenstruationCycle period;
  final double weight;
  final double height;
  final String bloodPressure;

  Pregnancy({
    this.lastMenstruation,
    this.period,
    this.weight,
    this.height,
    this.bloodPressure,
  });

  static Pregnancy mock = Pregnancy(
    lastMenstruation: DateFormat('dd/MM/yyyy').parse('1/10/2019'),
    period: MenstruationCycle.short,
    weight: 50,
    height: 150,
    bloodPressure: '120/20',
  );

  static Pregnancy fromMap(Map<dynamic, dynamic> map) {
    return Pregnancy(
      lastMenstruation: DateUtils.parseTimeData(map['lastMenstruation']),
      period: map['period'],
      weight: map['weight'],
      height: map['height'],
      bloodPressure: map['bloodPressure'],
    );
  }

  @override
  List<Object> get props => [
        this.lastMenstruation,
        this.period,
        this.weight,
        this.height,
        this.bloodPressure,
      ];

  @override
  Map<String, dynamic> toMap() {
    return {
      'lastMenstruation': this.lastMenstruation.millisecondsSinceEpoch,
      'period': this.period,
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

  factory MenstruationCycle.parse(String key) {
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
