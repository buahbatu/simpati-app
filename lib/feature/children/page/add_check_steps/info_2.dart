import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:simpati/core/framework/base_child_view.dart';
import 'package:simpati/core/resources/app_text_style.dart';
import 'package:simpati/core/resources/res_color.dart';
import 'package:simpati/core/utils/form_utils.dart';
import 'package:simpati/feature/children/page/add_check_steps/add_check_info.dart';

class AddCheckInfo2 extends BaseChildView<AddCheckInfoScreen,
    AddCheckInfoAction, AddCheckInfoState> {
  final VoidCallback onButtonClick;
  final TextEditingController giziBbUController = TextEditingController();
  final TextEditingController giziTbUController = TextEditingController();
  final TextEditingController giziBbTbController = TextEditingController();
  final TextEditingController vitAController = TextEditingController();

  final giziBbUFocus = FocusNode();
  final giziTbUFocus = FocusNode();
  final giziBbTbUFocus = FocusNode();
  final vitAFocus = FocusNode();

  AddCheckInfo2({Key key, this.onButtonClick});

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
          Text('Data Gizi Anak', style: AppTextStyle.registerTitle),
          Text(
            'Lengkapi data gizi anak dan pastikan dieja secara benar',
            style: AppTextStyle.titleName.copyWith(fontSize: 12),
          ),
          SizedBox(height: 24),
          Expanded(
            child: ListView(
              children: [
                FormUtils.buildField(
                  'Gizi Berat Badan U',
                  inputType: TextInputType.text,
                  value: giziBbTbController.text,
                  focusNode: giziBbUFocus,
                  nextForm: NextForm(focusScope, giziTbUFocus),
                  onChanged: (s) {
                    action.updateFormData(giziBbU: s);
                    giziBbTbController.text = s;
                  },
                ),
                SizedBox(height: 8),
                FormUtils.buildField(
                  'Gizi Tinggi Badan U',
                  inputType: TextInputType.text,
                  value: giziTbUController.text,
                  focusNode: giziTbUFocus,
                  nextForm: NextForm(focusScope, giziBbTbUFocus),
                  onChanged: (s) {
                    action.updateFormData(giziTbU: s);
                    giziTbUController.text = s;
                  },
                ),
                SizedBox(height: 8),
                FormUtils.buildField(
                  'Gizi Berat Badan TB',
                  inputType: TextInputType.text,
                  value: giziBbTbController.text,
                  focusNode: giziBbTbUFocus,
                  nextForm: NextForm(focusScope, vitAFocus),
                  onChanged: (s) {
                    action.updateFormData(giziBbTb: s);
                    giziBbTbController.text = s;
                  },
                ),
                SizedBox(height: 8),
                FormUtils.buildField(
                  'Vitamin A',
                  inputType: TextInputType.text,
                  value: vitAController.text,
                  focusNode: vitAFocus,
                  onChanged: (s) {
                    action.updateFormData(vitA: s);
                    vitAController.text = s;
                  },
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
