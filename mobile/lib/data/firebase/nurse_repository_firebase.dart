import 'package:simpati/core/result/base_data.dart';
import 'package:simpati/core/result/base_response.dart';
import 'package:simpati/data/firebase/base_firestore_repo.dart';
import 'package:simpati/domain/entity/nurse.dart';
import 'package:simpati/domain/repository/nurse_repository.dart';

class NurseRepositoryFirebase extends BaseFirestoreRepo
    implements INurseRepository {
  @override
  Future<BaseResponse<Nurse>> getProfile({String uid}) async {
    final document = await firestore.collection(_key).document(uid).get();
    final Nurse nurse = parserFactory.decode(document.data);
    return BaseResponse<Nurse>(
      document.data,
      Status.success,
      'Profile Loaded',
      nurse,
    );
  }

  @override
  Future<BaseResponse<Data>> saveProfile(Nurse nurse) async {
    await firestore.collection(_key).document(nurse.id).setData(nurse.toMap());
    return BaseResponse(null, Status.success, 'Data berhasil disimpan', nurse);
  }

  static String _key = 'users';
}
