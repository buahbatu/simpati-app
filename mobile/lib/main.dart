import 'dart:async';

import 'package:flutter/material.dart';
import 'package:simpati/core/tools/app_loader.dart';
import 'package:simpati/core/resources/app_color.dart';
import 'package:simpati/presentation/home/screen.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';

void main() {
  runZoned<Future<void>>(() async {
    // run on splash screen
    await AppLoader.get().onAppStart();

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
