import 'package:flutter/material.dart';
import 'package:simpati/core/resources/app_color.dart';
import 'package:simpati/core/resources/app_text_style.dart';

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
                buildField('Nama Lengkap'),
                Container(height: 8),
                buildField('Tanggal Lahir', isEnabled: false),
                Container(height: 8),
                buildField('Jenis Kelamin', isEnabled: false),
                Container(height: 21),
                buildField('Nama Ibu'),
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

  TextFormField buildField(
    String label, {
    bool isEnabled = true,
    String suffix,
  }) {
    return TextFormField(
      maxLines: 1,
      textInputAction: TextInputAction.next,
      enabled: isEnabled,
      decoration: InputDecoration(
        labelText: label,
        alignLabelWithHint: true,
        isDense: true,
        suffixText: suffix,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
        ),
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
                buildField('Tinggi Badan', suffix: 'cm'),
                Container(height: 8),
                buildField('Berat Badan', suffix: 'Kg'),
                Container(height: 8),
                buildField('Golongan Darah', isEnabled: false),
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

  TextFormField buildField(
    String label, {
    bool isEnabled = true,
    String suffix,
  }) {
    return TextFormField(
      maxLines: 1,
      textInputAction: TextInputAction.next,
      enabled: isEnabled,
      decoration: InputDecoration(
        labelText: label,
        alignLabelWithHint: true,
        isDense: true,
        suffixText: suffix,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
        ),
      ),
    );
  }
}
