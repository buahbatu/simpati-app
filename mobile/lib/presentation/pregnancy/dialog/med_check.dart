import 'package:flutter/material.dart';
import 'package:simpati/core/bloc/scroll_fragment_bloc.dart';
import 'package:simpati/core/resources/app_color.dart';
import 'package:simpati/core/resources/app_text_style.dart';
import 'package:simpati/core/utils/form_utils.dart';
import 'package:simpati/core/utils/date_utils.dart';
import 'package:simpati/domain/entity/pregnancy.dart';
import 'package:simpati/domain/entity/pregnancy_check.dart';
import 'package:simpati/presentation/pregnancy/page/bloc.dart';

class PregnancyMedicalCheckDialog extends StatefulWidget {
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
  _PregnancyMedicalCheckDialogState createState() =>
      _PregnancyMedicalCheckDialogState(pregnancyCheck: initialData);
}

class _PregnancyMedicalCheckDialogState
    extends State<PregnancyMedicalCheckDialog> {
  PregnancyCheck pregnancyCheck;

  final TextEditingController dateController = TextEditingController();
  final TextEditingController amnioticController = TextEditingController();
  final TextEditingController genderController = TextEditingController();

  _PregnancyMedicalCheckDialogState({PregnancyCheck pregnancyCheck})
      : this.pregnancyCheck =
            pregnancyCheck ?? PregnancyCheck(createdAt: DateTime.now()) {
    if (pregnancyCheck != null) {
      genderController.text =
          pregnancyCheck.isGirlPrediction ? 'Perempuan' : 'Laki - Laki';
    }
  }

  Future<String> showGenderPick(BuildContext context) async {
    final gender = ['Laki - Laki', 'Perempuan']
        .map(
          (e) => FlatButton(
            child: Text(e),
            shape: RoundedRectangleBorder(
              side: BorderSide(color: AppColor.profileBgColor),
              borderRadius: BorderRadius.circular(6),
            ),
            onPressed: () => Navigator.of(context).pop(e),
          ),
        )
        .toList();

    final pick = await showDialog(
        context: context,
        child: Dialog(
          child: ListView(
            padding: const EdgeInsets.all(12),
            shrinkWrap: true,
            children: <Widget>[
              Text(
                'Pilihan Gender',
                style: AppTextStyle.sectionTitle,
              ),
              Container(height: 8),
              ...gender,
            ],
          ),
        ));
    return pick;
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
              'Periksa ke ${widget.index}',
              style: AppTextStyle.sectionTitle,
            ),
          ),
          Container(height: 8),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: <Widget>[
                InkWell(
                  child: FormUtils.buildField(
                    'Tanggal Periksa',
                    controller: dateController
                      ..text = pregnancyCheck?.createdAt?.standardFormat() ??
                          DateTime.now().standardFormat(),
                    isEnabled: false,
                    inputType: TextInputType.datetime,
                  ),
                  onTap: widget.initialData == null
                      ? () async {
                          final date = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(1940),
                            lastDate: DateTime(2080),
                          );
                          if (date != null) {
                            pregnancyCheck =
                                pregnancyCheck.copyWith(createdAt: date);
                            setState(() {
                              dateController.text = date.standardFormat();
                            });
                          }
                        }
                      : null,
                ),
                Container(height: 8),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: FormUtils.buildField(
                        'Berat Badan',
                        value: pregnancyCheck?.weight?.toString(),
                        isEnabled: widget.initialData == null,
                        inputType: TextInputType.number,
                        suffix: 'Kg',
                        onChanged: (s) {
                          final value = double.tryParse(s);
                          pregnancyCheck =
                              pregnancyCheck.copyWith(weight: value);
                        },
                      ),
                    ),
                    Container(width: 8),
                    Expanded(
                      child: FormUtils.buildField(
                        'Berat Janin',
                        suffix: 'g',
                        value: pregnancyCheck?.weightFetus?.toString(),
                        isEnabled: widget.initialData == null,
                        inputType: TextInputType.number,
                        onChanged: (s) {
                          final value = double.tryParse(s);
                          pregnancyCheck =
                              pregnancyCheck.copyWith(weightFetus: value);
                        },
                      ),
                    ),
                  ],
                ),
                Container(height: 8),
                FormUtils.buildField(
                  'Kondisi Air Ketuban',
                  value: widget.initialData?.amnioticStatus,
                  onChanged: (s) {
                    pregnancyCheck = pregnancyCheck.copyWith(amnioticStatus: s);
                  },
                ),
                Container(height: 8),
                InkWell(
                  child: FormUtils.buildField(
                    'Prediksi Jenis Kelamin',
                    controller: genderController,
                    isEnabled: false,
                  ),
                  onTap: widget.initialData == null
                      ? () async {
                          final gender = await showGenderPick(context);
                          if (gender != null) {
                            final isGirl = gender == 'Perempuan';
                            pregnancyCheck = pregnancyCheck.copyWith(
                              isGirlPrediction: isGirl,
                            );
                            setState(() {
                              genderController.text = gender;
                            });
                          }
                        }
                      : null,
                ),
                Container(height: 8),
                FormUtils.buildField(
                  'Tekanan Darah',
                  inputType: TextInputType.datetime,
                  suffix: 'mmHg',
                  value: widget.initialData?.bloodPressure,
                  onChanged: (s) {
                    pregnancyCheck = pregnancyCheck.copyWith(bloodPressure: s);
                  },
                ),
              ],
            ),
          ),
          if (widget.initialData != null) Container(height: 16),
          if (widget.initialData == null) createSaveButton()
        ],
      ),
    );
  }

  Container createSaveButton() {
    return Container(
      padding: const EdgeInsets.all(16),
      child: FlatButton(
        color: AppColor.primaryColor,
        textColor: Colors.white,
        child: Text('Simpan'),
        onPressed: () {
          if (pregnancyCheck.isComplete()) {
            widget.bloc.add(Add<PregnancyCheck>(pregnancyCheck));
            Navigator.of(context).pop();
          }
        },
      ),
    );
  }
}

extension on PregnancyCheck {
  bool _isFilled<T>(T value) {
    if (value is String) {
      return value != null && value.isNotEmpty;
    }
    return value != null;
  }

  bool isComplete() {
    if (_isFilled(this.bloodPressure)) {
      final pattern = r'^[0-9]+\/[0-9]+';
      RegExp regex = RegExp(pattern);
      final matchFormat = regex.hasMatch(this.bloodPressure);

      return _isFilled(this.bloodPressure) &&
          matchFormat &&
          _isFilled(this.amnioticStatus) &&
          _isFilled(this.isGirlPrediction) &&
          _isFilled(this.weight) &&
          _isFilled(this.weightFetus);
    } else {
      return false;
    }
  }
}
