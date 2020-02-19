import 'package:simpati/core/result/base_response.dart';
import 'package:simpati/domain/entity/mother.dart';
import 'package:simpati/domain/entity/pregnancy.dart';
import 'package:simpati/domain/entity/pregnancy_check.dart';

abstract class IPregnancyRepository {
  Future<BaseResponse<Pregnancy>> addPregnancy(
      Mother mother, Pregnancy pregnancy);
  Future<BaseResponse<PregnancyList>> getAllPregnancy(Mother mother);

  Future<BaseResponse<PregnancyCheck>> addMedCheck(
    Mother mother,
    Pregnancy pregnancy,
    PregnancyCheck pregnancyCheck,
  );
  Future<BaseResponse<PregnancyCheckList>> getAllMedCheck(
    Mother mother,
    Pregnancy pregnancy,
  );
}
