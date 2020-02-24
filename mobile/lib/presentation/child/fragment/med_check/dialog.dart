import 'package:flutter/material.dart';
import 'package:simpati/core/resources/app_color.dart';
import 'package:simpati/core/resources/app_text_style.dart';
import 'package:simpati/core/utils/form_utils.dart';
import 'package:simpati/core/utils/date_utils.dart';
import 'package:simpati/domain/entity/child.dart';
import 'package:simpati/domain/entity/child_check.dart';
import 'package:simpati/presentation/child/item/bloc.dart';

class ChildMedicalCheckDialog extends StatefulWidget {
  final int index;
  final ChildInfoBloc bloc;
  final Child child;
  final ChildCheck initialData;

  const ChildMedicalCheckDialog(
    this.index,
    this.bloc,
    this.child, {
    this.initialData,
    Key key,
  }) : super(key: key);

  @override
  _ChildMedicalCheckDialogState createState() =>
      _ChildMedicalCheckDialogState(childCheck: initialData?.copyWith());
}

class _ChildMedicalCheckDialogState extends State<ChildMedicalCheckDialog> {
  ChildCheck childCheck;
  final TextEditingController dateController = TextEditingController();

  _ChildMedicalCheckDialogState({ChildCheck childCheck})
      : this.childCheck = childCheck ?? ChildCheck(createdAt: DateTime.now());

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
                      ..text = childCheck?.createdAt?.standardFormat() ??
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
                            childCheck = childCheck.copyWith(createdAt: date);
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
                        value: childCheck?.weight?.toString(),
                        isEnabled: widget.initialData == null,
                        inputType: TextInputType.number,
                        suffix: 'Kg',
                        onChanged: (s) {
                          final value = double.tryParse(s);
                          childCheck = childCheck.copyWith(weight: value);
                        },
                      ),
                    ),
                    Container(width: 8),
                    Expanded(
                      child: FormUtils.buildField(
                        'Panjang Badan',
                        suffix: 'cm',
                        value: childCheck?.height?.toString(),
                        isEnabled: widget.initialData == null,
                        inputType: TextInputType.number,
                        onChanged: (s) {
                          final value = double.tryParse(s);
                          childCheck = childCheck.copyWith(height: value);
                        },
                      ),
                    ),
                  ],
                ),
                Container(height: 8),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: FormUtils.buildField(
                        'Suhu Badan',
                        suffix: '°C',
                        value: childCheck?.temperature?.toString(),
                        isEnabled: widget.initialData == null,
                        inputType: TextInputType.number,
                        onChanged: (s) {
                          final value = double.tryParse(s);
                          childCheck = childCheck.copyWith(temperature: value);
                        },
                      ),
                    ),
                    Container(width: 8),
                    Expanded(
                      child: FormUtils.buildField(
                        'Lingkar Kepala',
                        suffix: 'cm',
                        value: childCheck?.headSize?.toString(),
                        isEnabled: widget.initialData == null,
                        inputType: TextInputType.number,
                        onChanged: (s) {
                          final value = double.tryParse(s);
                          childCheck = childCheck.copyWith(headSize: value);
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          if (widget.initialData.isComplete()) Container(height: 12),
          if (!widget.initialData.isComplete())
            Container(
              padding: const EdgeInsets.all(16),
              child: FlatButton(
                color: AppColor.primaryColor,
                textColor: Colors.white,
                child: Text('Simpan'),
                onPressed: () {
                  if (childCheck.isComplete()) {
                    widget.bloc.add(Add(childCheck));
                    Navigator.of(context).pop();
                  }
                },
              ),
            )
        ],
      ),
    );
  }
}

extension on ChildCheck {
  bool _isFilled<T>(T value) {
    if (value is String) {
      return value != null && value.isNotEmpty;
    }
    return value != null;
  }

  bool isComplete() {
    return _isFilled(this?.createdAt) &&
        _isFilled(this?.temperature) &&
        _isFilled(this?.headSize) &&
        _isFilled(this?.weight) &&
        _isFilled(this?.height);
  }
}
