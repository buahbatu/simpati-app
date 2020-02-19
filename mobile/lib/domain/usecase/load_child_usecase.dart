import 'package:simpati/core/result/base_response.dart';
import 'package:simpati/domain/entity/child.dart';
import 'package:simpati/domain/repository/child_repository.dart';

class LoadChildUsecase {
  final IChildRepository _childRepository;

  LoadChildUsecase(this._childRepository);

  Future<BaseResponse<ChildList>> start(ChildFilter childFilter) async {
    return _childRepository.getAllChilds(childFilter);
  }
}
