import 'package:simpati/core/domain/model/mother_model.dart';
import 'package:dio/dio.dart' as _dio;
import 'package:get/get.dart';
import 'package:simpati/core/network/network.dart';
import 'package:simpati/core/network/network_token.dart';
import 'package:simpati/core/repository/result.dart';
import 'package:simpati/core/resources/res_data_source.dart';
import 'package:simpati/core/storage/app_config.dart';
import 'package:simpati/core/utils/constants.dart' as Constants;
import 'package:simpati/feature/repository/mother_repository.dart';

class MotherRepositoryImpl extends MotherRepository {
  final _dio.Dio dio = _dio.Dio();
  final url = Constants.API_URL;

  static void register() {
    Get.put<MotherRepository>(
      MotherRepositoryImpl(),
      tag: ResDataSource.Remote.toString(),
    );
  }

  Future<Mother> getAll1() async {}

  @override
  Future<Result<Mother>> add(Mother instance) {
    // TODO: implement add
    throw UnimplementedError();
  }

  @override
  Future<Result<bool>> deleteAll() {
    // TODO: implement deleteAll
    throw UnimplementedError();
  }

  @override
  Future<Result<bool>> deleteByKey(ins) {
    // TODO: implement deleteByKey
    throw UnimplementedError();
  }

  @override
  Future<Result<Mother>> edit(Mother instance) {
    // TODO: implement edit
    throw UnimplementedError();
  }

  @override
  Future<Result<Mother>> getAll() async {
    return await Api.v1.get(
      "/klaster-by-member-relation-sub",
      queryParameters: {
        "klaster_slug": "posyandu",
        "klaster_slug_get": "ibu",
        "simple": true
      },
    ).withParser(
      (json) {
        // if (json is! Mother) throw TypeError();
        return Mother.fromJson(json);
      },
      // errorOr: () =>
      //     Result<Mother>.error(MessageFailure("something went wrong..")),
    ).withLoading();
  }

  @override
  Future<Result<Mother>> getByKey(ins) {
    // TODO: implement getByKey
    throw UnimplementedError();
  }
}
