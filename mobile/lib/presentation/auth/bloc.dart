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

enum AuthState { NoError, EmailEmpty, EmailError, PasswordEmpty, PasswordError }

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final IAuthRepository _authRepository;
  String email;
  String password;

  AuthBloc({IAuthRepository authRepository})
      : this._authRepository = authRepository ?? AuthRepository();

  @override
  AuthState get initialState => AuthState.NoError;

  @override
  Stream<AuthState> mapEventToState(AuthEvent event) async* {
    if (event is AuthEmailFillEvent) {
      email = event.data;
    } else if (event is AuthEmailPasswordEvent) {
      password = event.data;
    } else {
      if (email.isEmpty) {
        yield AuthState.EmailEmpty;
        return;
      } else if (password.isEmpty) {
        yield AuthState.PasswordEmpty;
        return;
      } else if (!validateEmail(email)) {
        yield AuthState.EmailError;
        return;
      } else if (!validatePassword(password)) {
        yield AuthState.PasswordError;
        return;
      }

      yield AuthState.NoError;
      await doLogin();
    }

    print('data: $email, $password');
  }

  void doLogin() async {
    await _authRepository.login(email, password);
  }

  bool validateEmail(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    print('match: ${regex.hasMatch(value)}');
    return regex.hasMatch(value);
  }

  bool validatePassword(String value) {
    return value.length >= 8;
  }

  void main() {
    print(validateEmail("aslam@gmail.com"));
  }
}
