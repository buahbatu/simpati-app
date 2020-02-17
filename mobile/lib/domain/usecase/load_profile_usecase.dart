import 'package:simpati/domain/entity/auth_info.dart';
import 'package:simpati/domain/repository/nurse_repository.dart';
import 'package:simpati/domain/repository/posyandu_repository.dart';

class LoadProfileUsecase {
  final INurseRepository _nurseRepositoryPref;
  final IPosyanduRepository _posyanduRepositoryPref;

  LoadProfileUsecase(this._nurseRepositoryPref, this._posyanduRepositoryPref);

  Future<AuthInfo> start() async {
    final nurseResult = await _nurseRepositoryPref.getProfile();
    final posyanduResult = await _posyanduRepositoryPref.getPosyandu();
    return AuthInfo(
      nurse: nurseResult.data,
      posyandu: posyanduResult.data,
    );
  }
}
