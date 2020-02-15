import 'package:equatable/equatable.dart';
import 'package:simpati/core/result/base_data.dart';

class Nurse extends Equatable implements Data {
  final String id;
  final String fullName;
  final String phone;
  final String email;
  final String address;
  final String status;
  final String createdAt;
  final String posyanduId;
  final String picture;

  Nurse({
    this.id,
    this.fullName,
    this.phone,
    this.email,
    this.address,
    this.status,
    this.createdAt,
    this.posyanduId,
    this.picture,
  });

  Nurse copyWith({
    String id,
    String fullName,
    String handphone,
    String email,
    String address,
    String status,
    String createdAt,
    String posyanduId,
    String picture,
  }) {
    return Nurse(
      id: id ?? this.id,
      fullName: fullName ?? this.fullName,
      phone: handphone ?? this.phone,
      email: email ?? this.email,
      address: address ?? this.address,
      status: status ?? this.status,
      createdAt: createdAt ?? this.createdAt,
      posyanduId: posyanduId ?? this.posyanduId,
      picture: picture ?? this.picture,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'fullname': fullName,
      'handphone': phone,
      'email': email,
      'address': address,
      'status': status,
      'createdAt': createdAt,
      'posyanduId': posyanduId,
      'picture': picture,
    };
  }

  static Nurse fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Nurse(
      id: map['id'],
      fullName: map['fullName'],
      phone: map['handphone'],
      email: map['email'],
      address: map['address'],
      status: map['status'],
      createdAt: map['createdAt'],
      posyanduId: map['posyanduId'],
      picture: map['picture'],
    );
  }

  @override
  String toString() {
    return 'User id: $id, fullName: ' +
        '$fullName, handphone: $phone, email: $email, address: $address, ' +
        'status: $status, createdAt: ' +
        '$createdAt, posyanduId: $posyanduId, picture: $picture';
  }

  @override
  List<Object> get props => [
        this.id,
        this.fullName,
        this.phone,
        this.email,
        this.address,
        this.status,
        this.createdAt,
        this.posyanduId,
        this.picture,
      ];
}
