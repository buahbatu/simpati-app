import 'package:simpati/core/result/base_response.dart';
import 'package:simpati/domain/entity/posyandu.dart';

abstract class IPosyanduRepository {
  Future<BaseResponse<Posyandu>> getPosyandu({String posyanduId});
  Future<BaseResponse> savePosyandu(Posyandu nurse);
}
