import 'package:flutter/material.dart';

class SectionData {
  final String name;
  final CardData first;
  final CardData second;

  SectionData(this.name, this.first, this.second);
}

class CardData {
  final IconData iconData;
  final String value;
  final String desc;

  CardData(this.desc, this.value, {this.iconData});
}
