import 'package:flutter/material.dart';
import 'package:simpati/core/resources/app_color.dart';
import 'package:simpati/core/resources/app_text_style.dart';
import 'package:simpati/core/utils/form_utils.dart';
import 'package:simpati/domain/entity/mother.dart';

class AddPregnancyDialog extends StatelessWidget {
  final int index;
  final Mother motherData;

  const AddPregnancyDialog(this.index, this.motherData, {Key key})
      : super(key: key);

  Widget createAppBar(BuildContext context) {
    return AppBar(
      elevation: 0,
      iconTheme: IconThemeData(color: AppColor.primaryColor),
      titleSpacing: 0,
      backgroundColor: AppColor.appBackground,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: ListView(
        shrinkWrap: true,
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(16),
            child: Text(
              'Kehamilan ke 1',
              style: AppTextStyle.sectionTitle,
            ),
          ),
          Container(height: 8),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: <Widget>[
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
