import 'package:simpati/core/result/base_response.dart';
import 'package:simpati/domain/entity/mother.dart';
import 'package:simpati/domain/repository/mother_repository.dart';
import 'package:simpati/domain/repository/posyandu_repository.dart';

class LoadMomUsecase {
  final IPosyanduRepository _posyanduRepositoryPref;
  final IMotherRepository _motherRepository;

  LoadMomUsecase(this._posyanduRepositoryPref, this._motherRepository);

  Future<BaseResponse<MotherList>> start() async {
    final posyanduResult = await _posyanduRepositoryPref.getPosyandu();
    return _motherRepository.getAllMothers(posyanduResult.data);
  }
}
