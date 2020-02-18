import 'package:simpati/core/result/base_response.dart';
import 'package:simpati/data/firebase/base_firestore_repo.dart';
import 'package:simpati/domain/entity/child.dart';
import 'package:simpati/domain/entity/posyandu.dart';
import 'package:simpati/domain/repository/child_repository.dart';

class ChildRepository extends BaseFirestoreRepo implements IChildRepository {
  @override
  Future<BaseResponse<Child>> addChild(Posyandu posyandu, Child child) async {
    final newChild = child.copyWith(posyanduId: posyandu.id);
    final data = await firestore.collection('childs').add(newChild.toMap());
    final endMother = newChild.copyWith(id: data.documentID);
    data.updateData({'id': data.documentID});

    return BaseResponse(
      null,
      Status.success,
      'add child success',
      endMother,
    );
  }

  @override
  Future<BaseResponse<ChildList>> getAllChilds(Posyandu posyandu) async {
    final snapshots = await firestore
        .collection('childs')
        .orderBy('fullName')
        .where('posyanduId', isEqualTo: posyandu.id)
        .getDocuments();

    final childs = snapshots.documents
        .map((e) => parserFactory.decode<Child>(e.data))
        .toList();

    return BaseResponse(
      null,
      Status.success,
      'Load childs success',
      ChildList(childs),
    );
  }
}
