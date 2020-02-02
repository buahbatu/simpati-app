import 'package:flutter/material.dart';

class SectionData {
  final String name;
  final CardData first;
  final CardData second;

  SectionData(this.name, this.first, this.second);
}

class CardData {
  final String value;
  final String desc;
  final String unit;
  final bool isNextLine;
  final IconData iconData;

  CardData(
    this.desc,
    this.value,
    this.unit, {
    this.iconData,
    this.isNextLine = true,
  });
}
