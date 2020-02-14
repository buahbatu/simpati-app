import 'package:simpati/core/result/base_response.dart';
import 'package:simpati/core/result/result_parser_factory.dart';
import 'package:simpati/domain/entity/auth_info.dart';
import 'package:simpati/domain/entity/nurse.dart';
import 'package:simpati/domain/entity/posyandu.dart';

class EntityRegister {
  void register() {
    ResultParserFactory.get().registerDecoder(BaseResponse.fromMap);
    ResultParserFactory.get().registerDecoder(AuthInfo.fromMap);
    ResultParserFactory.get().registerDecoder(Nurse.fromMap);
    ResultParserFactory.get().registerDecoder(Posyandu.fromMap);
  }

  // instance
  static EntityRegister _instance = EntityRegister();
  static EntityRegister get() => _instance;
}
