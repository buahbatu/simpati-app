import 'package:simpati/core/result/base_response.dart';
import 'package:simpati/domain/entity/nurse.dart';

abstract class INurseRepository {
  Future<BaseResponse<Nurse>> getProfile();
  Future<BaseResponse> saveProfile(Nurse nurse);
}
