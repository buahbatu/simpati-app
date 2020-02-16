import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:simpati/core/result/base_data.dart';
import 'package:simpati/core/result/base_response.dart';
import 'package:simpati/core/tools/data_parser_factory.dart';
import 'package:simpati/domain/entity/posyandu.dart';
import 'package:simpati/domain/repository/posyandu_repository.dart';

class PosyanduRepositoryFirebase implements IPosyanduRepository {
  final Firestore _firestore;
  final DataParserFactory _parserFactory;

  PosyanduRepositoryFirebase(
      {Firestore firestore, DataParserFactory parserFactory})
      : this._firestore = firestore ?? Firestore.instance,
        this._parserFactory = parserFactory ?? DataParserFactory.get();

  @override
  Future<BaseResponse<Posyandu>> getPosyandu({String posyanduId}) async {
    final document =
        await _firestore.collection(_key).document(posyanduId).get();
    final Posyandu posyandu = _parserFactory.decode(document.data);
    return BaseResponse<Posyandu>(
      document.data,
      Status.success,
      'Posyandu Loaded',
      posyandu,
    );
  }

  @override
  Future<BaseResponse<Data>> savePosyandu(Posyandu posyandu) async {
    await _firestore
        .collection(_key)
        .document(posyandu.id)
        .setData(posyandu.toMap());
    return BaseResponse(
        null, Status.success, 'Data berhasil disimpan', posyandu);
  }

  static String _key = 'posyandu';
}
