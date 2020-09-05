import 'package:flutter/material.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import 'package:get/get.dart';
import 'package:simpati/core/resources/res_color.dart';
import 'package:simpati/core/utils/framework_service_locator.dart';
import 'package:simpati/feature/home/home_screen.dart';

import 'core/utils/feature_service_locator.dart';

void main({
  FrameworkServiceLocator frSl = const FrameworkServiceLocator(),
  FeatureServiceLocator feSl = const FeatureServiceLocator(),
  Widget root = const MyApp(),
}) async {
  // DI Setup
  await frSl.setupFrameworkLocator(Get);
  await feSl.setupFeatureLocator();
  runApp(root);
}

class MyApp extends StatelessWidget {
  const MyApp();
  void setupStatusBar() {
    FlutterStatusbarcolor.setStatusBarColor(ResColor.darkBlue);
    FlutterStatusbarcolor.setStatusBarWhiteForeground(true);
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Simpati App',
      theme: ThemeData(
        primaryColor: ResColor.primaryColor,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomeScreen(),
    );
  }
}
