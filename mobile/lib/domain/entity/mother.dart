import 'package:equatable/equatable.dart';
import 'package:intl/intl.dart';
import 'package:simpati/core/result/base_data.dart';
import 'package:simpati/core/tools/data_parser_factory.dart';
import 'package:simpati/core/utils/date_utils.dart';

class Mother extends Equatable implements Data {
  final String id;
  final String nik;
  final String fullName;
  final String husbandName;
  final String address;
  final String province;
  final String city;
  final String phone;
  final int childCount;
  final double weight;
  final double height;
  final String bloodType;
  final String bloodPressure;
  final DateTime birthDate;
  final String picture;
  final String posyanduId;

  Mother({
    this.id,
    this.nik,
    this.fullName,
    this.husbandName,
    this.address,
    this.province,
    this.city,
    this.phone,
    this.childCount,
    this.weight,
    this.height,
    this.bloodType,
    this.bloodPressure,
    this.birthDate,
    this.picture,
    this.posyanduId,
  });

  Mother copyWith({
    String id,
    String nik,
    String fullName,
    String husbandName,
    String address,
    String province,
    String city,
    String phone,
    int childCount,
    double weight,
    double height,
    String bloodType,
    String bloodPressure,
    DateTime birthDate,
    String picture,
    String posyanduId,
  }) {
    return Mother(
      id: id ?? this.id,
      nik: nik ?? this.nik,
      fullName: fullName ?? this.fullName,
      husbandName: husbandName ?? this.husbandName,
      address: address ?? this.address,
      province: province ?? this.province,
      city: city ?? this.city,
      phone: phone ?? this.phone,
      childCount: childCount ?? this.childCount,
      weight: weight ?? this.weight,
      height: height ?? this.height,
      bloodType: bloodType ?? this.bloodType,
      bloodPressure: bloodPressure ?? this.bloodPressure,
      birthDate: birthDate ?? this.birthDate,
      picture: picture ?? this.picture,
      posyanduId: posyanduId ?? this.posyanduId,
    );
  }

  static Mother mock = Mother(
    id: '12312asasdasd',
    nik: '213Î123123123',
    fullName: 'Khusnaini Aghniya',
    husbandName: 'Muhammad Alif Akbar',
    address: 'Jl Singosari',
    province: 'Jawa Barat',
    city: 'Sumedang',
    phone: '+62 81312239294',
    childCount: 3,
    weight: 50,
    height: 150,
    bloodType: 'A',
    bloodPressure: 'A',
    birthDate: DateFormat.yMd('en_US').parse('1/10/1995'),
    picture: null,
    posyanduId: '2asd2esd2',
  );

  @override
  List<Object> get props => [
        this.id,
        this.nik,
        this.fullName,
        this.husbandName,
        this.address,
        this.province,
        this.city,
        this.phone,
        this.childCount,
        this.weight,
        this.height,
        this.bloodType,
        this.bloodPressure,
        this.birthDate,
        this.picture,
        this.posyanduId,
      ];

  @override
  Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'nik': this.nik,
      'fullName': this.fullName,
      'husbandName': this.husbandName,
      'address': this.address,
      'province': this.province,
      'city': this.city,
      'phone': this.phone,
      'childCount': this.childCount,
      'weight': this.weight,
      'height': this.height,
      'bloodType': this.bloodType,
      'bloodPressure': this.bloodPressure,
      'birthDate': this.birthDate.millisecondsSinceEpoch,
      'picture': this.picture,
      'posyanduId': this.posyanduId
    };
  }

  static Mother fromMap(Map<dynamic, dynamic> map) {
    return Mother(
      id: map['id'],
      nik: map['nik'],
      fullName: map['fullName'],
      husbandName: map['husbandName'],
      address: map['address'],
      province: map['province'],
      city: map['city'],
      phone: map['phone'],
      childCount: map['childCount'],
      weight: double.parse(map['weight'].toString()),
      height: double.parse(map['height'].toString()),
      bloodType: map['bloodType'],
      bloodPressure: map['bloodPressure'],
      birthDate: DateUtils.parseTimeData(map['birthDate']),
      picture: map['picture'],
      posyanduId: map['posyanduId'],
    );
  }

  String get fullAddress =>
      [address, city, province].where((e) => e != null).join(', ');
}

class MotherList extends Equatable implements Data {
  final List<Mother> mothers;

  MotherList(this.mothers);

  @override
  List<Object> get props => mothers;

  @override
  Map<String, dynamic> toMap() {
    return {motherKey: mothers.map((e) => e.toMap()).toList()};
  }

  static MotherList fromMap(Map<dynamic, dynamic> map) {
    final articleRawList = map[motherKey] as List;
    final list = articleRawList
        .map((e) => DataParserFactory.get().decode<Mother>(e))
        .toList();
    return MotherList(list);
  }

  static const String motherKey = 'mothers';
}
