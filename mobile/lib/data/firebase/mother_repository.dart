import 'package:simpati/core/result/base_response.dart';
import 'package:simpati/data/firebase/base_firestore_repo.dart';
import 'package:simpati/domain/entity/mother.dart';
import 'package:simpati/domain/entity/posyandu.dart';
import 'package:simpati/domain/repository/mother_repository.dart';

class MotherRepository extends BaseFirestoreRepo implements IMotherRepository {
  @override
  Future<BaseResponse<Mother>> addMother(
      Posyandu posyandu, Mother mother) async {
    final newMother = mother.copyWith(posyanduId: posyandu.id);
    final data =
        await firestore.collection(collectionKey).add(newMother.toMap());
    final endMother = newMother.copyWith(id: data.documentID);
    data.updateData({'id': data.documentID});

    return BaseResponse(
      null,
      Status.success,
      'add mother success',
      endMother,
    );
  }

  @override
  Future<BaseResponse<MotherList>> getAllMothers(Posyandu posyandu) {
    // TODO: implement getAllMothers
    throw UnimplementedError();
  }

  static const String collectionKey = 'mothers';
}
