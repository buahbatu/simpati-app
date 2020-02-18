import 'package:equatable/equatable.dart';
import 'package:intl/intl.dart';
import 'package:simpati/core/result/base_data.dart';
import 'package:simpati/core/tools/data_parser_factory.dart';
import 'package:simpati/core/utils/date_utils.dart';

class Child extends Equatable implements Data {
  final String id;
  final String idMother;
  final String posyanduId;
  final String fullName;
  final String address;
  final String momName;
  final String bloodType;
  final double weight;
  final double height;
  final double headSize;
  final double temperature;
  final DateTime birthDate;
  final String picture;

  Child({
    this.id,
    this.idMother,
    this.posyanduId,
    this.fullName,
    this.address,
    this.momName,
    this.bloodType,
    this.weight,
    this.height,
    this.headSize,
    this.temperature,
    this.birthDate,
    this.picture,
  });

  Child copyWith({
    String id,
    String idMother,
    String posyanduId,
    String fullName,
    String address,
    String momName,
    String bloodType,
    double weight,
    double height,
    double headSize,
    double temperature,
    DateTime birthDate,
    String picture,
  }) {
    return Child(
      id: id ?? this.id,
      idMother: idMother ?? this.idMother,
      posyanduId: posyanduId ?? this.posyanduId,
      fullName: fullName ?? this.fullName,
      address: address ?? this.address,
      momName: momName ?? this.momName,
      bloodType: bloodType ?? this.bloodType,
      weight: weight ?? this.weight,
      height: height ?? this.height,
      headSize: headSize ?? this.headSize,
      temperature: temperature ?? this.temperature,
      birthDate: birthDate ?? this.birthDate,
      picture: picture ?? this.picture,
    );
  }

  static Child mock = Child(
    id: '1',
    idMother: '1',
    posyanduId: '1',
    fullName: 'Akbar Haqiqi',
    address: 'Jl Singosari 2',
    momName: 'Khusnaini Aghniya',
    bloodType: 'A',
    weight: 50,
    height: 150,
    headSize: 25,
    temperature: 25,
    birthDate: DateFormat('dd/MM/yyyy').parse('1/10/2019'),
  );

  @override
  List<Object> get props => [
        this.id,
        this.idMother,
        this.posyanduId,
        this.fullName,
        this.address,
        this.momName,
        this.bloodType,
        this.weight,
        this.height,
        this.headSize,
        this.temperature,
        this.birthDate,
        this.picture,
      ];

  @override
  Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'idMother': this.idMother,
      'posyanduId': this.posyanduId,
      'fullName': this.fullName,
      'address': this.address,
      'momName': this.momName,
      'bloodType': this.bloodType,
      'weight': this.weight,
      'height': this.height,
      'headSize': this.headSize,
      'temperature': this.temperature,
      'birthDate': this.birthDate.millisecondsSinceEpoch,
      'picture': this.picture,
    };
  }

  static Child fromMap(Map<dynamic, dynamic> map) {
    return Child(
      id: map['id'],
      idMother: map['idMother'],
      posyanduId: map['posyanduId'],
      fullName: map['fullName'],
      address: map['address'],
      momName: map['momName'],
      bloodType: map['bloodType'],
      weight: double.parse(map['weight'].toString()),
      height: double.parse(map['height'].toString()),
      headSize: double.parse(map['headSize'].toString()),
      temperature: double.parse(map['temperature'].toString()),
      birthDate: DateUtils.parseTimeData(map['birthDate']),
      picture: map['picture'],
    );
  }

  String get momFirstName => momName.split(' ').first;
}

class ChildList extends Equatable implements Data {
  final List<Child> childs;

  ChildList(this.childs);

  @override
  List<Object> get props => childs;

  @override
  Map<String, dynamic> toMap() {
    return {childKey: childs.map((e) => e.toMap()).toList()};
  }

  static ChildList fromMap(Map<dynamic, dynamic> map) {
    final articleRawList = map[childKey] as List;
    final list = articleRawList
        .map((e) => DataParserFactory.get().decode<Child>(e))
        .toList();
    return ChildList(list);
  }

  static const String childKey = 'childs';
}
