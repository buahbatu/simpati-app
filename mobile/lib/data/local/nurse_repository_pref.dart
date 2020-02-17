import 'package:simpati/core/result/base_data.dart';
import 'package:simpati/core/result/base_response.dart';
import 'package:simpati/core/tools/app_preference.dart';
import 'package:simpati/domain/entity/nurse.dart';
import 'package:simpati/domain/repository/nurse_repository.dart';

class NurseRepositoryPref implements INurseRepository {
  final AppPreferance _appPreferance;

  NurseRepositoryPref({AppPreferance appPreferance})
      : this._appPreferance = appPreferance ?? AppPreferance.get();

  @override
  Future<BaseResponse<Nurse>> getProfile({String uid}) async {
    final Nurse nurse = await _appPreferance.loadData(_key);
    final response = BaseResponse.fromPref(nurse);
    return response;
  }

  @override
  Future<BaseResponse<Data>> saveProfile(Nurse nurse) async {
    await _appPreferance.saveData(_key, nurse);
    final BaseResponse response = BaseResponse.fromPref(nurse);
    return response;
  }

  static String _key = 'Profile';
}
