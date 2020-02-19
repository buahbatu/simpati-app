import 'package:flutter/material.dart';
import 'package:simpati/core/resources/app_color.dart';
import 'package:simpati/core/resources/app_text_style.dart';
import 'package:simpati/core/utils/form_utils.dart';
import 'package:simpati/core/utils/date_utils.dart';
import 'package:simpati/domain/entity/pregnancy.dart';
import 'package:simpati/domain/entity/pregnancy_check.dart';
import 'package:simpati/presentation/pregnancy/page/bloc.dart';

class PregnancyMedicalCheckDialog extends StatelessWidget {
  final int index;
  final PregnancyCheckBloc bloc;
  final Pregnancy pregnancy;
  final PregnancyCheck initialData;

  const PregnancyMedicalCheckDialog(
    this.index,
    this.bloc,
    this.pregnancy, {
    this.initialData,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: ListView(
        shrinkWrap: true,
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(16),
            child: Text(
              'Periksa ke $index',
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
                FormUtils.buildField('Prediksi Jenis Kelamin',
                    isEnabled: false),
                Container(height: 8),
                FormUtils.buildField(
                  'Tekanan Darah',
                  inputType: TextInputType.datetime,
                  suffix: 'mmHg',
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
