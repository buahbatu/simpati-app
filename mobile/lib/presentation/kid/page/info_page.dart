import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:simpati/core/utils/date_utils.dart';
import 'package:simpati/core/resources/app_color.dart';
import 'package:simpati/core/resources/app_text_style.dart';
import 'package:simpati/core/utils/form_utils.dart';
import 'package:simpati/domain/entity/kid.dart';

class KidInfoPage extends StatelessWidget {
  final Kid initialData;

  const KidInfoPage(this.initialData, {Key key}) : super(key: key);

  Widget createAppBar(BuildContext context) {
    return AppBar(
      elevation: 0,
      iconTheme: IconThemeData(color: AppColor.primaryColor),
      titleSpacing: 0,
      backgroundColor: Colors.white,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: createAppBar(context),
      backgroundColor: AppColor.appBackground,
      body: ListView(
        shrinkWrap: true,
        children: [
          createNameSection(),
          Container(height: 8),
          createPersonalInfo(),
          Container(height: 8),
          createCheckupHistory(),
          Container(height: 8),
          createImmunizationHistory(),
        ],
      ),
    );
  }

  Widget createNameSection() {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.only(left: 21, right: 21, bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(initialData.fullName, style: AppTextStyle.registerTitle),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Icon(LineIcons.map_marker, size: 16, color: Colors.black38),
              Container(width: 4),
              Text(
                initialData.address,
                style: AppTextStyle.titleName.copyWith(fontSize: 12),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget createPersonalInfo() {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 21, vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('Data Pribadi', style: AppTextStyle.sectionTitle),
          Container(height: 21),
          FormUtils.buildField(
            'Nama Ibu',
            value: 'Khusnaini Aghniya',
            isEnabled: false,
          ),
          Container(height: 8),
          FormUtils.buildField(
            'Tanggal Lahir',
            value: initialData.dateOfBirth.standardFormat(),
            isEnabled: false,
          ),
          Container(height: 8),
          FormUtils.buildField(
            'Golongan Darah',
            value: initialData.bloodType,
            isEnabled: false,
          ),
        ],
      ),
    );
  }

  Widget createCheckupHistory() {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 21, vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('Riwayat Periksa Kesehatan', style: AppTextStyle.sectionTitle),
          Container(height: 12),
          Wrap(
            spacing: 8,
            children: <Widget>[
              ...List.generate(
                3,
                (i) => FlatButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6),
                    side: BorderSide(color: Colors.black),
                  ),
                  child: Text('Periksa ke ${i + 1}'),
                  onPressed: () {},
                ),
              ),
              FlatButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6),
                ),
                color: AppColor.primaryColor,
                child: Text('Tambah', style: TextStyle(color: Colors.white)),
                onPressed: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget createImmunizationHistory() {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 21, vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('Riwayat Imunisasi', style: AppTextStyle.sectionTitle),
          Container(height: 12),
          Wrap(
            spacing: 8,
            children: <Widget>[
              createImunCard(
                'BCG',
                isDone: true,
                date: DateTime.now().standardFormat(),
              ),
              createImunCard(
                'Hepatitis B ke-1',
                isDone: true,
                date: DateTime.now().standardFormat(),
              ),
              createImunCard(
                'Polio ke 0',
                isDone: true,
                date: DateTime.now().standardFormat(),
              ),
              createImunCard('Hepatitis B ke-2', isDone: false),
              createImunCard('Polio ke 1', isDone: false),
              createImunCard('Polio ke 2', isDone: false),
            ],
          ),
        ],
      ),
    );
  }

  FlatButton createImunCard(
    String title, {
    String date = '',
    bool isDone = false,
  }) {
    final color = isDone ? AppColor.primaryColor : Colors.black38;
    return FlatButton(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(6),
        side: BorderSide(color: color),
      ),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(title, style: TextStyle(color: color)),
                if (isDone)
                  Text(date, style: TextStyle(color: color, fontSize: 10)),
              ],
            ),
          ),
          if (isDone) Icon(LineIcons.check, color: color),
        ],
      ),
      onPressed: isDone ? null : () {},
    );
  }
}
