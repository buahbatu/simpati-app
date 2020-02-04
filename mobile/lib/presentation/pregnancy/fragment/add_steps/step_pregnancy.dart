import 'package:flutter/material.dart';
import 'package:simpati/core/resources/app_color.dart';
import 'package:simpati/core/resources/app_text_style.dart';
import 'package:simpati/core/utils/form_utils.dart';

class Step1AddPregnancy extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 21, right: 21, bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('Informasi Awal', style: AppTextStyle.registerTitle),
          Text(
            'Kondisi ibu pada awal masa kehamilan',
            style: AppTextStyle.titleName.copyWith(fontSize: 12),
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                Container(height: 24),
                FormUtils.buildField('Berat Awal', suffix: 'Kg'),
                Container(height: 8),
                FormUtils.buildField('Tinggi Awal', suffix: 'cm'),
                Container(height: 8),
                FormUtils.buildField('Terakhir Menstruasi', isEnabled: false),
                Container(height: 8),
                FormUtils.buildField('Periode Menstruasi', isEnabled: false),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            child: FlatButton(
              color: AppColor.primaryColor,
              textColor: Colors.white,
              onPressed: () {},
              child: Text('Simpan'),
            ),
          )
        ],
      ),
    );
  }
}
