import 'package:flutter/material.dart';
import 'package:simpati/presentation/dashboard/item/card_data.dart';

class DashboardContentCard extends StatelessWidget {
  final double contentWidth;
  final CardData cardData;

  const DashboardContentCard(this.contentWidth, this.cardData, {Key key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
      width: contentWidth,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(4)),
      child: Column(
        children: <Widget>[
          Text(
            cardData.desc,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
          Container(height: 4),
          Text(
            cardData.value,
            style: TextStyle(fontSize: 28),
          ),
        ],
      ),
    );
  }
}
