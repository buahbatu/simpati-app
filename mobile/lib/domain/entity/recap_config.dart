import 'package:equatable/equatable.dart';
import 'package:simpati/core/result/base_data.dart';
import 'package:simpati/core/tools/data_parser_factory.dart';

class MetaConfig extends Equatable implements Data {
  final String key;
  final bool active;

  MetaConfig({this.key, this.active});

  @override
  List<Object> get props => [this.key, this.active];

  @override
  Map<String, dynamic> toMap() {
    return {'key': key, 'active': active};
  }

  static MetaConfig fromMap(Map<dynamic, dynamic> map) {
    return MetaConfig(key: map['key'], active: map['active']);
  }
}

class MetaConfigList extends Equatable implements Data {
  final List<MetaConfig> data;

  MetaConfigList(this.data);

  @override
  List<Object> get props => [this.data];

  @override
  Map<String, dynamic> toMap() {
    return {'data': data.map((e) => e.toMap()).toList()};
  }

  static MetaConfigList fromMap(Map<dynamic, dynamic> map) {
    final data = (map['data'] as List)
        .map((e) => DataParserFactory.get().decode<MetaConfig>(e))
        .toList();
    return MetaConfigList(data);
  }
}
