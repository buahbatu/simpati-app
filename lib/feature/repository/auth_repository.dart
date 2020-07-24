import 'package:simpati/core/domain/model/auth_model.dart';
import 'package:simpati/core/repository/base_repository.dart';
import 'package:simpati/core/repository/result.dart';

abstract class AuthRepository extends BaseRepository<Auth> {
  Future<Result<Auth>> login(String email, String password);
}
