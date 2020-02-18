import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:simpati/core/result/base_response.dart';
import 'package:simpati/domain/entity/posyandu.dart';

abstract class IPosyanduRepository {
  Future<BaseResponse<Posyandu>> getPosyandu({String posyanduId});
  Future<BaseResponse> savePosyandu(Posyandu nurse);

  Future<BaseResponse> updateCount(
    String fieldName,
    FieldValue increaser, {
    Posyandu posyandu,
  });
}
