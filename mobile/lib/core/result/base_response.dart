import 'package:equatable/equatable.dart';
import 'package:simpati/core/result/result_parser_factory.dart';

class BaseResponse<T> extends Equatable {
  final Map<String, dynamic> rawResponse;
  final String status;
  final String message;
  final T data;

  BaseResponse(this.rawResponse, this.status, this.message, this.data);

  bool isSuccess() => data != null;

  static Map<String, dynamic> toMap(BaseResponse data) {
    return {
      'status': data.status,
      'message': data.message,
      'data': ResultParserFactory.get().encode(data),
    };
  }

  static BaseResponse<T> fromMap<T>(Map<String, dynamic> map) {
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
