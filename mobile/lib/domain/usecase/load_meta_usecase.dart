import 'package:simpati/domain/entity/recap_config.dart';
import 'package:simpati/domain/repository/config_repository.dart';
import 'package:simpati/domain/repository/person_meta_repository.dart';

class LoadMetaUsecase {
  final IConfigRepository configRepository;
  final IPersonMetaRepository metaRepository;

  LoadMetaUsecase(this.configRepository, this.metaRepository);

  void start() async {
    await configRepository.initConfig();

    final motherConfig = await configRepository.loadConfig<MetaConfigList>(
      motherMetaConfig,
    );
    final childConfig = await configRepository.loadConfig<MetaConfigList>(
      childMetaConfig,
    );
    print("$motherConfig, $childConfig");
  }

  static const String motherMetaConfig = 'motherMeta';
  static const String childMetaConfig = 'childMeta';
}
