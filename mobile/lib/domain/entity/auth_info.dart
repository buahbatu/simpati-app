import 'package:equatable/equatable.dart';
import 'package:simpati/core/result/base_data.dart';
import 'package:simpati/core/result/result_parser_factory.dart';
import 'package:simpati/domain/entity/nurse.dart';
import 'package:simpati/domain/entity/posyandu.dart';

class AuthInfo extends Equatable implements Data {
  final String token;
  final Nurse nurse;
  final Posyandu posyandu;

  AuthInfo({
    this.nurse,
    this.token,
    this.posyandu,
  });

  AuthInfo copyWith({
    String nurse,
    String token,
    Posyandu posyandu,
  }) {
    return AuthInfo(
      nurse: nurse ?? this.nurse,
      token: token ?? this.token,
      posyandu: posyandu ?? this.posyandu,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'nurse': nurse.toMap(),
      'token': token,
      'posyandu_detail': posyandu.toMap(),
    };
  }

  static AuthInfo fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return AuthInfo(
      nurse: ResultParserFactory.get().decode(map),
      token: map['token'],
      posyandu: ResultParserFactory.get().decode(map['posyandu_detail']),
    );
  }

  @override
  String toString() {
    return 'AuthInfo nurse: $nurse, token: $token, posyandu_detail: $posyandu';
  }

  @override
  List<Object> get props => [this.nurse, this.token, this.posyandu];
}
