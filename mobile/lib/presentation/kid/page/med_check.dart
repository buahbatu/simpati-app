import 'package:flutter/material.dart';
import 'package:simpati/core/resources/app_color.dart';
import 'package:simpati/core/resources/app_text_style.dart';
import 'package:simpati/core/utils/form_utils.dart';
import 'package:simpati/core/utils/date_utils.dart';

class KidMedicalCheckDialog extends StatelessWidget {
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
                FormUtils.buildField(
                  'Berat Badan',
                  suffix: 'Kg',
                ),
                Container(height: 8),
                FormUtils.buildField(
                  'Panjang Badan',
                  suffix: 'cm',
                ),
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
