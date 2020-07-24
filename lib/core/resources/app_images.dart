import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppImages {
  static final Widget noDataImage = SvgPicture.asset(
    'assets/undraw_no_data.svg',
    height: 120,
    semanticsLabel: 'Data Kosong',
  );
}
