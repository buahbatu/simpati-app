import 'package:get/get.dart';
import 'package:simpati/core/domain/repository/mother_repository_impl.dart';

extension FeatureServiceLocator on GetImpl {
  void setupFeatureLocator() {
    MotherRepositoryImpl.register();
  }
}
