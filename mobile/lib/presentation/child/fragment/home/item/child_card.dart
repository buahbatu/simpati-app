import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:line_icons/line_icons.dart';
import 'package:simpati/core/resources/app_color.dart';
import 'package:simpati/core/resources/app_text_style.dart';
import 'package:simpati/domain/entity/child.dart';
import 'package:simpati/presentation/child/fragment/home/bloc.dart';
import 'package:simpati/presentation/child/page/info_page.dart';

class ChildCard extends StatelessWidget {
  final Child data;

  const ChildCard(
    this.data, {
    Key key,
  }) : super(key: key);

  void editChildData(BuildContext context) async {
    // ignore: close_sinks
    final bloc = BlocProvider.of<ChildBloc>(context);

    final result = await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => ChildInfoPage(data),
      ),
    );

    // if data != null
    // bloc.add(Edit(Mother.mock));
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => editChildData(context),
      child: Container(
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
    int month = DateTime.now().month - data.birthDate.month;
    final diffYear = DateTime.now().year - data.birthDate.year;
    month += 12 * diffYear;

    final diffDay = DateTime.now().day - data.birthDate.day;

    if (diffDay < 0) {
      month -= 1;
    }
    return Text(
      '$month bln',
      style: AppTextStyle.caption.copyWith(color: Colors.black87),
    );
  }

  Text createName() {
    return Text(data.fullName, style: AppTextStyle.itemTitle);
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
