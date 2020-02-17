import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:simpati/core/result/base_response.dart';
import 'package:simpati/domain/repository/posyandu_repository.dart';

class UpdatePosyanduSizeUsecase {
  final IPosyanduRepository _posyanduRepositoryPref;
  final IPosyanduRepository _posyanduRepositoryFirebase;

  UpdatePosyanduSizeUsecase(
    this._posyanduRepositoryPref,
    this._posyanduRepositoryFirebase,
  );

  Future<BaseResponse> start(FieldValue increaser) async {
    final posyanduResult = await _posyanduRepositoryPref.getPosyandu();

    await _posyanduRepositoryFirebase.updateMomSize(increaser,
        posyandu: posyanduResult.data);
    return BaseResponse(null, Status.success, 'Update size', null);
  }
}
