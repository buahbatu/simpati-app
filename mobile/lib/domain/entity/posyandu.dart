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
  final int childCount;
  final int momCount;
  final int userCount;

  Posyandu({
    this.id,
    this.fullName,
    this.address,
    this.headPerson,
    this.phone,
    this.email,
    this.picture,
    this.childCount,
    this.momCount,
    this.userCount,
  });

  Posyandu copyWith({
    String id,
    String fullName,
    String address,
    String headPerson,
    String phone,
    String email,
    String picture,
    int childCount,
    int momCount,
    int userCount,
  }) {
    return Posyandu(
      id: id ?? this.id,
      fullName: fullName ?? this.fullName,
      address: address ?? this.address,
      headPerson: headPerson ?? this.headPerson,
      phone: phone ?? this.phone,
      email: email ?? this.email,
      picture: picture ?? this.picture,
      childCount: childCount ?? this.childCount,
      momCount: momCount ?? this.momCount,
      userCount: userCount ?? this.userCount,
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
      'childCount': childCount,
      'momCount': momCount,
      'userCount': userCount,
    };
  }

  static Posyandu fromMap(Map<dynamic, dynamic> map) {
    return Posyandu(
      id: map['id'],
      fullName: map['fullName'],
      address: map['address'],
      headPerson: map['headPerson'],
      phone: map['phone'],
      email: map['email'],
      picture: map['picture'],
      childCount: map['childCount'],
      momCount: map['momCount'],
      userCount: map['userCount'],
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
        this.childCount,
        this.momCount,
        this.userCount,
      ];
}
