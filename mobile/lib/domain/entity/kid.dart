import 'package:intl/intl.dart';

class Kid {
  final String id;
  final String idIbu;
  final String fullName;
  final String address;
  final double weight;
  final double height;
  final DateTime dateOfBirth;
  final String imagePath;

  Kid(
    this.id,
    this.idIbu,
    this.fullName,
    this.address,
    this.weight,
    this.height,
    this.dateOfBirth, {
    this.imagePath,
  });

  static Kid mock = Kid(
    '1',
    '1',
    'Akbar Haqiqi',
    'Jl Singosari 2',
    50,
    150,
    DateFormat('dd/MM/yyyy').parse('1/10/2019'),
  );
}
