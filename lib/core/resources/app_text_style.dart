import 'package:flutter/material.dart';
import 'package:simpati/core/resources/res_color.dart';

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
    color: Colors.black,
  );

  static TextStyle registerTitle = TextStyle(
    fontSize: 21,
    fontWeight: FontWeight.bold,
    color: ResColor.primaryColor,
  );

  static TextStyle sectionData = TextStyle(
    fontSize: 36,
    fontWeight: FontWeight.w500,
    color: Colors.white,
  );

  static const TextStyle caption = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: Colors.white,
  );

  static TextStyle calenderTitle = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.bold,
    color: ResColor.primaryColor,
  );

  static TextStyle itemTitle = TextStyle(
    fontSize: 14,
    color: Colors.black,
  );

  static TextStyle chip = TextStyle(
    fontSize: 12,
    color: Colors.white,
  );
}
