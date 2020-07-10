import 'dart:io';

import 'package:simpati/core/domain/model/mother_model.dart';
import 'package:simpati/core/domain/repository/mother_repository.dart';
import 'package:simpati/core/framework/base_repository.dart';
import 'package:dio/dio.dart' as _dio;
import 'package:get/get.dart';
import 'package:simpati/core/resources/res_data_source.dart';
import 'package:simpati/core/utils/CustomException.dart';
import 'package:simpati/core/utils/constants.dart' as Constants;

class MotherRepositoryImpl extends MotherRepository {
  final _dio.Dio dio = _dio.Dio();
  final url = Constants.API_URL;

  static void register() {
    Get.put<MotherRepository>(
      MotherRepositoryImpl(),
      tag: ResDataSource.Remote.toString(),
    );
  }

  @override
  Future<Mother> add(Mother instance) {
    // TODO: implement add
    throw UnimplementedError();
  }

  @override
  Future<bool> deleteAll() {
    // TODO: implement deleteAll
    throw UnimplementedError();
  }

  @override
  Future<bool> deleteByKey(instance) {
    // TODO: implement deleteByKey
    throw UnimplementedError();
  }

  @override
  Future<Mother> edit(Mother instance) {
    // TODO: implement edit
    throw UnimplementedError();
  }

  @override
  Future<Mother> getAll() async {
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
      print(response.statusCode);
    } on SocketException {
      throw FetchDataException("No Internet Connection");
    }
    return Mother.fromJson(responseJson);
  }

  @override
  Future<Mother> getByKey(key) {
    // TODO: implement getByKey
    throw UnimplementedError();
  }
}
