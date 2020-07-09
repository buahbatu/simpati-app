import 'package:simpati/core/result/base_response.dart';
import 'package:simpati/domain/entity/mother.dart';
import 'package:simpati/domain/entity/pregnancy.dart';
import 'package:simpati/domain/entity/pregnancy_check.dart';
import 'package:simpati/domain/repository/pregnancy_repository.dart';

class CreatePregnancyCheckUsecase {
  final IPregnancyRepository _pregnancyRepository;

  CreatePregnancyCheckUsecase(this._pregnancyRepository);

  Future<BaseResponse<PregnancyCheck>> start(
    Mother mother,
    Pregnancy pregnancy,
    PregnancyCheck pregnancyCheck,
  ) async {
    return _pregnancyRepository.addMedCheck(mother, pregnancy, pregnancyCheck);
  }
}
