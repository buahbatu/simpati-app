import 'package:simpati/core/result/base_response.dart';
import 'package:simpati/domain/entity/recap.dart';
import 'package:simpati/domain/entity/recap_config.dart';

abstract class IPersonMetaRepository {
  Future<BaseResponse<PersonMeta>> getMeta(
    String key,
    MetaConfigList metaConfigList,
  );
}
