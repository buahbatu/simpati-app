import 'package:simpati/core/result/result_parser_factory.dart';
import 'package:simpati/domain/entity/posyandu.dart';

class Nurse {
  final String posyandu_user_id;
  final String fullname;
  final String handphone;
  final String handphone_alt;
  final String email;
  final String address;
  final String status;
  final String created_at;
  final String posyandu_id;
  final String picture;
  final String admin_id;
  final Posyandu posyandu;

  Nurse({
    this.posyandu_user_id,
    this.fullname,
    this.handphone,
    this.handphone_alt,
    this.email,
    this.address,
    this.status,
    this.created_at,
    this.posyandu_id,
    this.picture,
    this.admin_id,
    this.posyandu,
  });

  Nurse copyWith({
    String posyandu_user_id,
    String fullname,
    String handphone,
    String handphone_alt,
    String email,
    String address,
    String status,
    String created_at,
    String posyandu_id,
    String picture,
    String admin_id,
    String token,
    Posyandu posyandu,
  }) {
    return Nurse(
      posyandu_user_id: posyandu_user_id ?? this.posyandu_user_id,
      fullname: fullname ?? this.fullname,
      handphone: handphone ?? this.handphone,
      handphone_alt: handphone_alt ?? this.handphone_alt,
      email: email ?? this.email,
      address: address ?? this.address,
      status: status ?? this.status,
      created_at: created_at ?? this.created_at,
      posyandu_id: posyandu_id ?? this.posyandu_id,
      picture: picture ?? this.picture,
      admin_id: admin_id ?? this.admin_id,
      posyandu: posyandu ?? this.posyandu,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'posyandu_user_id': posyandu_user_id,
      'fullname': fullname,
      'handphone': handphone,
      'handphone_alt': handphone_alt,
      'email': email,
      'address': address,
      'status': status,
      'created_at': created_at,
      'posyandu_id': posyandu_id,
      'picture': picture,
      'admin_id': admin_id,
      'posyandu_detail': ResultParserFactory.get().encode(posyandu),
    };
  }

  static Nurse fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Nurse(
      posyandu_user_id: map['posyandu_user_id'],
      fullname: map['fullname'],
      handphone: map['handphone'],
      handphone_alt: map['handphone_alt'],
      email: map['email'],
      address: map['address'],
      status: map['status'],
      created_at: map['created_at'],
      posyandu_id: map['posyandu_id'],
      picture: map['picture'],
      admin_id: map['admin_id'],
      posyandu: ResultParserFactory.get().decode(map['posyandu_detail']),
    );
  }

  @override
  String toString() {
    return 'User posyandu_user_id: $posyandu_user_id, fullname: ' +
        '$fullname, handphone: $handphone, handphone_alt: $handphone_alt, ' +
        'email: $email, address: $address, status: $status, created_at: ' +
        '$created_at, posyandu_id: $posyandu_id, picture: $picture, admin_id: ' +
        '$admin_id, posyandu_detail: $posyandu';
  }
}
