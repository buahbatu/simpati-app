import 'package:simpati/core/result/base_response.dart';
import 'package:simpati/domain/entity/recap_config.dart';
import 'package:simpati/domain/repository/config_repository.dart';
import 'package:simpati/domain/repository/person_meta_repository.dart';
import 'package:simpati/domain/usecase/person_meta_usecase.dart';

class UpdatePersonMetaUsecase {
  final IConfigRepository configRepository;
  final IPersonMetaRepository metaRepository;

  UpdatePersonMetaUsecase(this.configRepository, this.metaRepository);

  Future<BaseResponse> start(
    PersonMetaUsecase metaUsecase,
    String posyanduId,
  ) async {
    String configKey;
    String metaKey;
    String countKey;
    switch (metaUsecase) {
      case PersonMetaUsecase.Mother:
        configKey = motherMetaConfig;
        metaKey = motherMetaKey;
        countKey = motherMetaCount;
        break;
      default: // child
        configKey = childMetaConfig;
        metaKey = childMetaKey;
        countKey = childMetaCount;
        break;
    }

    // don't need init conifg
    await configRepository.initConfig();

    final config = await configRepository.loadConfig<MetaConfigList>(configKey);

    return await metaRepository.updateMeta(
      metaKey,
      countKey,
      config,
      posyanduId,
    );
  }
}
