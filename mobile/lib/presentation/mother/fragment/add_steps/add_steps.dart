import 'package:flutter/material.dart';
import 'package:simpati/core/resources/app_color.dart';
import 'package:simpati/core/resources/app_text_style.dart';
import 'package:simpati/core/utils/form_utils.dart';

class Step1AddMother extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 21, right: 21, bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('Data Diri', style: AppTextStyle.registerTitle),
          Text(
            'Lengkapi data diri si Ibu dan pastikan dieja secara benar',
            style: AppTextStyle.titleName.copyWith(fontSize: 12),
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                Container(height: 24),
                FormUtils.buildField('Nama Lengkap'),
                Container(height: 8),
                FormUtils.buildField('Tanggal Lahir', isEnabled: false),
                Container(height: 21),
                FormUtils.buildField('Nama Suami'),
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

class Step2AddMother extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 21, right: 21, bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('Alamat Tinggal', style: AppTextStyle.registerTitle),
          Text(
            'Tulis dengan detail untuk mempermudah kunjugan berikutnya',
            style: AppTextStyle.titleName.copyWith(fontSize: 12),
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                Container(height: 24),
                FormUtils.buildField('Nomor Telpon'),
                Container(height: 8),
                FormUtils.buildField('Alamat'),
                Container(height: 8),
                FormUtils.buildField('Provinsi'),
                Container(height: 8),
                FormUtils.buildField('Kota'),
                Container(height: 8),
                FormUtils.buildField('Titik Koordinat', isEnabled: false),
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

class Step3AddMother extends StatelessWidget {
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
                FormUtils.buildField('Golongan Darah', isEnabled: false),
                Container(height: 8),
                FormUtils.buildField('Berat Badan', suffix: 'Kg'),
                Container(height: 8),
                FormUtils.buildField('Tekanan Darah'),
                Container(height: 8),
                FormUtils.buildField('Tinggi Badan', suffix: 'cm'),
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
