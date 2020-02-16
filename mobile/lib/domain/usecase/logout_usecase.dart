import 'package:simpati/core/tools/app_preference.dart';
import 'package:simpati/data/firebase/auth_repository.dart';
import 'package:simpati/domain/repository/auth_repository.dart';

class LogoutUsecase {
  final IAuthRepository _authRepository;
  final AppPreferance _appPreferance;

  LogoutUsecase({
    IAuthRepository authRepository,
    AppPreferance appPreferance,
  })  : this._authRepository = authRepository ?? AuthRepository(),
        this._appPreferance = appPreferance ?? AppPreferance.get();

  void start() async {
    await _appPreferance.clearPref();
    await _authRepository.logout();
  }
}
