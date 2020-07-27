import 'dart:io';
import 'package:dio/dio.dart' as _dio;
import 'package:get/get.dart';
import 'package:simpati/core/network/network.dart';
import 'package:simpati/core/repository/result.dart';
import 'package:simpati/core/resources/res_data_source.dart';
import 'package:simpati/core/utils/constants.dart' as Constants;
import 'package:simpati/feature/children/model/children.dart';
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
  Future<Result<List<Children>>> getAll() async {
    //TODO: implement getAll but normalize the data class first
    return await Api.v1.get(
      "/klaster-by-member-relation-sub",
      queryParameters: {
        "klaster_slug": "posyandu",
        "klaster_slug_get": "anak",
        "simple": true,
        "limit": -1
      },
    ).withParser((json) {
      return ResponseChildren.fromJson(json).mapToChildren();
    }, errorParser: (json) {
      return json;
    });
  }
}
