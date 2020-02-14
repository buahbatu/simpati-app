import 'package:simpati/core/result/base_response.dart';
import 'package:simpati/domain/entity/auth_info.dart';

abstract class IAuthRepository {
  // auth
  Future<BaseResponse<AuthInfo>> login();
  Future<BaseResponse> logout();
}
