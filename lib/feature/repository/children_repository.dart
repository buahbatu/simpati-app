import 'package:simpati/core/repository/base_repository.dart';
import 'package:simpati/core/repository/result.dart';
import 'package:simpati/feature/children/model/children.dart';
import 'package:simpati/feature/children/model/children_check.dart';

abstract class ChildrenRepository extends BaseRepository<Children> {
  Future<Result<List<ChildMedicalCheckup>>> getChildMedicalCheck(String id);
}
