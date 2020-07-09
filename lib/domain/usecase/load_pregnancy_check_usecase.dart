import 'package:simpati/core/result/base_response.dart';
import 'package:simpati/domain/entity/mother.dart';
import 'package:simpati/domain/entity/pregnancy.dart';
import 'package:simpati/domain/entity/pregnancy_check.dart';
import 'package:simpati/domain/repository/pregnancy_repository.dart';

class LoadPregnancyCheckUsecase {
  final IPregnancyRepository _pregnancyRepository;

  LoadPregnancyCheckUsecase(this._pregnancyRepository);

  Future<BaseResponse<PregnancyCheckList>> start(
    Mother mother,
    Pregnancy pregnancy,
  ) async {
    return _pregnancyRepository.getAllMedCheck(mother, pregnancy);
  }
}
