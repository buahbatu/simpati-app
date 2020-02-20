import 'package:simpati/core/result/base_response.dart';
import 'package:simpati/domain/entity/mother.dart';
import 'package:simpati/domain/entity/pregnancy.dart';
import 'package:simpati/domain/repository/pregnancy_repository.dart';

class CreatePregnancyUsecase {
  final IPregnancyRepository _pregnancyRepository;

  CreatePregnancyUsecase(this._pregnancyRepository);

  Future<BaseResponse<Pregnancy>> start(
      Mother mother, Pregnancy pregnancy) async {
    return _pregnancyRepository.addPregnancy(mother, pregnancy);
  }
}
