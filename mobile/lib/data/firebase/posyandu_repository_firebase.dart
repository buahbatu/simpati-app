import 'package:simpati/core/result/base_data.dart';
import 'package:simpati/core/result/base_response.dart';
import 'package:simpati/data/firebase/base_firestore_repo.dart';
import 'package:simpati/domain/entity/posyandu.dart';
import 'package:simpati/domain/repository/posyandu_repository.dart';

class PosyanduRepositoryFirebase extends BaseFirestoreRepo
    implements IPosyanduRepository {
  @override
  Future<BaseResponse<Posyandu>> getPosyandu({String posyanduId}) async {
    final document =
        await firestore.collection(_key).document(posyanduId).get();
    final Posyandu posyandu = parserFactory.decode(document.data);
    return BaseResponse<Posyandu>(
      document.data,
      Status.success,
      'Posyandu Loaded',
      posyandu,
    );
  }

  @override
  Future<BaseResponse<Data>> savePosyandu(Posyandu posyandu) async {
    await firestore
        .collection(_key)
        .document(posyandu.id)
        .setData(posyandu.toMap());
    return BaseResponse(
        null, Status.success, 'Data berhasil disimpan', posyandu);
  }

  static String _key = 'posyandu';
}
