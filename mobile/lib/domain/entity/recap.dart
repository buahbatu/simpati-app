import 'package:equatable/equatable.dart';
import 'package:simpati/core/result/base_data.dart';

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
