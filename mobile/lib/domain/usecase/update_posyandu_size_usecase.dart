import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:simpati/core/result/base_response.dart';
import 'package:simpati/domain/repository/posyandu_repository.dart';
import 'package:simpati/domain/usecase/person_meta_usecase.dart';

class UpdatePosyanduSizeUsecase {
  final IPosyanduRepository _posyanduRepositoryPref;
  final IPosyanduRepository _posyanduRepositoryFirebase;

  UpdatePosyanduSizeUsecase(
    this._posyanduRepositoryPref,
    this._posyanduRepositoryFirebase,
  );

  Future<BaseResponse> start(
    PersonMetaUsecase metaUsecase,
    FieldValue increaser,
  ) async {
    final posyanduResult = await _posyanduRepositoryPref.getPosyandu();

    String field;
    switch (metaUsecase) {
      case PersonMetaUsecase.Mother:
        field = 'childCount';
        break;
      case PersonMetaUsecase.Child:
        field = 'momCount';
        break;
      default:
        throw ArgumentError('Not known value');
    }

    await _posyanduRepositoryFirebase.updateCount(
      field,
      increaser,
      posyandu: posyanduResult.data,
    );
    return BaseResponse(null, Status.success, 'Update size', null);
  }
}
