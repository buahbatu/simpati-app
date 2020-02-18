import 'package:simpati/core/result/base_response.dart';
import 'package:simpati/core/tools/data_parser_factory.dart';
import 'package:simpati/domain/entity/article.dart';
import 'package:simpati/domain/entity/auth_info.dart';
import 'package:simpati/domain/entity/child.dart';
import 'package:simpati/domain/entity/mother.dart';
import 'package:simpati/domain/entity/recap_config.dart';
import 'package:simpati/domain/entity/nurse.dart';
import 'package:simpati/domain/entity/posyandu.dart';
import 'package:simpati/domain/entity/recap.dart';

class EntityRegister {
  void register() {
    DataParserFactory.get().registerDecoder(BaseResponse.fromMap);
    DataParserFactory.get().registerDecoder(AuthInfo.fromMap);
    DataParserFactory.get().registerDecoder(Nurse.fromMap);
    DataParserFactory.get().registerDecoder(Posyandu.fromMap);
    DataParserFactory.get().registerDecoder(PersonMeta.fromMap);
    DataParserFactory.get().registerDecoder(RecapList.fromMap);
    DataParserFactory.get().registerDecoder(Recap.fromMap);
    DataParserFactory.get().registerDecoder(MetaConfig.fromMap);
    DataParserFactory.get().registerDecoder(MetaConfigList.fromMap);
    DataParserFactory.get().registerDecoder(Article.fromMap);
    DataParserFactory.get().registerDecoder(ArticleList.fromMap);
    DataParserFactory.get().registerDecoder(Child.fromMap);
    DataParserFactory.get().registerDecoder(ChildList.fromMap);
    DataParserFactory.get().registerDecoder(Mother.fromMap);
    DataParserFactory.get().registerDecoder(MotherList.fromMap);
  }

  // instance
  static EntityRegister _instance = EntityRegister();
  static EntityRegister get() => _instance;
}
