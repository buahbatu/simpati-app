import 'package:simpati/core/result/base_response.dart';
import 'package:simpati/domain/entity/nurse.dart';

abstract class IAuthRepository {
  // auth
  Future<BaseResponse<Nurse>> login(String email, String password);
  Future<BaseResponse> logout();
}
