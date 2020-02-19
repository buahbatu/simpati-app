import 'package:simpati/core/result/base_response.dart';
import 'package:simpati/data/firebase/base_firestore_repo.dart';
import 'package:simpati/domain/entity/mother.dart';
import 'package:simpati/domain/entity/pregnancy.dart';
import 'package:simpati/domain/repository/pregnancy_repository.dart';

class PregnancyRepository extends BaseFirestoreRepo
    implements IPregnancyRepository {
  @override
  Future<BaseResponse<Pregnancy>> addPregnancy(Mother mother) async {
    // final newPregnancy = pregnancy.copyWith(posyanduId: posyandu.id);
    // final data =
    //     await firestore.collection('pregnancys').add(newPregnancy.toMap());
    // final endMother = newPregnancy.copyWith(id: data.documentID);
    // data.updateData({'id': data.documentID});

    // return BaseResponse(
    //   null,
    //   Status.success,
    //   'add pregnancy success',
    //   endMother,
    // );
  }

  @override
  Future<BaseResponse<PregnancyList>> getAllPregnancy(Mother mother) async {
    // final snapshots = await firestore
    //     .collection('pregnancys')
    //     .orderBy('fullName')
    //     .where('posyanduId', isEqualTo: posyandu.id)
    //     .getDocuments();

    // final pregnancys = snapshots.documents
    //     .map((e) => parserFactory.decode<Pregnancy>(e.data))
    //     .toList();

    // return BaseResponse(
    //   null,
    //   Status.success,
    //   'Load pregnancys success',
    //   PregnancyList(pregnancys),
    // );
  }
}
