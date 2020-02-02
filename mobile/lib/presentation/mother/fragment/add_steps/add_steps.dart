import 'package:flutter/material.dart';
import 'package:simpati/core/resources/app_color.dart';
import 'package:simpati/core/resources/app_text_style.dart';

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
                buildField('Nama Lengkap'),
                Container(height: 8),
                buildField('Nama Suami'),
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
                buildField('Nomor Telpon'),
                Container(height: 8),
                buildField('Alamat'),
                Container(height: 8),
                buildField('Provinsi'),
                Container(height: 8),
                buildField('Kota'),
                Container(height: 8),
                buildField('Titik Koordinat', isEnabled: false),
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
                buildField('Tinggi Badan', suffix: 'cm'),
                Container(height: 8),
                buildField('Berat Badan', suffix: 'Kg'),
                Container(height: 8),
                buildField('Tekanan Darah'),
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
