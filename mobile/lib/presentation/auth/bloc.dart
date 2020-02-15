import 'package:bloc/bloc.dart';
import 'package:simpati/data/firebase/auth_repository.dart';
import 'package:simpati/domain/repository/auth_repository.dart';

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
  String email;
  String password;

  String errorMessage;

  AuthBloc({IAuthRepository authRepository})
      : this._authRepository = authRepository ?? AuthRepository();

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
      final isSuccess = await doLogin();

      if (isSuccess) {
        yield AuthState.AuthSuccess;
      } else {
        errorMessage = 'Email atau password tidak cocok silahkan coba lagi';
        yield AuthState.AuthError;
      }
    }
  }

  Future<bool> doLogin() async {
    final result = await _authRepository.login(email, password);
    return result.isSuccess();
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

  void main() {
    print(validateEmail("aslam@gmail.com"));
  }
}
