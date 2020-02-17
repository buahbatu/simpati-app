import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
                Row(
                  children: <Widget>[
                    Expanded(
                      child: FlatButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6),
                            side: BorderSide(width: 1, color: Colors.black26)),
                        onPressed: () {},
                        child: Column(
                          children: <Widget>[
                            SvgPicture.asset('assets/undraw_girl.svg',
                                height: 120),
                            Container(height: 4),
                            Text('Cewek', style: AppTextStyle.titleName),
                            Container(height: 8),
                          ],
                        ),
                      ),
                    ),
                    Container(width: 8),
                    Expanded(
                      child: FlatButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6),
                            side: BorderSide(width: 1, color: Colors.black26)),
                        onPressed: () {},
                        child: Column(
                          children: <Widget>[
                            SvgPicture.asset('assets/undraw_boy.svg',
                                height: 120),
                            Container(height: 4),
                            Text('Cowok', style: AppTextStyle.titleName),
                            Container(height: 8),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
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
                FormUtils.buildField('Golongan Darah', isEnabled: false),
                Container(height: 8),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: FormUtils.buildField('Tinggi Badan', suffix: 'cm'),
                    ),
                    Container(width: 8),
                    Expanded(
                      child: FormUtils.buildField('Berat Badan', suffix: 'Kg'),
                    ),
                  ],
                ),
                Container(height: 8),
                FormUtils.buildField('Suhu Badan', suffix: '°C'),
                Container(height: 8),
                FormUtils.buildField('Lingkar Kepala', suffix: 'cm'),
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
