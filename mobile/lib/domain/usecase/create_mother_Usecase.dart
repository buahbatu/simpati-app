import 'package:simpati/core/result/base_response.dart';
import 'package:simpati/domain/entity/mother.dart';
import 'package:simpati/domain/repository/mother_repository.dart';
import 'package:simpati/domain/repository/posyandu_repository.dart';

class CreateMotherUsecase {
  final IMotherRepository _motherRepository;
  final IPosyanduRepository _posyanduRepositoryPref;

  CreateMotherUsecase(
    this._motherRepository,
    this._posyanduRepositoryPref,
  );

  Future<BaseResponse<Mother>> start(Mother mother) async {
    final posyanduResult = await _posyanduRepositoryPref.getPosyandu();
    return await _motherRepository.addMother(posyanduResult.data, mother);
  }
}
