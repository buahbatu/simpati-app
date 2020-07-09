import 'package:simpati/core/result/base_response.dart';
import 'package:simpati/domain/entity/child.dart';
import 'package:simpati/domain/entity/immunization.dart';
import 'package:simpati/domain/entity/immunization_config.dart';
import 'package:simpati/domain/repository/child_repository.dart';
import 'package:simpati/domain/repository/config_repository.dart';

class LoadImmunizationUsecase {
  final IConfigRepository configRepository;
  final IChildRepository childRepository;

  LoadImmunizationUsecase(this.configRepository, this.childRepository);

  Future<BaseResponse<ImmunizationList>> start(Child child) async {
    await configRepository.initConfig();

    final configs = await configRepository
        .loadConfig<ImmunizationConfigList>('immunizationMeta');

    return await childRepository.getAllImmunization(child, configs);
  }
}
