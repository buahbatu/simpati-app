import 'package:flutter/material.dart';
import 'package:native_color/native_color.dart';

class AppColor {
  // solid
  static Color appBackground = HexColor('F3F3F3');
  static Color primaryColor = HexColor('F34949');
  static Color primaryDarkColor = HexColor('BD5454');
  static Color accentColor = HexColor('FF8C9F');
  static Color profileBgColor = HexColor('B4B4B4');

  // gradient
  static Gradient redGradient = LinearGradient(colors: <Color>[
    HexColor('FACD68'),
    HexColor('FC76B3'),
  ], end: Alignment.topLeft, begin: Alignment.bottomRight);

  static Gradient yellowGradient = LinearGradient(colors: <Color>[
    HexColor('FFE324'),
    HexColor('FEAD20'),
  ], end: Alignment.topLeft, begin: Alignment.bottomRight);

  static Gradient greenGradient = LinearGradient(colors: <Color>[
    HexColor('00F7A7'),
    HexColor('00D3CC'),
  ], end: Alignment.topLeft, begin: Alignment.bottomRight);
}
