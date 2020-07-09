import 'package:simpati/core/result/base_response.dart';
import 'package:simpati/domain/entity/child.dart';
import 'package:simpati/domain/repository/child_repository.dart';
import 'package:simpati/domain/repository/posyandu_repository.dart';

class CreateChildUsecase {
  final IChildRepository _childRepository;
  final IPosyanduRepository _posyanduRepositoryPref;

  CreateChildUsecase(
    this._childRepository,
    this._posyanduRepositoryPref,
  );

  Future<BaseResponse<Child>> start(Child child) async {
    final posyanduResult = await _posyanduRepositoryPref.getPosyandu();
    return await _childRepository.addChild(posyanduResult.data, child);
  }
}
