import 'package:bloc/bloc.dart';
import 'package:simpati/core/result/base_response.dart';
import 'package:simpati/data/firebase/auth_repository.dart';
import 'package:simpati/data/firebase/nurse_repository_firebase.dart';
import 'package:simpati/domain/entity/nurse.dart';
import 'package:simpati/domain/repository/auth_repository.dart';
import 'package:simpati/domain/repository/nurse_repository.dart';

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
  final INurseRepository _nurseRepository;

  // credential
  String email;
  String password;

  // error massage
  String errorMessage;

  // uid
  Nurse nurse;

  AuthBloc({IAuthRepository authRepository, INurseRepository nurseRepository})
      : this._authRepository = authRepository ?? AuthRepository(),
        this._nurseRepository = nurseRepository ?? NurseRepositoryFirebase();

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

      yield AuthState.AuthSuccess;
    }
  }

  Future<BaseResponse<Nurse>> doLogin() async {
    return await _authRepository.login(email, password);
  }

  Future<BaseResponse<Nurse>> doLogout() async {
    return await _authRepository.logout();
  }

  Future<BaseResponse<Nurse>> getProfile() async {
    return await _nurseRepository.getProfile(uid: nurse.id);
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
