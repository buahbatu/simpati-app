import 'package:simpati/core/domain/model/child_info.dart';
import 'package:simpati/core/domain/model/mother.dart';
import 'package:simpati/core/domain/model/mother_info.dart';
import 'package:simpati/core/domain/model/mother_model.dart';
import 'package:simpati/core/domain/request/mother_request.dart';
import 'package:simpati/core/repository/base_repository.dart';
import 'package:simpati/core/repository/repository.dart';

abstract class MotherRepository extends BaseRepository<MotherN> {
  Future<Result<MotherInfo>> getMotherById(String id);
  Future<Result<ChildInfo>> getChildByIdMother(String id);
}
