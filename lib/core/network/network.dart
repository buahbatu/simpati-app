import 'dart:io';

import 'package:simpati/core/network/NetworkToken.dart';
import 'package:simpati/core/network/network_env.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

export 'package:simpati/core/network/NetworkToken.dart';
export 'package:simpati/core/network/dio_ext.dart';
export 'package:simpati/core/network/network_env.dart';
export 'package:simpati/core/network/network_failure.dart';
export 'package:simpati/core/network/network_response.dart';

typedef OptionUpdater = BaseOptions Function(BaseOptions);
typedef DioFactory = Dio Function(BaseOptions);

class Api {
  // priva const DEFAULT_TIMEOUT = 30000; // 30ms
  static const DEFAULT_TIMEOUT = 30000; // 30ms

  @visibleForTesting
  static Dio dio;

  static Dio get v1 => updateDio();

  /// call this line after you change env
  /// or you can call [Api.dio(newEnv)] to reset it
  static void resetApi() => dio = null;

  /// don't set baseUrl in [optionUpdater] it will be override by [env.url]
  /// optionUpdater will update [BaseOption] from [defaultOptions]
  /// beware! updating header in option will drop all default header
  static Dio updateDio({
    NetworkEnv env,
    NetworkToken token,
    OptionUpdater optionUpdater,
  }) {
    // if instance is null or new env/option is inserted
    if (_apihasNewValue(env, token, optionUpdater)) {
      resetApi();

      final newOption = _updateOption(optionUpdater);
      final dioFactory = Get.find<DioFactory>();
      dio = dioFactory(newOption);
    }

    return dio;
  }

  static BaseOptions get defaultOptions {
    return BaseOptions(
      baseUrl: NetworkEnv.get().url,
      connectTimeout: DEFAULT_TIMEOUT,
      receiveTimeout: DEFAULT_TIMEOUT,
      contentType: ContentType.json.toString(),
      headers: {
        HttpHeaders.authorizationHeader: NetworkToken.get().encode(),
        HttpHeaders.acceptHeader: ContentType.json.toString()
      },
    );
  }

  static bool _apihasNewValue(
    NetworkEnv env,
    NetworkToken token,
    OptionUpdater optionUpdater,
  ) {
    // set new env or token to instance
    if (env != null && env != NetworkEnv.get()) NetworkEnv.set(env);
    if (token != null && token != NetworkToken.get()) NetworkToken.set(token);

    return dio == null || env != null || token != null || optionUpdater != null;
  }

  static BaseOptions _updateOption(OptionUpdater updater) {
    return updater != null ? updater(defaultOptions) : defaultOptions;
  }
}
