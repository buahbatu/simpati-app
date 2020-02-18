import 'package:simpati/core/result/base_response.dart';
import 'package:simpati/domain/entity/child.dart';
import 'package:simpati/domain/entity/posyandu.dart';

abstract class IChildRepository {
  Future<BaseResponse<Child>> addChild(Posyandu posyandu, Child child);
  Future<BaseResponse<ChildList>> getAllChilds(Posyandu posyandu);
}
