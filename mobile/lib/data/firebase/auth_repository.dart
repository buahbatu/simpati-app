import 'package:simpati/core/result/base_data.dart';
import 'package:simpati/core/result/base_response.dart';
import 'package:simpati/domain/entity/auth_info.dart';
import 'package:simpati/domain/repository/auth_repository.dart';

class AuthRepository implements IAuthRepository {
  @override
  Future<BaseResponse<AuthInfo>> login(String email, String password) {
    // TODO: implement login
    throw UnimplementedError();
  }

  @override
  Future<BaseResponse<Data>> logout() {
    // TODO: implement logout
    throw UnimplementedError();
  }
}
