import 'package:flutter/material.dart';
import 'package:simpati/core/resources/app_color.dart';
import 'package:simpati/core/resources/app_text_style.dart';
import 'package:simpati/core/utils/form_utils.dart';

class Step1AddKid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 21, right: 21, bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('Data Anak', style: AppTextStyle.registerTitle),
          Text(
            'Lengkapi data Anak dan  Ibu dan pastikan dieja secara benar',
            style: AppTextStyle.titleName.copyWith(fontSize: 12),
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                Container(height: 24),
                FormUtils.buildField('Nama Lengkap'),
                Container(height: 8),
                FormUtils.buildField('Tanggal Lahir', isEnabled: false),
                Container(height: 8),
                FormUtils.buildField('Jenis Kelamin', isEnabled: false),
                Container(height: 21),
                FormUtils.buildField('Nama Ibu'),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            child: FlatButton(
              color: AppColor.primaryColor,
              textColor: Colors.white,
              onPressed: () {},
              child: Text('Lanjut'),
            ),
          )
        ],
      ),
    );
  }
}

class Step2AddKid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 21, right: 21, bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('Informasi Medis', style: AppTextStyle.registerTitle),
          Text(
            'Ukur dengan seksama untuk meningkatkan keakuratan data',
            style: AppTextStyle.titleName.copyWith(fontSize: 12),
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                Container(height: 24),
                FormUtils.buildField('Tinggi Badan', suffix: 'cm'),
                Container(height: 8),
                FormUtils.buildField('Berat Badan', suffix: 'Kg'),
                Container(height: 8),
                FormUtils.buildField('Golongan Darah', isEnabled: false),
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