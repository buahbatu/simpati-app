import 'package:equatable/equatable.dart';
import 'package:simpati/core/result/base_data.dart';
import 'package:simpati/core/tools/data_parser_factory.dart';
import 'package:simpati/core/utils/date_utils.dart';
import 'package:simpati/domain/entity/immunization_config.dart';

class Immunization extends Equatable implements Data {
  final String key;
  final DateTime createdAt;
  final ImmunizationConfig config;

  Immunization({
    this.key,
    this.createdAt,
    this.config,
  });

  @override
  List<Object> get props => [this.key, this.createdAt, this.config];

  @override
  Map<String, dynamic> toMap() {
    return {'key': key, 'createdAt': createdAt.millisecondsSinceEpoch};
  }

  static Immunization fromMap(Map<dynamic, dynamic> map) {
    return Immunization(
      key: map['key'],
      createdAt: DateUtils.parseTimeData(map['createdAt']),
    );
  }

  Immunization copyWith({
    String key,
    DateTime createdAt,
    ImmunizationConfig config,
  }) {
    return Immunization(
      key: key ?? this.key,
      createdAt: createdAt ?? this.createdAt,
      config: config ?? this.config,
    );
  }

  static const String sizeKey = 'size';
  static const String listKey = 'list';
}

class ImmunizationList extends Equatable implements Data {
  final List<Immunization> immunizations;

  ImmunizationList(this.immunizations);

  @override
  List<Object> get props => immunizations;

  @override
  Map<String, dynamic> toMap() {
    return {immunizationsKey: immunizations.map((e) => e.toMap()).toList()};
  }

  static ImmunizationList fromMap(Map<dynamic, dynamic> map) {
    final recapRawList = map[immunizationsKey] as List;
    final list = recapRawList
        .map((e) => DataParserFactory.get().decode<Immunization>(e))
        .toList();
    return ImmunizationList(list);
  }

  static const String immunizationsKey = 'immunizations';
}
