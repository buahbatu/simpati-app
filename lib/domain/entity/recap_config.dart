import 'package:equatable/equatable.dart';
import 'package:simpati/core/result/base_data.dart';
import 'package:simpati/core/tools/data_parser_factory.dart';

class RecapConfig extends Equatable implements Data {
  final String key;
  final bool active;

  RecapConfig({this.key, this.active});

  @override
  List<Object> get props => [this.key, this.active];

  @override
  Map<String, dynamic> toMap() {
    return {'key': key, 'active': active};
  }

  static RecapConfig fromMap(Map<dynamic, dynamic> map) {
    return RecapConfig(key: map['key'], active: map['active']);
  }
}

class RecapConfigList extends Equatable implements Data {
  final List<RecapConfig> data;

  RecapConfigList(this.data);

  @override
  List<Object> get props => [this.data];

  @override
  Map<String, dynamic> toMap() {
    return {'data': data.map((e) => e.toMap()).toList()};
  }

  static RecapConfigList fromMap(Map<dynamic, dynamic> map) {
    final data = (map['data'] as List)
        .map((e) => DataParserFactory.get().decode<RecapConfig>(e))
        .toList();
    return RecapConfigList(data);
  }
}
