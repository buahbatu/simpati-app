import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:intl/intl.dart';
import 'package:simpati/core/framework/base_child_view.dart';
import 'package:simpati/core/resources/app_text_style.dart';
import 'package:simpati/core/resources/res_color.dart';
import 'package:simpati/core/utils/form_utils.dart';
import 'package:simpati/feature/children/page/add_check_steps/add_check_info.dart';

class AddCheckInfo1 extends BaseChildView<AddCheckInfoScreen,
    AddCheckInfoAction, AddCheckInfoState> {
  final VoidCallback onButtonClick;

  AddCheckInfo1({Key key, this.onButtonClick});

  final TextEditingController dateController = TextEditingController();
  final TextEditingController bbController = TextEditingController();
  final TextEditingController pbController = TextEditingController();
  final TextEditingController metodeUkurController = TextEditingController();
  final TextEditingController lkController = TextEditingController();
  final TextEditingController umurHariController = TextEditingController();

  var formatter = new DateFormat('yyyy-MM-dd');

  final dateFocus = FocusNode();
  final bbFocus = FocusNode();
  final pbFocus = FocusNode();
  final ukurFocus = FocusNode();
  final lkFocus = FocusNode();
  final umurHariFocus = FocusNode();
  String tanggalPeriksa;

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
  Widget render(BuildContext context, AddCheckInfoAction action,
      AddCheckInfoState state) {
    final focusScope = FocusScope.of(context);

    return Padding(
      padding: const EdgeInsets.only(left: 21, right: 21, bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Data Fisik Anak', style: AppTextStyle.registerTitle),
          Text(
            'Lengkapi data pengecekan anak dan pastikan dieja secara benar',
            style: AppTextStyle.titleName.copyWith(fontSize: 12),
          ),
          Expanded(
            child: ListView(
              children: [
                SizedBox(height: 24),
                InkWell(
                    child: FormUtils.buildField(
                      'Tanggal Periksa',
                      controller: dateController
                        ..text =
                            tanggalPeriksa ?? formatter.format(DateTime.now()),
                      isEnabled: false,
                      inputType: TextInputType.datetime,
                    ),
                    onTap: () async {
                      final date = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(1940),
                        lastDate: DateTime(2080),
                      );
                      if (date != null) {
                        print(tanggalPeriksa);
                        tanggalPeriksa = formatter.format(date);
                        action.updateFormData(tanggalPeriksa: tanggalPeriksa);
                        dateController.text = tanggalPeriksa;
                      }
                    }),
                SizedBox(
                  height: 8.0,
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: FormUtils.buildField(
                        'Berat Badan',
                        inputType: TextInputType.number,
                        value: bbController.text,
                        focusNode: bbFocus,
                        nextForm: NextForm(focusScope, pbFocus),
                        suffix: 'Kg',
                        onChanged: (s) {
                          action.updateFormData(bb: s);
                          bbController.text = s;
                        },
                      ),
                    ),
                    SizedBox(width: 8),
                    Expanded(
                      child: FormUtils.buildField(
                        'Panjang Badan',
                        suffix: 'Cm',
                        focusNode: pbFocus,
                        value: pbController.text,
                        nextForm: NextForm(focusScope, ukurFocus),
                        inputType: TextInputType.number,
                        onChanged: (s) {
                          action.updateFormData(pb: s);
                          pbController.text = s;
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 8.0,
                ),
                FormUtils.buildField(
                  'Metode ukur',
                  inputType: TextInputType.text,
                  focusNode: ukurFocus,
                  value: metodeUkurController.text,
                  nextForm: NextForm(focusScope, lkFocus),
                  onChanged: (s) {
                    action.updateFormData(metodeUkur: s);
                    metodeUkurController.text = s;
                  },
                ),
                SizedBox(height: 8),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: FormUtils.buildField(
                        'Lingkar Kepala',
                        inputType: TextInputType.number,
                        focusNode: lkFocus,
                        value: lkController.text,
                        nextForm: NextForm(focusScope, umurHariFocus),
                        suffix: 'Cm',
                        onChanged: (s) {
                          action.updateFormData(lk: s);
                          lkController.text = s;
                        },
                      ),
                    ),
                    SizedBox(width: 8),
                    Expanded(
                      child: FormUtils.buildField(
                        'Umur Dalam Hari',
                        focusNode: umurHariFocus,
                        value: umurHariController.text,
                        suffix: 'Hari',
                        inputType: TextInputType.number,
                        onChanged: (s) {
                          action.updateFormData(umurHari: s);
                          umurHariController.text = s;
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            child: FlatButton(
              color: ResColor.primaryColor,
              textColor: Colors.white,
              onPressed: onButtonClick,
              child: Text('Lanjut'),
            ),
          )
        ],
      ),
    );
  }
}
