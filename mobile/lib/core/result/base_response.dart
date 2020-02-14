import 'package:equatable/equatable.dart';
import 'package:simpati/core/result/base_data.dart';
import 'package:simpati/core/result/result_parser_factory.dart';

class BaseResponse<T extends Data> extends Equatable implements Data {
  final Map<String, dynamic> rawResponse;
  final String status;
  final String message;
  final T data;

  BaseResponse(this.rawResponse, this.status, this.message, this.data);

  bool isSuccess() => data != null;

  Map<String, dynamic> toMap() {
    return {
      'status': status,
      'message': message,
      'data': data.toMap(),
    };
  }

  static BaseResponse<T> fromMap<T extends Data>(Map<String, dynamic> map) {
    if (map == null) return null;

    return BaseResponse(
      map,
      map['status'],
      map['message'],
      ResultParserFactory.get().decode(map['data']),
    );
  }

  @override
  List<Object> get props => [rawResponse, status, message, data];
}
