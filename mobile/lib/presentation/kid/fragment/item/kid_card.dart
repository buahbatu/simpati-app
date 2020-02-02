import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:simpati/core/resources/app_color.dart';
import 'package:simpati/core/resources/app_text_style.dart';
import 'package:simpati/domain/entity/kid.dart';

class KidCard extends StatelessWidget {
  final Kid data;

  const KidCard(
    this.data, {
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          CircleAvatar(
            child: Icon(LineIcons.child, color: Colors.white),
            backgroundColor: Colors.black26,
          ),
          Container(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    createName(),
                    createAge(),
                  ],
                ),
                createAddress(),
                Container(height: 8),
                Wrap(
                  spacing: 4,
                  children: <Widget>[
                    createChip('Ibu Sophia'),
                    createChip('Gemuk'),
                    createChip('Gizi Baik'),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Text createAddress() {
    return Text(
      data.address,
      style: AppTextStyle.caption.copyWith(color: Colors.black38),
    );
  }

  Text createAge() {
    int month = DateTime.now().month - data.dateOfBirth.month;
    final diffYear = DateTime.now().year - data.dateOfBirth.year;
    month += 12 * diffYear;

    final diffDay = DateTime.now().day - data.dateOfBirth.day;

    if (diffDay < 0) {
      month -= 1;
    }
    return Text(
      '$month bln',
      style: AppTextStyle.caption.copyWith(color: Colors.black87),
    );
  }

  Text createName() {
    return Text(
      data.fullName,
      style: AppTextStyle.sectionData.copyWith(fontSize: 14),
    );
  }

  Container createChip(String title) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: AppColor.accentColor),
      child: Text(
        title,
        style: AppTextStyle.caption.copyWith(fontSize: 10),
      ),
    );
  }
}
