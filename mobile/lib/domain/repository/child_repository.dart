import 'package:simpati/core/result/base_response.dart';
import 'package:simpati/domain/entity/child.dart';
import 'package:simpati/domain/entity/child_check.dart';
import 'package:simpati/domain/entity/posyandu.dart';

abstract class IChildRepository {
  Future<BaseResponse<Child>> addChild(Posyandu posyandu, Child child);
  Future<BaseResponse<ChildList>> getAllChilds(ChildFilter filter);

  Future<BaseResponse<ChildCheck>> addMedCheck(Child child, ChildCheck data);
  Future<BaseResponse<ChildCheckList>> getAllMedCheck(Child child);
}

class ChildFilter {
  final String field;
  final String equalToValue;

  const ChildFilter(this.field, this.equalToValue);
}
