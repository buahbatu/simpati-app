import 'package:simpati/core/domain/model/auth_model.dart';
import 'package:get/get.dart';
import 'package:simpati/core/network/network.dart';
import 'package:simpati/core/repository/result.dart';
import 'package:simpati/core/resources/res_data_source.dart';
import 'package:simpati/feature/repository/auth_repository.dart';

class AuthRepositoryApi extends AuthRepository {
  static void register() {
    Get.put<AuthRepository>(
      AuthRepositoryApi(),
      tag: ResDataSource.Remote.toString(),
    );
  }

  @override
  Future<Result<Auth>> login(String email, String password) async {
    return await Api.v1.post(
      "/member-login",
      data: {
        "email": email,
        "password": password,
      },
    ).withParser((json) {
      return Auth.fromJson(json);
    }, errorParser: (json) {
      return json;
    }).withLoading();
    // return Auth.fromJson(responseJson);
  }

  @override
  Future<Result<Auth>> add(Auth instance) {
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
  Future<Result<Auth>> edit(Auth instance) {
    // TODO: implement edit
    throw UnimplementedError();
  }

  @override
  Future<Result<List<Auth>>> getAll() {
    // TODO: implement getAll
    throw UnimplementedError();
  }

  @override
  Future<Result<Auth>> getByKey(ins) {
    // TODO: implement getByKey
    throw UnimplementedError();
  }
}
