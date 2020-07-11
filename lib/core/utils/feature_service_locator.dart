import 'package:get/get.dart';
import 'package:simpati/core/domain/repository/api/auth_repository_api.dart';
import 'package:simpati/core/domain/repository/api/children_repository_api.dart';
import 'package:simpati/core/domain/repository/api/mother_repository_impl.dart';

extension FeatureServiceLocator on GetImpl {
  void setupFeatureLocator() {
    MotherRepositoryImpl.register();
    ChildrenRepositoryApi.register();
    AuthRepositoryApi.register();
  }
}
