import 'dart:convert';

import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:simpati/core/tools/data_parser_factory.dart';
import 'package:simpati/domain/repository/config_repository.dart';

class ConfigRepository implements IConfigRepository {
  final Future<RemoteConfig> _remoteConfig;
  final DataParserFactory _parserFactory;
  RemoteConfig _config;

  ConfigRepository({
    Future<RemoteConfig> remoteConfig,
    DataParserFactory parserFactory,
  })  : this._remoteConfig = remoteConfig ?? RemoteConfig.instance,
        this._parserFactory = parserFactory ?? DataParserFactory.get();

  @override
  Future initConfig({bool isDebug = false}) async {
    _config = await _remoteConfig;
    // Enable developer mode to relax fetch throttling
    _config.setConfigSettings(RemoteConfigSettings(debugMode: isDebug));

    await _config.fetch(expiration: const Duration(hours: 5));
    await _config.activateFetched();
  }

  @override
  T loadConfig<T>(String key) {
    final raw = _config.getString(key);
    final json = raw.isNotEmpty ? jsonDecode(raw) : null;
    return _parserFactory.decode<T>(json);
  }
}
