import 'package:get/get.dart';
import 'package:simpati/feature/repository/api/auth_repository_api.dart';
import 'package:simpati/feature/repository/api/children_repository_api.dart';
import 'package:simpati/feature/repository/api/mother_repository_impl.dart';

class FeatureServiceLocator {
  static void setupFeatureLocator() {
    MotherRepositoryImpl.register();
    ChildrenRepositoryApi.register();
    AuthRepositoryApi.register();
  }
}
