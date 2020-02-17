import 'dart:collection';

import 'package:equatable/equatable.dart';
import 'package:simpati/core/result/base_data.dart';
import 'package:simpati/core/tools/data_parser_factory.dart';

class Posyandu extends Equatable implements Data {
  final String id;
  final String fullName;
  final String address;
  final String headPerson;
  final String phone;
  final String email;
  final String picture;
  final PosyanduMeta metadata;

  Posyandu({
    this.id,
    this.fullName,
    this.address,
    this.headPerson,
    this.phone,
    this.email,
    this.picture,
    this.metadata,
  });

  Posyandu copyWith({
    String id,
    String fullName,
    String address,
    String headPerson,
    String phone,
    String email,
    String picture,
    PosyanduMeta metadata,
  }) {
    return Posyandu(
      id: id ?? this.id,
      fullName: fullName ?? this.fullName,
      address: address ?? this.address,
      headPerson: headPerson ?? this.headPerson,
      phone: phone ?? this.phone,
      email: email ?? this.email,
      picture: picture ?? this.picture,
      metadata: metadata ?? this.metadata,
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
      'metadata': metadata.toMap(),
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
      metadata: DataParserFactory.get().decode<PosyanduMeta>(map['metadata']),
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

class PosyanduMeta extends Equatable implements Data {
  final int childCount;
  final int momCount;
  final int userCount;

  PosyanduMeta(this.childCount, this.momCount, this.userCount);

  @override
  List<Object> get props => [this.childCount, this.momCount, this.userCount];

  @override
  Map<String, dynamic> toMap() {
    return {
      'childCount': childCount,
      'momCount': momCount,
      'userCount': userCount
    };
  }

  static PosyanduMeta fromMap(Map<dynamic, dynamic> map) {
    return PosyanduMeta(map['childCount'], map['momCount'], map['userCount']);
  }
}
