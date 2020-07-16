import 'dart:io';
import 'package:simpati/core/domain/model/children_model.dart';
import 'package:dio/dio.dart' as _dio;
import 'package:get/get.dart';
import 'package:simpati/core/network/network.dart';
import 'package:simpati/core/repository/result.dart';
import 'package:simpati/core/resources/res_data_source.dart';
import 'package:simpati/core/utils/CustomException.dart';
import 'package:simpati/core/utils/constants.dart' as Constants;
import 'package:simpati/feature/repository/children_repository.dart';

class ChildrenRepositoryApi extends ChildrenRepository {
  final _dio.Dio dio = _dio.Dio();
  final url = Constants.API_URL;

  static void register() {
    Get.put<ChildrenRepository>(
      ChildrenRepositoryApi(),
      tag: ResDataSource.Remote.toString(),
    );
  }

  Future<Children> getAll1() async {
    _dio.Response response;
    var responseJson;
    try {
      response = await dio.get(url + "api/klaster-by-member-relation-sub",
          queryParameters: {
            "klaster_slug": "posyandu",
            "klaster_slug_get": "anak",
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
    return Children.fromJson(responseJson);
  }

  @override
  Future<Result<Children>> getByKey(ins) {
    // TODO: implement getByKey
    throw UnimplementedError();
  }

  @override
  Future<Result<Children>> add(Children instance) {
    // TODO: implement add
    throw UnimplementedError();
  }

  @override
  Future<Result<bool>> deleteAll() {
    // TODO: implement deleteAll
    throw UnimplementedError();
  }

  @override
  Future<Result<bool>> deleteByKey(key) {
    // TODO: implement deleteByKey
    throw UnimplementedError();
  }

  @override
  Future<Result<Children>> edit(Children instance) {
    // TODO: implement edit
    throw UnimplementedError();
  }

  @override
  Future<Result<Children>> getAll() async {
    return await Api.v1.get(
      "/klaster-by-member-relation-sub",
      queryParameters: {
        "klaster_slug": "posyandu",
        "klaster_slug_get": "anak",
        "simple": true
      },
    ).withParser((json) {
      return Children.fromJson(json);
    }, errorParser: (json) {
      return json;
    });
  }
}
