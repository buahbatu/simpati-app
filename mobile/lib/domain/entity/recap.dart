import 'package:equatable/equatable.dart';
import 'package:simpati/core/result/base_data.dart';
import 'package:simpati/core/tools/data_parser_factory.dart';

class PersonMeta extends Equatable implements Data {
  final int size;
  final List<Recap> recaps;

  PersonMeta({
    this.size,
    this.recaps,
  });

  @override
  List<Object> get props => [this.size, this.recaps];

  @override
  Map<String, dynamic> toMap() {
    return {'size': size, 'recaps': recaps.map((e) => e.toMap()).toList()};
  }

  static PersonMeta fromMap(Map<String, dynamic> map) {
    final recapRawList = map['recaps'] as List;
    final recaps =
        recapRawList.map((e) => DataParserFactory.get().decode<Recap>(e));

    return PersonMeta(size: map['size'], recaps: recaps);
  }
}

class Recap extends Equatable implements Data {
  final int value;
  final String title;
  final String type;

  Recap({this.value, this.title, this.type});

  @override
  List<Object> get props => [this.value, this.title, this.type];

  @override
  Map<String, dynamic> toMap() {
    return {'value': value, 'title': title, 'type': type};
  }

  static Recap fromMap(Map<String, dynamic> map) {
    return Recap(value: map['value'], title: map['title'], type: map['type']);
  }
}
