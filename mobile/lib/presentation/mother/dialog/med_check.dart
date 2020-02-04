import 'package:flutter/material.dart';
import 'package:simpati/core/resources/app_color.dart';
import 'package:simpati/core/resources/app_text_style.dart';
import 'package:simpati/core/utils/form_utils.dart';
import 'package:simpati/core/utils/date_utils.dart';

class PregnancyMedicalCheckDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: ListView(
        shrinkWrap: true,
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(16),
            child: Text(
              'Periksa ke 1',
              style: AppTextStyle.sectionTitle,
            ),
          ),
          Container(height: 8),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: <Widget>[
                FormUtils.buildField(
                  'Tanggal Periksa',
                  value: DateTime.now().standardFormat(),
                  isEnabled: false,
                ),
                Container(height: 8),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: FormUtils.buildField(
                        'Berat Badan',
                        suffix: 'Kg',
                      ),
                    ),
                    Container(width: 8),
                    Expanded(
                      child: FormUtils.buildField(
                        'Berat Janin',
                        suffix: 'g',
                      ),
                    ),
                  ],
                ),
                Container(height: 8),
                FormUtils.buildField('Kondisi Air Ketuban', isEnabled: false),
                Container(height: 8),
                FormUtils.buildField('Prediksi Jenis Kelamin', isEnabled: false),
                Container(height: 8),
                FormUtils.buildField('Tekanan Darah', suffix: 'mmHg'),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16),
            child: FlatButton(
              color: AppColor.primaryColor,
              textColor: Colors.white,
              child: Text('Simpan'),
              onPressed: () {},
            ),
          )
        ],
      ),
    );
  }
}
