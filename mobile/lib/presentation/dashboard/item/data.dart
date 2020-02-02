import 'package:flutter/material.dart';

class SectionData {
  final String name;
  final List<CardData> items;

  SectionData(this.name, this.items);
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
