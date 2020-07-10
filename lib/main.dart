import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simpati/core/resources/res_color.dart';
import 'package:simpati/core/storage/app_config.dart';
import 'package:simpati/feature/home/home_screen.dart';
import 'package:simpati/core/utils/feature_service_locator.dart';

void main() async {
  Get.setupFeatureLocator();

  await AppConfig.setup();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: ResColor.primaryColor,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomeScreen(),
    );
  }
}
