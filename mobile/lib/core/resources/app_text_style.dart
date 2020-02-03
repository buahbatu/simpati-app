import 'package:simpati/core/resources/app_color.dart';
import 'package:flutter/material.dart';

class AppTextStyle {
  static const TextStyle title = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );

  static const TextStyle titleName = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: Colors.black38,
  );

  static TextStyle sectionTitle = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
  );

  static TextStyle registerTitle = TextStyle(
    fontSize: 21,
    fontWeight: FontWeight.bold,
    color: AppColor.primaryColor
  );

  static TextStyle sectionData = TextStyle(
    fontSize: 36,
    fontWeight: FontWeight.w500,
  );

  static const TextStyle caption = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: Colors.white,
  );

  static TextStyle calenderTitle = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.bold,
    color: AppColor.primaryColor,
  );

  static TextStyle itemTitle = TextStyle(
    fontSize: 12,
    color: Colors.black87,
  );

  static TextStyle chip = TextStyle(
    fontSize: 12,
    color: Colors.white,
  );
}
