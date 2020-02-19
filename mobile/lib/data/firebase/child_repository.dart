import 'package:simpati/core/result/base_response.dart';
import 'package:simpati/data/firebase/base_firestore_repo.dart';
import 'package:simpati/domain/entity/child.dart';
import 'package:simpati/domain/entity/child_check.dart';
import 'package:simpati/domain/entity/posyandu.dart';
import 'package:simpati/domain/repository/child_repository.dart';

class ChildRepository extends BaseFirestoreRepo implements IChildRepository {
  @override
  Future<BaseResponse<Child>> addChild(Posyandu posyandu, Child child) async {
    final newChild = child.copyWith(posyanduId: posyandu.id);
    final data = await firestore.collection('childs').add(newChild.toMap());
    final endMother = newChild.copyWith(id: data.documentID);
    await data.updateData({'id': data.documentID});

    return BaseResponse(
      null,
      Status.success,
      'add child success',
      endMother,
    );
  }

  @override
  Future<BaseResponse<ChildList>> getAllChilds(ChildFilter filter) async {
    final snapshots = await firestore
        .collection('childs')
        .orderBy('fullName')
        .where(filter.field, isEqualTo: filter.equalToValue)
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

  @override
  Future<BaseResponse<ChildCheck>> addMedCheck(
      Child child, ChildCheck data) async {
    await firestore
        .collection('childs')
        .document(child.id)
        .collection('checkUp')
        .add(data.toMap());

    return BaseResponse(null, Status.success, 'add child success', data);
  }

  @override
  Future<BaseResponse<ChildCheckList>> getAllMedCheck(Child child) async {
    final snapshots = await firestore
        .collection('childs')
        .document(child.id)
        .collection('checkUp')
        .orderBy('createdAt')
        .getDocuments();

    final checks = snapshots.documents
        .map((e) => parserFactory.decode<ChildCheck>(e.data))
        .toList();

    return BaseResponse(
      null,
      Status.success,
      'Load childs success',
      ChildCheckList(checks),
    );
  }
}
