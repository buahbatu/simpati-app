import 'package:equatable/equatable.dart';
import 'package:intl/intl.dart';
import 'package:simpati/core/result/base_data.dart';
import 'package:simpati/core/tools/data_parser_factory.dart';
import 'package:simpati/domain/entity/recap.dart';

class Mother {
  final String fullName;
  final String husbandName;
  final String address;
  final String phoneNumber;
  final int childCount;
  final double weight;
  final double height;
  final String bloodType;
  final DateTime dateOfBirth;
  final String imagePath;

  Mother(
    this.fullName,
    this.husbandName,
    this.address,
    this.phoneNumber,
    this.childCount,
    this.weight,
    this.height,
    this.bloodType,
    this.dateOfBirth, {
    this.imagePath,
  });

  static Mother mock = Mother(
    'Khusnaini Aghniya',
    'Muhammad Alif Akbar',
    'Jl Singosari',
    '+62 81312239294',
    3,
    50,
    150,
    'A',
    DateFormat.yMd('en_US').parse('1/10/1995'),
  );
}

class MotherMeta extends Equatable implements Data {
  final int size;
  final List<Recap> recaps;

  MotherMeta({
    this.size,
    this.recaps,
  });

  @override
  List<Object> get props => [this.size, this.recaps];

  @override
  Map<String, dynamic> toMap() {
    return {'size': size, 'recaps': recaps.map((e) => e.toMap()).toList()};
  }

  static MotherMeta fromMap(Map<String, dynamic> map) {
    final recapRawList = map['recaps'] as List;
    final recaps =
        recapRawList.map((e) => DataParserFactory.get().decode<Recap>(e));

    return MotherMeta(size: map['size'], recaps: recaps);
  }
}
