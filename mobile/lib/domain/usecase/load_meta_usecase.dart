import 'package:simpati/core/result/base_response.dart';
import 'package:simpati/domain/entity/recap.dart';
import 'package:simpati/domain/entity/recap_config.dart';
import 'package:simpati/domain/repository/config_repository.dart';
import 'package:simpati/domain/repository/person_meta_repository.dart';

enum MetaUsecase { Mother, Child }

class LoadMetaUsecase {
  final IConfigRepository configRepository;
  final IPersonMetaRepository metaRepository;

  LoadMetaUsecase(this.configRepository, this.metaRepository);

  Future<BaseResponse<PersonMeta>> start(MetaUsecase metaUsecase) async {
    String configKey;
    String metaKey;
    switch (metaUsecase) {
      case MetaUsecase.Mother:
        configKey = motherMetaConfig;
        metaKey = motherMetaKey;
        break;
      default: // child
        configKey = childMetaConfig;
        metaKey = childMetaKey;
        break;
    }

    await configRepository.initConfig();

    final config = await configRepository.loadConfig<MetaConfigList>(configKey);

    return await metaRepository.getMeta(metaKey, config);
  }

  static const String motherMetaConfig = 'motherMeta';
  static const String childMetaConfig = 'childMeta';

  static const String motherMetaKey = 'mothers';
  static const String childMetaKey = 'childs';
}
