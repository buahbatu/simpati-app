import 'package:simpati/core/result/base_response.dart';
import 'package:simpati/domain/entity/mother.dart';
import 'package:simpati/domain/entity/pregnancy.dart';
import 'package:simpati/domain/repository/pregnancy_repository.dart';

class LoadPregnancyUsecase {
  final IPregnancyRepository _pregnancyRepository;

  LoadPregnancyUsecase(this._pregnancyRepository);

  Future<BaseResponse<PregnancyList>> start(Mother mother) async {
    return _pregnancyRepository.getAllPregnancy(mother);
  }
}
