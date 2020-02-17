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
    return {'size': size, 'list': list.toMap()};
  }

  static PersonMeta fromMap(Map<String, dynamic> map) {
    // final recapRawList = map['recaps'] as List;
    // final recaps =
    //     recapRawList.map((e) => );

    return PersonMeta(
      size: map['size'],
      list: DataParserFactory.get().decode<RecapList>(map['list']),
    );
  }
}

class RecapList extends Equatable implements Data {
  final List<Recap> list;

  RecapList(this.list);

  @override
  List<Object> get props => list;

  @override
  Map<String, dynamic> toMap() {
    return {'recaps': list.map((e) => e.toMap()).toList()};
  }

  static RecapList fromMap(Map<String, dynamic> map) {
    final recapRawList = map['recaps'] as List;
    final list = recapRawList.map(
      (e) => DataParserFactory.get().decode<Recap>(e),
    );
    return RecapList(list);
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
