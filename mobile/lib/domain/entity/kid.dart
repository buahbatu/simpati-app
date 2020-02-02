import 'package:intl/intl.dart';

class Kid {
  final String fullName;
  final String address;
  final int childCount;
  final double weight;
  final double height;
  final DateTime dateOfBirth;
  final String imagePath;

  Kid(
    this.fullName,
    this.address,
    this.childCount,
    this.weight,
    this.height,
    this.dateOfBirth, {
    this.imagePath,
  });

  static Kid mock = Kid(
    'Akbar Haqiqi',
    'Jl Singosari 2',
    1,
    50,
    150,
    DateFormat('dd/MM/yyyy').parse('1/10/2019'),
  );
}
