import 'package:simpati/core/result/base_response.dart';
import 'package:simpati/domain/entity/child.dart';
import 'package:simpati/domain/repository/child_repository.dart';
import 'package:simpati/domain/repository/posyandu_repository.dart';

class LoadChildUsecase {
  final IPosyanduRepository _posyanduRepositoryPref;
  final IChildRepository _childRepository;

  LoadChildUsecase(this._posyanduRepositoryPref, this._childRepository);

  Future<BaseResponse<ChildList>> start() async {
    final posyanduResult = await _posyanduRepositoryPref.getPosyandu();
    return _childRepository.getAllChilds(posyanduResult.data);
  }
}
