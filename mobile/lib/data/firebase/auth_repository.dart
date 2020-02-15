import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:simpati/core/result/base_data.dart';
import 'package:simpati/core/result/base_response.dart';
import 'package:simpati/domain/entity/nurse.dart';
import 'package:simpati/domain/repository/auth_repository.dart';

class AuthRepository implements IAuthRepository {
  final FirebaseAuth _auth;

  AuthRepository({FirebaseAuth auth}) : _auth = auth ?? FirebaseAuth.instance;

  @override
  Future<BaseResponse<Nurse>> login(String email, String password) async {
    try {
      final result = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return BaseResponse(
        null,
        Status.failed,
        'Login Berhasil',
        Nurse(id: result.user.uid, email: result.user.email),
      );
    } catch (e) {
      if (e is PlatformException) {
        switch (e.code) {
          case 'ERROR_INVALID_EMAIL':
            return BaseResponse.error(
                'Kombinasi Email atau Password salah, silahkan diperiksa lagi');
            break;
          case 'ERROR_WRONG_PASSWORD':
            return BaseResponse.error(
                'Kombinasi Email atau Password salah, silahkan diperiksa lagi');
            break;
          case 'ERROR_USER_NOT_FOUND':
            return BaseResponse.error(
                'Email kamu belum terdaftar, silahkan hubungi admin');
            break;
          case 'ERROR_USER_DISABLED':
            return BaseResponse.error('Akun kamu sedang dibekukan');
            break;
          case 'ERROR_TOO_MANY_REQUESTS':
            return BaseResponse.error(
                'Terlalu banyak percobaan gagal, silahkan coba beberapa saat lagi');
            break;
          case 'ERROR_OPERATION_NOT_ALLOWED':
            return BaseResponse.error(
                'Terjadi kesalahan di server, silahkan coba beberapa saat lagi');
            break;
          case 'ERROR_NETWORK_REQUEST_FAILED':
            return BaseResponse.error('Jaringan terputus, silahkan coba lagi');
            break;
          default:
            break;
        }
      }
      return BaseResponse.error('Error tidak dikenali, silahkan coba lagi');
    }
  }

  @override
  Future<BaseResponse<Data>> logout() {
    throw UnimplementedError();
  }
}
