import 'package:intl/intl.dart';

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
