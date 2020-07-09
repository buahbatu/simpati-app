import 'package:flutter/material.dart';

class SectionData {
  final IconData iconData;
  final String name;
  final int value;
  final String unit;
  final Gradient gradient;
  final String assetPath;
  final List<CardData> items;

  SectionData(this.iconData, this.name, this.value, this.unit, this.gradient,
      this.assetPath, this.items);
}

class CardData {
  final String desc;
  final String value;

  CardData(this.desc, this.value);
}
