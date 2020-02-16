import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:simpati/core/result/base_data.dart';
import 'package:simpati/core/result/base_response.dart';
import 'package:simpati/core/tools/data_parser_factory.dart';
import 'package:simpati/domain/entity/nurse.dart';
import 'package:simpati/domain/repository/nurse_repository.dart';

class NurseRepositoryFirebase implements INurseRepository {
  final Firestore _firestore;
  final DataParserFactory _parserFactory;

  NurseRepositoryFirebase(
      {Firestore firestore, DataParserFactory parserFactory})
      : this._firestore = firestore ?? Firestore.instance,
        this._parserFactory = parserFactory ?? DataParserFactory.get();

  @override
  Future<BaseResponse<Nurse>> getProfile({String uid}) async {
    final document = await _firestore.collection(_key).document(uid).get();
    final Nurse nurse = _parserFactory.decode(document.data);
    return BaseResponse<Nurse>(
      document.data,
      Status.success,
      'Profile Loaded',
      nurse,
    );
  }

  @override
  Future<BaseResponse<Data>> saveProfile(Nurse nurse) async {
    await _firestore.collection(_key).document(nurse.id).setData(nurse.toMap());
    return BaseResponse(null, Status.success, 'Data berhasil disimpan', nurse);
  }

  static String _key = 'users';
}
