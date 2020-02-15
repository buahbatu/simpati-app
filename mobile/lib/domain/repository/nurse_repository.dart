import 'package:simpati/core/result/base_response.dart';
import 'package:simpati/domain/entity/nurse.dart';

abstract class INurseRepository {
  static String _key = 'Profile';

  Future<BaseResponse<Nurse>> getProfile();
  Future<BaseResponse> saveProfile(Nurse nurse);
}
