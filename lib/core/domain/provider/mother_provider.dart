import 'dart:io';

import 'package:dio/dio.dart' as _dio;
import 'package:simpati/core/utils/CustomException.dart';
import 'package:simpati/core/utils/constants.dart' as Constants;

class MotherProvider {
  _dio.Dio dio = _dio.Dio();
  final url = Constants.API_URL;

  Future<dynamic> getMotherAsync() async {
    _dio.Response response;
    var responseJson;
    try {
      response = await dio.get(url + "api/klaster-by-member-relation-sub",
          queryParameters: {
            "klaster_slug": "posyandu",
            "klaster_slug_get": "ibu",
            "simple": true
          },
          options: _dio.Options(headers: {
            "Authorization":
                "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoiMSIsImVtYWlsIjoidGlzQGxlYXB1cC5pZCIsInRpbWVzdGFtcCI6MTU5NDAwMDAzMH0.Qn7wou_ZB1wCg8jS6FJoGdcRcm7cwMjEopMQI1RlWos",
          }));
      responseJson = CustomException().response(response);
    } on SocketException {
      throw FetchDataException("No Internet Connection");
    }
    return responseJson;
  }
}
