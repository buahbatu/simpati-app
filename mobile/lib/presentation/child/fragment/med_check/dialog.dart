import 'package:flutter/material.dart';
import 'package:simpati/core/bloc/scroll_fragment_bloc.dart';
import 'package:simpati/core/resources/app_color.dart';
import 'package:simpati/core/resources/app_text_style.dart';
import 'package:simpati/core/utils/form_utils.dart';
import 'package:simpati/core/utils/date_utils.dart';
import 'package:simpati/domain/entity/child.dart';
import 'package:simpati/domain/entity/child_check.dart';
import 'package:simpati/presentation/child/fragment/med_check/bloc.dart';

class ChildMedicalCheckDialog extends StatefulWidget {
  final int index;
  final ChildCheckBloc bloc;
  final Child child;
  final ChildCheck childCheck;

  const ChildMedicalCheckDialog(
    this.index,
    this.bloc,
    this.child, {
    this.childCheck,
    Key key,
  }) : super(key: key);

  @override
  _ChildMedicalCheckDialogState createState() =>
      _ChildMedicalCheckDialogState(childCheck?.copyWith());
}

class _ChildMedicalCheckDialogState extends State<ChildMedicalCheckDialog> {
  final ChildCheck childCheck;

  _ChildMedicalCheckDialogState(this.childCheck);

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
                  value:
                      childCheck?.createdAt ?? DateTime.now().standardFormat(),
                  isEnabled: false,
                ),
                Container(height: 8),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: FormUtils.buildField(
                        'Berat Badan',
                        value: childCheck?.weight?.toString(),
                        isEnabled: childCheck == null,
                        suffix: 'Kg',
                      ),
                    ),
                    Container(width: 8),
                    Expanded(
                      child: FormUtils.buildField(
                        'Panjang Badan',
                        suffix: 'cm',
                        value: childCheck?.height?.toString(),
                        isEnabled: childCheck == null,
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
                        isEnabled: childCheck == null,
                      ),
                    ),
                    Container(width: 8),
                    Expanded(
                      child: FormUtils.buildField(
                        'Lingkar Kepala',
                        suffix: 'cm',
                        value: childCheck?.headSize?.toString(),
                        isEnabled: childCheck == null,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          if (!childCheck.isComplete())
            Container(
              padding: const EdgeInsets.all(16),
              child: FlatButton(
                color: AppColor.primaryColor,
                textColor: Colors.white,
                child: Text('Simpan'),
                onPressed: () {
                  if (childCheck.isComplete()) {
                    widget.bloc.add(Add<ChildCheck>(childCheck));
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
    return _isFilled(this.createdAt) &&
        _isFilled(this.temperature) &&
        _isFilled(this.headSize) &&
        _isFilled(this.weight) &&
        _isFilled(this.height);
  }
}
