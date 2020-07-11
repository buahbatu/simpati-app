import 'package:simpati/core/domain/model/auth_model.dart';
import 'package:simpati/core/framework/base_repository.dart';

abstract class AuthRepository extends BaseRepository<Auth> {
  Future<Auth> login(String email, String password);
}
