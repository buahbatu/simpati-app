import 'package:equatable/equatable.dart';
import 'package:simpati/core/result/base_data.dart';
import 'package:simpati/core/tools/data_parser_factory.dart';

class PersonMeta extends Equatable implements Data {
  final int size;
  final RecapList list;

  PersonMeta({
    this.size,
    this.list,
  });

  @override
  List<Object> get props => [this.size, this.list];

  @override
  Map<String, dynamic> toMap() {
    return {sizeKey: size, listKey: list.toMap()};
  }

  static PersonMeta fromMap(Map<String, dynamic> map) {
    return PersonMeta(
      size: map[sizeKey],
      list: DataParserFactory.get().decode<RecapList>(map[listKey]),
    );
  }

  static const String sizeKey = 'size';
  static const String listKey = 'list';
}

class RecapList extends Equatable implements Data {
  final List<Recap> recaps;

  RecapList(this.recaps);

  @override
  List<Object> get props => recaps;

  @override
  Map<String, dynamic> toMap() {
    return {recapsKey: recaps.map((e) => e.toMap()).toList()};
  }

  static RecapList fromMap(Map<String, dynamic> map) {
    final recapRawList = map[recapsKey] as List;
    final list = recapRawList.map(
      (e) => DataParserFactory.get().decode<Recap>(e),
    ).toList();
    return RecapList(list);
  }

  static const String recapsKey = 'recaps';
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
