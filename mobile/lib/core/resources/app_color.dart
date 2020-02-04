import 'package:flutter/material.dart';
import 'package:native_color/native_color.dart';

class AppColor {
  // solid
  static Color appBackground = HexColor('F3F3F3');
  static Color primaryColor = HexColor('F34949');
  static Color accentColor = HexColor('FF8C9F');
  static Color profileBgColor = HexColor('B4B4B4');

  // gradient
  static Gradient cardGradient = LinearGradient(colors: <Color>[
    HexColor('9531F6'),
    HexColor('2D72F1'),
  ]);

  // gradient
  static Gradient budgetGradient = LinearGradient(colors: <Color>[
    HexColor('5581F1'),
    HexColor('1153FC'),
  ], end: Alignment.topLeft, begin: Alignment.bottomRight);

  static Gradient budgetBarGradient = LinearGradient(
    colors: <Color>[
      HexColor('A1051D'),
      HexColor('F5515F'),
    ],
  );
}
