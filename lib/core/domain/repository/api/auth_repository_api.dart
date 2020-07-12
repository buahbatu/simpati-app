import 'dart:io';

import 'package:simpati/core/domain/model/auth_model.dart';
import 'package:simpati/core/domain/repository/auth_repository.dart';
import 'package:dio/dio.dart' as _dio;
import 'package:get/get.dart';
import 'package:simpati/core/resources/res_data_source.dart';
import 'package:simpati/core/utils/CustomException.dart';
import 'package:simpati/core/utils/constants.dart' as Constants;

class AuthRepositoryApi extends AuthRepository {
  final _dio.Dio dio = _dio.Dio();
  final url = Constants.API_URL;

  static void register() {
    Get.put<AuthRepository>(
      AuthRepositoryApi(),
      tag: ResDataSource.Remote.toString(),
    );
  }

  @override
  Future<Auth> add(Auth instance) async {}

  @override
  Future<bool> deleteAll() async {
    return true;
  }

  @override
  Future<bool> deleteByKey(ins) async {
    return true;
  }

  @override
  Future<Auth> edit(Auth instance) async {
    return instance;
  }

  @override
  Future<Auth> getAll() async {}

  @override
  Future<Auth> getByKey(ins) async {
    return ins;
  }

  @override
  Future<Auth> login(String email, String password) async {
    _dio.Response response;
    var responseJson;
    try {
      response = await dio.post(
        url + "api/member-login",
        data: {
          "email": email,
          "password": password,
        },
      );

      responseJson = CustomException().response(response);
    } on SocketException {
      throw FetchDataException("No Internet Connection");
    }
    print(responseJson.toString());
    return Auth.fromJson(responseJson);
  }
}
