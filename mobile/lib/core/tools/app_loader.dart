import 'package:flutter/material.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:simpati/domain/entity/entity_register.dart';

class AppLoader {
  Future<void> onAppStart({bool isDebug = false}) async {
    // register DI for json decoder
    EntityRegister.get().register();

    // Set `enableInDevMode` to true to see reports while in debug mode
    // This is only to be used for confirming that reports are being
    // submitted as expected. It is not intended to be used for everyday
    // development.
    // Crashlytics.instance.enableInDevMode = true;

    // Pass all uncaught errors from the framework to Crashlytics.
    FlutterError.onError = Crashlytics.instance.recordFlutterError;
  }

  // instance
  static AppLoader _instance = AppLoader();
  static AppLoader get() => _instance;
}
