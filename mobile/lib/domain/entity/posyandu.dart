import 'package:equatable/equatable.dart';
import 'package:simpati/core/result/base_data.dart';

class Posyandu extends Equatable implements Data {
  final String id;
  final String fullName;
  final String address;
  final String headPerson;
  final String phone;
  final String email;
  final String picture;

  Posyandu({
    this.id,
    this.fullName,
    this.address,
    this.headPerson,
    this.phone,
    this.email,
    this.picture,
  });

  Posyandu copyWith({
    String id,
    String fullName,
    String address,
    String headPerson,
    String phone,
    String email,
    String picture,
  }) {
    return Posyandu(
      id: id ?? this.id,
      fullName: fullName ?? this.fullName,
      address: address ?? this.address,
      headPerson: headPerson ?? this.headPerson,
      phone: phone ?? this.phone,
      email: email ?? this.email,
      picture: picture ?? this.picture,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'fullName': fullName,
      'address': address,
      'headPerson': headPerson,
      'phone': phone,
      'email': email,
      'picture': picture,
    };
  }

  static Posyandu fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Posyandu(
      id: map['id'],
      fullName: map['fullName'],
      address: map['address'],
      headPerson: map['headPerson'],
      phone: map['phone'],
      email: map['email'],
      picture: map['picture'],
    );
  }

  @override
  List<Object> get props => [
        this.id,
        this.fullName,
        this.address,
        this.headPerson,
        this.phone,
        this.email,
        this.picture,
      ];
}
