import 'package:simpati/core/result/base_response.dart';
import 'package:simpati/domain/entity/mother.dart';
import 'package:simpati/domain/entity/posyandu.dart';

abstract class IMotherRepository {
  Future<BaseResponse<Mother>> addMother(Posyandu posyandu, Mother mother);
  Future<BaseResponse<MotherList>> getAllMothers(Posyandu posyandu);
}
