import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:intl/intl.dart';
import 'package:simpati/core/framework/base_child_view.dart';
import 'package:simpati/core/resources/app_text_style.dart';
import 'package:simpati/core/resources/res_color.dart';
import 'package:simpati/core/utils/form_utils.dart';
import 'package:simpati/feature/children/model/children.dart';
import 'package:simpati/feature/children/model/children_check.dart';
import 'package:simpati/feature/children/page/children_info_screen.dart';

class ChildMedicalCheckDialog extends BaseChildView<ChildrenInfoScreen,
    ChildrenInfoAction, ChildrenInfoState> {
  final TextEditingController dateController = TextEditingController();

  final int index;
  final ChildMedicalCheckup initialData;
  ChildMedicalCheckup childCheck;

  ChildMedicalCheckDialog(
    this.index, {
    this.initialData,
    Key key,
  }) {
    // print(initialData.title);
    childCheck = initialData?.copyWith() ?? ChildMedicalCheckup();
  }

  var formatter = new DateFormat('yyyy-MM-dd');

  @override
  Widget loadingViewBuilder(BuildContext context) => Container(
        color: ResColor.appBackground,
        child: Center(
          child: SpinKitChasingDots(
            color: ResColor.primaryColor,
            size: 50.0,
          ),
        ),
      );

  @override
  Widget render(BuildContext context, ChildrenInfoAction action,
      ChildrenInfoState state) {
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
                InkWell(
                  child: FormUtils.buildField(
                    'Tanggal Periksa',
                    controller: dateController
                      ..text = initialData?.createdAt != null
                          ? initialData.createdAt
                          : formatter.format(DateTime.now()),
                    isEnabled: false,
                    inputType: TextInputType.datetime,
                  ),
                  onTap: initialData == null
                      ? () async {
                          final date = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(1940),
                            lastDate: DateTime(2080),
                          );
                          if (date != null) {
                            String format = formatter.format(date);
                            print(format);

                            childCheck =
                                childCheck?.copyWith(createdAt: format);
                            dateController.text = format;
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
                        value: childCheck?.beratBadan?.toString(),
                        isEnabled: initialData == null,
                        inputType: TextInputType.number,
                        suffix: 'Kg',
                        onChanged: (s) {
                          final value = double.tryParse(s);
                          childCheck =
                              childCheck.copyWith(beratBadan: value.toString());
                        },
                      ),
                    ),
                    Container(width: 8),
                    Expanded(
                      child: FormUtils.buildField(
                        'Panjang Badan',
                        suffix: 'cm',
                        value: childCheck?.panjangBadan?.toString(),
                        isEnabled: initialData == null,
                        inputType: TextInputType.number,
                        onChanged: (s) {
                          final value = double.tryParse(s);
                          childCheck = childCheck.copyWith(
                              panjangBadan: value.toString());
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
                        'Metode ukur',
                        // suffix: '°C',
                        isEnabled: initialData == null,
                        inputType: TextInputType.text,
                        onChanged: (s) {
                          childCheck = childCheck.copyWith(metodePengukuran: s);
                        },
                      ),
                    ),
                    Container(width: 8),
                    Expanded(
                      child: FormUtils.buildField(
                        'Lingkar Kepala',
                        suffix: 'cm',
                        value: childCheck?.diameterKepala?.toString(),
                        isEnabled: initialData == null,
                        inputType: TextInputType.number,
                        onChanged: (s) {
                          final value = double.tryParse(s);
                          childCheck = childCheck.copyWith(
                              diameterKepala: value.toString());
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          if (initialData.isComplete()) Container(height: 12),
          if (!initialData.isComplete())
            Container(
              padding: const EdgeInsets.all(16),
              child: FlatButton(
                color: ResColor.primaryColor,
                textColor: Colors.white,
                child: Text('Simpan'),
                onPressed: () {
                  if (childCheck.isComplete()) {
                    if (childCheck.createdAt != null) {
                      String format = formatter.format(DateTime.now());
                      childCheck = childCheck.copyWith(createdAt: format);
                    }
                    childCheck =
                        childCheck.copyWith(title: "pemeriksaan #$index");
                    // print(childCheck.createdAt);
                    // print(childCheck.panjangBadan);
                    // print(childCheck.beratBadan);
                    print(childCheck.metodePengukuran);
                    action.addMedicalCheckUp(childCheck);
                    // widget.bloc.add(Add(childCheck));
                    // Navigator.of(context).pop();
                  }
                },
              ),
            )
        ],
      ),
    );
  }
}

extension on ChildMedicalCheckup {
  bool _isFilled<T>(T value) {
    if (value is String) {
      return value != null && value.isNotEmpty;
    }
    return value != null;
  }

  bool isComplete() {
    return _isFilled(this?.createdAt) ||
        _isFilled(this?.diameterKepala) ||
        _isFilled(this?.beratBadan) ||
        _isFilled(this?.panjangBadan);
  }
}