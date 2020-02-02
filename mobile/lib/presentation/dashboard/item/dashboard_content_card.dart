import 'package:flutter/material.dart';
import 'package:simpati/core/resources/app_color.dart';
import 'package:simpati/core/resources/app_text_style.dart';
import 'package:simpati/presentation/dashboard/item/data.dart';

class DashboardContentCard extends StatelessWidget {
  final CardData cardData;

  const DashboardContentCard(this.cardData, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  if (cardData.iconData != null)
                    Icon(cardData.iconData, size: 28),
                  Container(width: 2),
                  Text(
                    cardData.desc,
                    style: AppTextStyle.sectionData.copyWith(fontSize: 16),
                  ),
                ],
              ),
              Container(height: 8),
              Row(
                children: <Widget>[
                  Text(
                    cardData.value,
                    style: AppTextStyle.sectionData,
                    textAlign: TextAlign.end,
                  ),
                  if (!cardData.isNextLine)
                    Text(
                      cardData.unit,
                      style: AppTextStyle.sectionData.copyWith(
                        fontSize: 16,
                        color: Colors.black54,
                      ),
                    ),
                ],
              ),
              if (cardData.isNextLine)
                Text(
                  cardData.unit,
                  style: AppTextStyle.sectionData.copyWith(
                    fontSize: 12,
                    color: Colors.black54,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
