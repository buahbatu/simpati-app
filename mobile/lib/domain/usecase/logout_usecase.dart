import 'package:simpati/core/tools/app_preference.dart';
import 'package:simpati/domain/repository/auth_repository.dart';

class LogoutUsecase {
  final IAuthRepository _authRepository;
  final AppPreferance _appPreferance;

  LogoutUsecase(this._authRepository, this._appPreferance);

  void start() async {
    await _appPreferance.clearPref();
    await _authRepository.logout();
  }
}
