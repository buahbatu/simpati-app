import 'package:simpati/core/result/base_data.dart';
import 'package:simpati/core/result/base_response.dart';
import 'package:simpati/core/tools/app_preference.dart';
import 'package:simpati/domain/entity/nurse.dart';
import 'package:simpati/domain/repository/nurse_repository.dart';

class NurseRepositoryPref implements INurseRepository {
  final AppPreferance appPreferance;

  NurseRepositoryPref({this.appPreferance = AppPreferance.instance});

  @override
  Future<BaseResponse<Nurse>> getProfile() async {
    final Nurse nurse = await appPreferance.loadData(_key);
    final response = BaseResponse.fromPref(nurse);
    return response;
  }

  @override
  Future<BaseResponse<Data>> saveProfile(Nurse nurse) async {
    await appPreferance.saveData(_key, nurse);
    final BaseResponse response = BaseResponse.fromPref(nurse);
    return response;
  }

  static String _key = 'Profile';
}
