import 'package:simpati/core/domain/model/child_info.dart';
import 'package:simpati/core/domain/model/mother_info.dart';
import 'package:simpati/core/repository/base_repository.dart';
import 'package:simpati/core/repository/repository.dart';
import 'package:simpati/feature/mother/model/mother.dart';
import 'package:simpati/feature/mother/model/pregnancy.dart';

abstract class MotherRepository extends BaseRepository<Mother> {
  Future<Result<ChildInfo>> getChildByIdMother(String id);
  Future<Result<Pregnancy>> addPregnancy(Pregnancy pregnancy);
}
