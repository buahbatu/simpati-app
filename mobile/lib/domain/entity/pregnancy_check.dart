import 'package:equatable/equatable.dart';
import 'package:intl/intl.dart';
import 'package:simpati/core/result/base_data.dart';
import 'package:simpati/core/tools/data_parser_factory.dart';
import 'package:simpati/core/utils/date_utils.dart';

class PregnancyCheck extends Equatable implements Data {
  final DateTime createdAt;
  final double weight;
  final double weightFetus;
  final String amnioticStatus;
  final bool isGirlPrediction;
  final String bloodPressure;

  PregnancyCheck({
    this.createdAt,
    this.weight,
    this.weightFetus,
    this.amnioticStatus,
    this.isGirlPrediction,
    this.bloodPressure,
  });

  PregnancyCheck copyWith({
    DateTime createdAt,
    double weight,
    double weightFetus,
    String amnioticStatus,
    String isGirlPrediction,
    String bloodPressure,
  }) {
    return PregnancyCheck(
      createdAt: createdAt ?? this.createdAt,
      weight: weight ?? this.weight,
      weightFetus: weightFetus ?? this.weightFetus,
      amnioticStatus: amnioticStatus ?? this.amnioticStatus,
      isGirlPrediction: isGirlPrediction ?? this.isGirlPrediction,
      bloodPressure: bloodPressure ?? this.bloodPressure,
    );
  }

  static PregnancyCheck mock = PregnancyCheck(
    createdAt: DateFormat('dd/MM/yyyy').parse('1/10/2019'),
    weight: 50,
    weightFetus: 150,
    amnioticStatus: 'Air Ketuban Baik',
    isGirlPrediction: true,
    bloodPressure: '125/24',
  );

  @override
  List<Object> get props => [
        this.createdAt,
        this.weight,
        this.weightFetus,
        this.amnioticStatus,
        this.isGirlPrediction,
        this.bloodPressure,
      ];

  @override
  Map<String, dynamic> toMap() {
    return {
      'createdAt': this.createdAt,
      'weight': this.weight,
      'weightFetus': this.weightFetus,
      'amnioticStatus': this.amnioticStatus,
      'isGirlPrediction': this.isGirlPrediction,
      'bloodPressure': this.bloodPressure,
    };
  }

  static PregnancyCheck fromMap(Map<dynamic, dynamic> map) {
    return PregnancyCheck(
      createdAt: DateUtils.parseTimeData(map['createdAt']),
      weight: double.parse(map['weight'].toString()),
      weightFetus: double.parse(map['weightFetus'].toString()),
      amnioticStatus: map['amnioticStatus'],
      bloodPressure: map['bloodPressure'],
    );
  }
}

class PregnancyCheckList extends Equatable implements Data {
  final List<PregnancyCheck> pregnancyMeds;

  PregnancyCheckList(this.pregnancyMeds);

  @override
  List<Object> get props => pregnancyMeds;

  @override
  Map<String, dynamic> toMap() {
    return {pregnancyMedKey: pregnancyMeds.map((e) => e.toMap()).toList()};
  }

  static PregnancyCheckList fromMap(Map<dynamic, dynamic> map) {
    final articleRawList = map[pregnancyMedKey] as List;
    final list = articleRawList
        .map((e) => DataParserFactory.get().decode<PregnancyCheck>(e))
        .toList();
    return PregnancyCheckList(list);
  }

  static const String pregnancyMedKey = 'checkUp';
}
