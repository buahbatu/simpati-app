import 'dart:async';

import 'package:flutter/material.dart';
import 'package:simpati/core/tools/app_loader.dart';
import 'package:simpati/core/resources/app_color.dart';
import 'package:simpati/presentation/home/screen.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';

void main() {
  // run on splash screen
  AppLoader.get().onAppStart();

  runZoned<Future<void>>(() async {
    WidgetsFlutterBinding.ensureInitialized();
    runApp(MyApp());
  }, onError: Crashlytics.instance.recordError);
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primaryColor: AppColor.primaryColor),
      home: HomeScreen(),
    );
  }
}
