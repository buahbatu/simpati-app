import 'package:bloc/bloc.dart';
import 'package:simpati/core/result/base_response.dart';
import 'package:simpati/core/tools/app_preference.dart';
import 'package:simpati/data/firebase/auth_repository.dart';
import 'package:simpati/data/firebase/nurse_repository_firebase.dart';
import 'package:simpati/data/firebase/posyandu_repository_firebase.dart';
import 'package:simpati/data/local/nurse_repository_pref.dart';
import 'package:simpati/data/local/posyandu_repository_pref.dart';
import 'package:simpati/domain/repository/auth_repository.dart';
import 'package:simpati/domain/repository/nurse_repository.dart';
import 'package:simpati/domain/repository/posyandu_repository.dart';
import 'package:simpati/domain/usecase/login_usecase.dart';

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
  final LoginUsecase _loginUsecase;

  // credential
  String email;
  String password;

  // message
  String message;

  AuthBloc({
    IAuthRepository authRepository,
    INurseRepository nurseRepositoryFirebase,
    INurseRepository nurseRepositoryPref,
    IPosyanduRepository posyanduRepositoryFirebase,
    IPosyanduRepository posyanduRepositoryPref,
    AppPreferance appPreferance,
  }) : this._loginUsecase = LoginUsecase(
          authRepository ?? AuthRepository(),
          nurseRepositoryFirebase ?? NurseRepositoryFirebase(),
          nurseRepositoryPref ?? NurseRepositoryPref(),
          posyanduRepositoryFirebase ?? PosyanduRepositoryFirebase(),
          posyanduRepositoryPref ?? PosyanduRepositoryPref(),
          appPreferance ?? AppPreferance.get(),
        );

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
      message = await _loginUsecase.start(email, password);

      if (message != Status.success) {
        yield AuthState.AuthError;
        return;
      }

      message = 'Login Berhasil';
      yield AuthState.AuthSuccess;
    }
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
