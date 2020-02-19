import 'package:simpati/core/result/base_response.dart';
import 'package:simpati/domain/entity/child.dart';
import 'package:simpati/domain/entity/child_check.dart';
import 'package:simpati/domain/repository/child_repository.dart';

class CreateChildCheckUsecase {
  final IChildRepository _childRepository;

  CreateChildCheckUsecase(this._childRepository);

  Future<BaseResponse<ChildCheck>> start(Child child, ChildCheck data) async {
    return _childRepository.addMedCheck(child, data);
  }
}
