import 'package:simpati/core/result/base_response.dart';
import 'package:simpati/data/firebase/base_firestore_repo.dart';
import 'package:simpati/domain/entity/mother.dart';
import 'package:simpati/domain/entity/pregnancy.dart';
import 'package:simpati/domain/entity/pregnancy_check.dart';
import 'package:simpati/domain/repository/pregnancy_repository.dart';

class PregnancyRepository extends BaseFirestoreRepo
    implements IPregnancyRepository {
  @override
  Future<BaseResponse<Pregnancy>> addPregnancy(
    Mother mother,
    Pregnancy pregnancy,
  ) async {
    final data = await firestore
        .collection('mothers')
        .document(mother.id)
        .collection('pregnancy')
        .add(pregnancy.toMap());

    await data.updateData({'id': data.documentID});

    return BaseResponse(
      null,
      Status.success,
      'add pregnancy success',
      pregnancy.copyWith(id: data.documentID),
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

  @override
  Future<BaseResponse<PregnancyCheck>> addMedCheck(
    Mother mother,
    Pregnancy pregnancy,
    PregnancyCheck pregnancyCheck,
  ) async {
    final data = await firestore
        .collection('mothers')
        .document(mother.id)
        .collection('pregnancy')
        .document(pregnancy.id)
        .collection('checkUp')
        .add(pregnancyCheck.toMap());

    await data.updateData({'id': data.documentID});

    return BaseResponse(
      null,
      Status.success,
      'add pregnancy check success',
      pregnancyCheck,
    );
  }

  @override
  Future<BaseResponse<PregnancyCheckList>> getAllMedCheck(
    Mother mother,
    Pregnancy pregnancy,
  ) async {
    final snapshots = await firestore
        .collection('mothers')
        .document(mother.id)
        .collection('pregnancy')
        .document(pregnancy.id)
        .collection('checkUp')
        .orderBy('createdAt')
        .getDocuments();

    final pregnancies = snapshots.documents
        .map((e) => parserFactory.decode<PregnancyCheck>(e.data))
        .toList();

    return BaseResponse(
      null,
      Status.success,
      'Load pregnancy checks success',
      PregnancyCheckList(pregnancies),
    );
  }
}
