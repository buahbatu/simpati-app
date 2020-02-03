import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:line_icons/line_icons.dart';
import 'package:simpati/core/resources/app_color.dart';
import 'package:simpati/core/resources/app_text_style.dart';
import 'package:simpati/domain/entity/mother.dart';
import 'package:simpati/presentation/mother/fragment/home/bloc.dart';
import 'package:simpati/presentation/mother/page/info_page.dart';

class MotherCard extends StatelessWidget {
  final Mother data;

  const MotherCard(
    this.data, {
    Key key,
  }) : super(key: key);

  void editMotherData(BuildContext context) async {
    // ignore: close_sinks
    final bloc = BlocProvider.of<MotherBloc>(context);

    final result = await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => MotherInfoPage(data),
      ),
    );

    // if data != null
    // bloc.add(Edit(Mother.mock));
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => editMotherData(context),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            CircleAvatar(
              child: Icon(LineIcons.female, color: Colors.white),
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
                      createChip('${data.childCount} Anak'),
                      createChip('Berat Ideal'),
                      createChip('Gizi Baik'),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
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
    int age = DateTime.now().year - data.dateOfBirth.year;
    final diffMonth = DateTime.now().month - data.dateOfBirth.month;
    final diffDay = DateTime.now().day - data.dateOfBirth.day;

    if (diffMonth < 0 && diffDay < 0) {
      age -= 1;
    }
    return Text(
      '$age thn',
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
          borderRadius: BorderRadius.circular(12), color: AppColor.accentColor),
      child: Text(
        title,
        style: AppTextStyle.caption.copyWith(fontSize: 10),
      ),
    );
  }
}