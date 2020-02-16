import 'package:simpati/core/result/base_data.dart';
import 'package:simpati/core/result/base_response.dart';
import 'package:simpati/core/tools/app_preference.dart';
import 'package:simpati/domain/entity/posyandu.dart';
import 'package:simpati/domain/repository/posyandu_repository.dart';

class PosyanduRepositoryPref implements IPosyanduRepository {
  final AppPreferance _appPreferance;

  PosyanduRepositoryPref({AppPreferance appPreferance})
      : this._appPreferance = appPreferance ?? AppPreferance.get();

  @override
  Future<BaseResponse<Posyandu>> getPosyandu({String posyanduId}) async {
    final Posyandu posyandu = await _appPreferance.loadData(_key);
    final response = BaseResponse.fromPref(posyandu);
    return response;
  }

  @override
  Future<BaseResponse<Data>> savePosyandu(Posyandu posyandu) async {
    await _appPreferance.saveData(_key, posyandu);
    final BaseResponse response = BaseResponse.fromPref(posyandu);
    return response;
  }

  static String _key = 'Posyandu';
}
