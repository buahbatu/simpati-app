import 'package:equatable/equatable.dart';
import 'package:simpati/core/result/base_data.dart';
import 'package:simpati/core/tools/data_parser_factory.dart';

class ImmunizationConfig extends Equatable implements Data {
  final String key;
  final String title;
  final int startMonth;
  final int endMonth;
  final bool active;

  ImmunizationConfig({
    this.key,
    this.title,
    this.startMonth,
    this.endMonth,
    this.active,
  });

  @override
  List<Object> get props => [
        this.key,
        this.title,
        this.startMonth,
        this.endMonth,
        this.active,
      ];

  @override
  Map<String, dynamic> toMap() {
    return {
      'key': this.key,
      'title': this.title,
      'startMonth': this.startMonth,
      'endMonth': this.endMonth,
      'active': this.active,
    };
  }

  static ImmunizationConfig fromMap(Map<dynamic, dynamic> map) {
    return ImmunizationConfig(
      key: map['key'],
      title: map['title'],
      startMonth: map['startMonth'],
      endMonth: map['endMonth'],
      active: map['active'],
    );
  }
}

class ImmunizationConfigList extends Equatable implements Data {
  final List<ImmunizationConfig> data;

  ImmunizationConfigList(this.data);

  @override
  List<Object> get props => [this.data];

  @override
  Map<String, dynamic> toMap() {
    return {'data': data.map((e) => e.toMap()).toList()};
  }

  static ImmunizationConfigList fromMap(Map<dynamic, dynamic> map) {
    final data = (map['data'] as List)
        .map((e) => DataParserFactory.get().decode<ImmunizationConfig>(e))
        .toList();
    return ImmunizationConfigList(data);
  }
}
