import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:intl/intl.dart';
import 'package:simpati/feature/mother/model/pregnancy.dart';
import 'package:simpati/core/framework/base_child_view.dart';
import 'package:simpati/core/resources/app_text_style.dart';
import 'package:simpati/core/resources/res_color.dart';
import 'package:simpati/core/utils/form_utils.dart';
import 'package:simpati/feature/mother/page/mother_info_screen.dart';

class AddPregnancyDialog
    extends BaseChildView<MotherInfoScreen, MotherInfoAction, MotherInfoState> {
  final weightFocus = FocusNode();
  final heightFocus = FocusNode();
  final TextEditingController dateController = TextEditingController();
  final TextEditingController cycleController = TextEditingController();
  Map<String, String> cycles = {};
  var formatter = new DateFormat('yyyy-MM-dd');

  @override
  Widget loadingViewBuilder(BuildContext context) {
    return Container(
      child: Center(
        child: SpinKitChasingDots(
          color: ResColor.primaryColor,
          size: 50.0,
        ),
      ),
    );
  }

  Widget createAppBar(BuildContext context) {
    return AppBar(
      elevation: 0,
      iconTheme: IconThemeData(color: ResColor.primaryColor),
      titleSpacing: 0,
      backgroundColor: ResColor.appBackground,
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
              side: BorderSide(color: ResColor.profileBgColor),
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
  Widget render(
      BuildContext context, MotherInfoAction action, MotherInfoState state) {
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
                      action.updateFormData(
                          lastMenstruation: formatter.format(date));
                      dateController.text = formatter.format(date);
                    }
                  },
                ),
                Container(height: 8),
                InkWell(
                  onTap: () async {
                    final pick = await showCyclePick(context);
                    if (pick != null) {
                      print(pick.title);
                      action.updateFormData(menstruationCycleTitle: pick.title);

                      cycleController.text = pick.title;
                    }
                  },
                  child: FormUtils.buildField(
                    'Siklus Menstruasi',
                    isEnabled: false,
                    controller: cycleController,
                  ),
                ),
                Container(height: 8),
                FormUtils.buildField('Tekanan Darah',
                    hint: '120/80',
                    suffix: 'mmHg',
                    inputType: TextInputType.datetime,
                    nextForm: NextForm(focusScope, weightFocus),
                    onChanged: (s) => {action.updateFormData(bloodPressure: s)}
                    // pregnancy = pregnancy.copyWith(bloodPressure: s),
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
                          action.updateFormData(weight: s);

                          // pregnancy = pregnancy.copyWith(weight: value);
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
                          action.updateFormData(height: s);

                          // pregnancy = pregnancy.copyWith(height: value);
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
              color: ResColor.primaryColor,
              textColor: Colors.white,
              child: Text('Simpan'),
              onPressed: () {
                action.addPregnancy(state.pregnancy);
              },
            ),
          )
        ],
      ),
    );
  }
}
