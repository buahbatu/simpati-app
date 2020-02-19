import 'package:flutter/material.dart';
import 'package:simpati/core/bloc/scroll_fragment_bloc.dart';
import 'package:simpati/core/resources/app_color.dart';
import 'package:simpati/core/resources/app_text_style.dart';
import 'package:simpati/core/utils/date_utils.dart';
import 'package:simpati/core/utils/form_utils.dart';
import 'package:simpati/domain/entity/mother.dart';
import 'package:simpati/domain/entity/pregnancy.dart';
import 'package:simpati/presentation/pregnancy/fragment/bloc.dart';

class AddPregnancyDialog extends StatefulWidget {
  final int index;
  final Mother motherData;
  final PregnancyListBloc bloc;

  const AddPregnancyDialog(this.index, this.motherData, this.bloc, {Key key})
      : super(key: key);

  @override
  _AddPregnancyDialogState createState() => _AddPregnancyDialogState();
}

class _AddPregnancyDialogState extends State<AddPregnancyDialog> {
  final TextEditingController dateController = TextEditingController();
  final TextEditingController cycleController = TextEditingController();

  Pregnancy pregnancy = Pregnancy();

  final weightFocus = FocusNode();
  final heightFocus = FocusNode();

  Widget createAppBar(BuildContext context) {
    return AppBar(
      elevation: 0,
      iconTheme: IconThemeData(color: AppColor.primaryColor),
      titleSpacing: 0,
      backgroundColor: AppColor.appBackground,
    );
  }

  Future<MenstruationCycle> showCyclePick(BuildContext context) async {
    final cycles = [
      MenstruationCycle.short,
      MenstruationCycle.regular,
      MenstruationCycle.long
    ]
        .map(
          (e) => FlatButton(
            child: Text(e.title),
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
                'Pilihan Siklus',
                style: AppTextStyle.sectionTitle,
              ),
              Container(height: 8),
              ...cycles,
            ],
          ),
        ));
    return pick;
  }

  @override
  Widget build(BuildContext context) {
    final focusScope = FocusScope.of(context);
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
                InkWell(
                  child: FormUtils.buildField('Terakhir Menstruasi',
                      controller: dateController,
                      isEnabled: false,
                      inputType: TextInputType.datetime),
                  onTap: () async {
                    final date = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(1940),
                      lastDate: DateTime(2080),
                    );
                    if (date != null) {
                      pregnancy = pregnancy.copyWith(lastMenstruation: date);

                      setState(() {
                        dateController.text = date.standardFormat();
                      });
                    }
                  },
                ),
                Container(height: 8),
                InkWell(
                  onTap: () async {
                    final pick = await showCyclePick(context);
                    if (pick != null) {
                      pregnancy = pregnancy.copyWith(menstruationCycle: pick);

                      setState(() {
                        cycleController.text = pick.title;
                      });
                    }
                  },
                  child: FormUtils.buildField(
                    'Siklus Menstruasi',
                    isEnabled: false,
                    controller: cycleController,
                  ),
                ),
                Container(height: 8),
                FormUtils.buildField(
                  'Tekanan Darah',
                  suffix: 'mmHg',
                  inputType: TextInputType.datetime,
                  nextForm: NextForm(focusScope, weightFocus),
                  onChanged: (s) =>
                      pregnancy = pregnancy.copyWith(bloodPressure: s),
                ),
                Container(height: 8),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: FormUtils.buildField(
                        'Berat',
                        focusNode: weightFocus,
                        inputType: TextInputType.number,
                        suffix: 'Kg',
                        nextForm: NextForm(focusScope, heightFocus),
                        onChanged: (s) {
                          final value = double.tryParse(s);
                          pregnancy = pregnancy.copyWith(weight: value);
                        },
                      ),
                    ),
                    Container(width: 8),
                    Expanded(
                      child: FormUtils.buildField(
                        'Tinggi',
                        focusNode: heightFocus,
                        inputType: TextInputType.number,
                        suffix: 'cm',
                        onChanged: (s) {
                          final value = double.tryParse(s);
                          pregnancy = pregnancy.copyWith(height: value);
                        },
                      ),
                    ),
                  ],
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
              onPressed: () {
                if (pregnancy.isComplete()) {
                  widget.bloc.add(Add<Pregnancy>(pregnancy));
                  Navigator.of(context).pop();
                  // Navigator.of(context).pop(pregnancy);
                }
              },
            ),
          )
        ],
      ),
    );
  }
}

extension on Pregnancy {
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
          _isFilled(this.lastMenstruation) &&
          _isFilled(this.menstruationCycle) &&
          _isFilled(this.weight) &&
          _isFilled(this.height);
    } else {
      return false;
    }
  }
}
