import 'package:simpati/core/result/base_response.dart';
import 'package:simpati/data/firebase/base_firestore_repo.dart';
import 'package:simpati/domain/entity/mother.dart';
import 'package:simpati/domain/entity/pregnancy.dart';
import 'package:simpati/domain/repository/pregnancy_repository.dart';

class PregnancyRepository extends BaseFirestoreRepo
    implements IPregnancyRepository {
  @override
  Future<BaseResponse<Pregnancy>> addPregnancy(
    Mother mother,
    Pregnancy pregnancy,
  ) async {
    await firestore
        .collection('mothers')
        .document(mother.id)
        .collection('pregnancy')
        .add(pregnancy.toMap());

    return BaseResponse(
      null,
      Status.success,
      'add pregnancy success',
      pregnancy,
    );
  }

  @override
  Future<BaseResponse<PregnancyList>> getAllPregnancy(Mother mother) async {
    final snapshots = await firestore
        .collection('mothers')
        .document(mother.id)
        .collection('pregnancy')
        .orderBy('lastMenstruation')
        .getDocuments();

    final pregnancies = snapshots.documents
        .map((e) => parserFactory.decode<Pregnancy>(e.data))
        .toList();

    return BaseResponse(
      null,
      Status.success,
      'Load pregnancies success',
      PregnancyList(pregnancies),
    );
  }
}
