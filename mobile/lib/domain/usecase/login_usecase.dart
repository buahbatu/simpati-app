import 'package:simpati/core/result/base_response.dart';
import 'package:simpati/core/tools/app_preference.dart';
import 'package:simpati/data/firebase/auth_repository.dart';
import 'package:simpati/data/firebase/nurse_repository_firebase.dart';
import 'package:simpati/data/firebase/posyandu_repository_firebase.dart';
import 'package:simpati/data/local/nurse_repository_pref.dart';
import 'package:simpati/data/local/posyandu_repository_pref.dart';
import 'package:simpati/domain/entity/nurse.dart';
import 'package:simpati/domain/entity/posyandu.dart';
import 'package:simpati/domain/repository/auth_repository.dart';
import 'package:simpati/domain/repository/nurse_repository.dart';
import 'package:simpati/domain/repository/posyandu_repository.dart';

class LoginUsecase {
  final IAuthRepository _authRepository;
  final INurseRepository _nurseRepositoryFirebase;
  final INurseRepository _nurseRepositoryPref;
  final IPosyanduRepository _posyanduRepositoryFirebase;
  final IPosyanduRepository _posyanduRepositoryPref;
  final AppPreferance _appPreferance;

  LoginUsecase(
    this._authRepository,
    this._nurseRepositoryFirebase,
    this._nurseRepositoryPref,
    this._posyanduRepositoryFirebase,
    this._posyanduRepositoryPref,
    this._appPreferance,
  );

  Future<String> start(String email, String password) async {
    final resultAuth = await doLogin(email, password);
    if (!resultAuth.isSuccess()) {
      return resultAuth.message;
    }

    final resultProfile = await getProfile(resultAuth.data.id);
    if (!resultProfile.isSuccess()) {
      // if no profile, kick the user to logout
      await doLogout();
      return resultProfile.message;
    }
    final nurse = resultProfile.data;

    final resultPosyandu = await getPosyandu(nurse.posyanduId);
    if (!resultPosyandu.isSuccess()) {
      // if no profile, kick the user to logout
      await doLogout();
      return resultPosyandu.message;
    }
    final posyandu = resultPosyandu.data;

    await saveToPref(nurse, posyandu);
    return Status.success;
  }

  Future<BaseResponse<Nurse>> doLogin(String email, String password) async {
    return await _authRepository.login(email, password);
  }

  Future<BaseResponse<Nurse>> getProfile(String uid) async {
    return await _nurseRepositoryFirebase.getProfile(uid: uid);
  }

  Future<BaseResponse<Posyandu>> getPosyandu(String posyanduId) async {
    return await _posyanduRepositoryFirebase.getPosyandu(
        posyanduId: posyanduId);
  }

  Future saveToPref(Nurse nurse, Posyandu posyandu) async {
    await _nurseRepositoryPref.saveProfile(nurse);
    await _posyanduRepositoryPref.savePosyandu(posyandu);
  }

  Future doLogout() async {
    await _appPreferance.clearPref();
    await _authRepository.logout();
  }
}
