import 'package:get/get.dart';
import 'package:simpati/core/resources/res_data_source.dart';
import 'package:simpati/core/storage/app_config.dart';

typedef RepoSelector<T> = T Function(dynamic param1);

extension FrameworkSeriviceLocator on GetImpl {}
