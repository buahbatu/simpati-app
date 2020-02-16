import 'package:bloc/bloc.dart';
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

class AuthEvent {}

class AuthEmailFillEvent extends AuthEvent {
  final String data;
  AuthEmailFillEvent(this.data);
}

class AuthEmailPasswordEvent extends AuthEvent {
  final String data;
  AuthEmailPasswordEvent(this.data);
}

enum AuthState {
  Init,
  EmailEmpty,
  EmailError,
  PasswordEmpty,
  PasswordError,
  Loading,
  AuthSuccess,
  AuthError,
}

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final IAuthRepository _authRepository;
  final INurseRepository _nurseRepositoryFirebase;
  final INurseRepository _nurseRepositoryPref;
  final IPosyanduRepository _posyanduRepositoryFirebase;
  final IPosyanduRepository _posyanduRepositoryPref;
  final AppPreferance _appPreferance;

  // credential
  String email;
  String password;

  // error massage
  String errorMessage;

  // data
  Nurse nurse;
  Posyandu posyandu;

  AuthBloc({
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

  @override
  AuthState get initialState => AuthState.Init;

  @override
  Stream<AuthState> mapEventToState(AuthEvent event) async* {
    if (event is AuthEmailFillEvent) {
      email = event.data;
    } else if (event is AuthEmailPasswordEvent) {
      password = event.data;
    } else {
      if (email == null || email.isEmpty) {
        yield AuthState.EmailEmpty;
        return;
      } else if (password == null || password.isEmpty) {
        yield AuthState.PasswordEmpty;
        return;
      } else if (!validateEmail(email)) {
        yield AuthState.EmailError;
        return;
      } else if (!validatePassword(password)) {
        yield AuthState.PasswordError;
        return;
      }

      yield AuthState.Loading;
      final resultAuth = await doLogin();
      if (!resultAuth.isSuccess()) {
        errorMessage = resultAuth.message;
        yield AuthState.AuthError;
        return;
      }
      nurse = resultAuth.data;

      final resultProfile = await getProfile();
      if (!resultProfile.isSuccess()) {
        // if no profile, kick the user to logout
        await doLogout();
        errorMessage = resultProfile.message;

        yield AuthState.AuthError;
        return;
      }
      nurse = resultProfile.data;

      final resultPosyandu = await getPosyandu();
      if (!resultPosyandu.isSuccess()) {
        // if no profile, kick the user to logout
        await doLogout();
        errorMessage = resultPosyandu.message;

        yield AuthState.AuthError;
        return;
      }
      posyandu = resultPosyandu.data;

      await saveToPref();
      yield AuthState.AuthSuccess;
    }
  }

  Future<BaseResponse<Nurse>> doLogin() async {
    return await _authRepository.login(email, password);
  }

  Future<BaseResponse<Nurse>> getProfile() async {
    return await _nurseRepositoryFirebase.getProfile(uid: nurse.id);
  }

  Future<BaseResponse<Posyandu>> getPosyandu() async {
    return await _posyanduRepositoryFirebase.getPosyandu(uid: nurse.posyanduId);
  }

  Future saveToPref() async {
    await _nurseRepositoryPref.saveProfile(nurse);
    await _posyanduRepositoryPref.savePosyandu(posyandu);
  }

  Future doLogout() async {
    await _appPreferance.clearPref();
    await _authRepository.logout();
  }

  bool validateEmail(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    return regex.hasMatch(value);
  }

  bool validatePassword(String value) {
    return value.length >= 8;
  }
}
