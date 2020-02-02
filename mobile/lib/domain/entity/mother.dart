import 'package:intl/intl.dart';

class Mother {
  final String fullName;
  final String address;
  final int childCount;
  final double weight;
  final double height;
  final DateTime dateOfBirth;
  final String imagePath;

  Mother(
    this.fullName,
    this.address,
    this.childCount,
    this.weight,
    this.height,
    this.dateOfBirth, {
    this.imagePath,
  });

  static Mother mock = Mother(
    'Khusnaini Aghniya',
    'Jl Singosari',
    1,
    50,
    150,
    DateFormat.yMd('en_US').parse('1/10/1995'),
  );
}
