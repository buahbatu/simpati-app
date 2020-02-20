import 'package:simpati/core/result/base_response.dart';
import 'package:simpati/domain/entity/child.dart';
import 'package:simpati/domain/entity/immunization.dart';
import 'package:simpati/domain/repository/child_repository.dart';

class CreateImmunizationUsecase {
  final IChildRepository _childRepository;

  CreateImmunizationUsecase(this._childRepository);

  Future<BaseResponse<Immunization>> start(
    Child child,
    Immunization immunization,
  ) async {
    return _childRepository.addImmunization(child, immunization);
  }
}
