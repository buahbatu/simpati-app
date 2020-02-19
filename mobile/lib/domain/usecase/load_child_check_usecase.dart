import 'package:simpati/core/result/base_response.dart';
import 'package:simpati/domain/entity/child.dart';
import 'package:simpati/domain/entity/child_check.dart';
import 'package:simpati/domain/repository/child_repository.dart';

class LoadChildCheckUsecase {
  final IChildRepository _childRepository;

  LoadChildCheckUsecase(this._childRepository);

  Future<BaseResponse<ChildCheckList>> start(Child child) async {
    return _childRepository.getAllMedCheck(child);
  }
}
