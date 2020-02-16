import 'package:simpati/core/tools/app_preference.dart';
import 'package:simpati/data/firebase/auth_repository.dart';
import 'package:simpati/data/firebase/nurse_repository_firebase.dart';
import 'package:simpati/data/firebase/posyandu_repository_firebase.dart';
import 'package:simpati/data/local/nurse_repository_pref.dart';
import 'package:simpati/data/local/posyandu_repository_pref.dart';
import 'package:simpati/domain/repository/auth_repository.dart';
import 'package:simpati/domain/repository/nurse_repository.dart';
import 'package:simpati/domain/repository/posyandu_repository.dart';

class LogoutUsecase {
  final IAuthRepository _authRepository;
  final INurseRepository _nurseRepositoryFirebase;
  final INurseRepository _nurseRepositoryPref;
  final IPosyanduRepository _posyanduRepositoryFirebase;
  final IPosyanduRepository _posyanduRepositoryPref;
  final AppPreferance _appPreferance;

  LogoutUsecase({
    IAuthRepository authRepository,
    INurseRepository nurseRepositoryFirebase,
    INurseRepository nurseRepositoryPref,
    IPosyanduRepository posyanduRepositoryFirebase,
    IPosyanduRepository posyanduRepositoryPref,
    AppPreferance appPreferance,
  })  : this._authRepository = authRepository ?? AuthRepository(),
        this._nurseRepositoryFirebase =
            nurseRepositoryFirebase ?? NurseRepositoryFirebase(),
        this._nurseRepositoryPref =
            nurseRepositoryPref ?? NurseRepositoryPref(),
        this._posyanduRepositoryFirebase =
            posyanduRepositoryFirebase ?? PosyanduRepositoryFirebase(),
        this._posyanduRepositoryPref =
            posyanduRepositoryPref ?? PosyanduRepositoryPref(),
        this._appPreferance = appPreferance ?? AppPreferance.get();
}
