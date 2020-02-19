import 'package:equatable/equatable.dart';
import 'package:intl/intl.dart';
import 'package:simpati/core/result/base_data.dart';
import 'package:simpati/core/tools/data_parser_factory.dart';
import 'package:simpati/core/utils/date_utils.dart';

class ChildCheck extends Equatable implements Data {
  final double weight;
  final double height;
  final double headSize;
  final double temperature;
  final DateTime createdAt;

  ChildCheck({
    this.weight,
    this.height,
    this.headSize,
    this.temperature,
    this.createdAt,
  });

  ChildCheck copyWith({
    String id,
    double weight,
    double height,
    double headSize,
    double temperature,
    DateTime createdAt,
  }) {
    return ChildCheck(
      weight: weight ?? this.weight,
      height: height ?? this.height,
      headSize: headSize ?? this.headSize,
      temperature: temperature ?? this.temperature,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  static ChildCheck mock = ChildCheck(
    weight: 50,
    height: 150,
    headSize: 25,
    temperature: 25,
    createdAt: DateFormat('dd/MM/yyyy').parse('1/10/2019'),
  );

  @override
  List<Object> get props => [
        this.weight,
        this.height,
        this.headSize,
        this.temperature,
        this.createdAt,
      ];

  @override
  Map<String, dynamic> toMap() {
    return {
      'weight': this.weight,
      'height': this.height,
      'headSize': this.headSize,
      'temperature': this.temperature,
      'createdAt': this.createdAt.millisecondsSinceEpoch,
    };
  }

  static ChildCheck fromMap(Map<dynamic, dynamic> map) {
    return ChildCheck(
      weight: double.parse(map['weight'].toString()),
      height: double.parse(map['height'].toString()),
      headSize: double.parse(map['headSize'].toString()),
      temperature: double.parse(map['temperature'].toString()),
      createdAt: DateUtils.parseTimeData(map['createdAt']),
    );
  }
}

class ChildCheckList extends Equatable implements Data {
  final List<ChildCheck> childMeds;

  ChildCheckList(this.childMeds);

  @override
  List<Object> get props => childMeds;

  @override
  Map<String, dynamic> toMap() {
    return {childMedKey: childMeds.map((e) => e.toMap()).toList()};
  }

  static ChildCheckList fromMap(Map<dynamic, dynamic> map) {
    final articleRawList = map[childMedKey] as List;
    final list = articleRawList
        .map((e) => DataParserFactory.get().decode<ChildCheck>(e))
        .toList();
    return ChildCheckList(list);
  }

  static const String childMedKey = 'checkUp';
}
