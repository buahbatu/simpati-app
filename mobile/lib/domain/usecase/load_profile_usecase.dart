import 'package:simpati/data/local/nurse_repository_pref.dart';
import 'package:simpati/data/local/posyandu_repository_pref.dart';
import 'package:simpati/domain/entity/auth_info.dart';
import 'package:simpati/domain/repository/nurse_repository.dart';
import 'package:simpati/domain/repository/posyandu_repository.dart';

class LoadProfileUsecase {
  final INurseRepository _nurseRepositoryPref;
  final IPosyanduRepository _posyanduRepositoryPref;

  LoadProfileUsecase({
    INurseRepository nurseRepositoryPref,
    IPosyanduRepository posyanduRepositoryPref,
  })  : this._nurseRepositoryPref =
            nurseRepositoryPref ?? NurseRepositoryPref(),
        this._posyanduRepositoryPref =
            posyanduRepositoryPref ?? PosyanduRepositoryPref();

  Future<AuthInfo> start() async {
    final nurseResult = await _nurseRepositoryPref.getProfile();
    final posyanduResult = await _posyanduRepositoryPref.getPosyandu();
    return AuthInfo(
      nurse: nurseResult.data,
      posyandu: posyanduResult.data,
    );
  }
}
