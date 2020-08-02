import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:simpati/core/domain/model/mother_info.dart';
import 'package:simpati/core/framework/base_child_view.dart';
import 'package:simpati/core/resources/app_text_style.dart';
import 'package:simpati/core/resources/res_color.dart';
import 'package:simpati/core/utils/form_utils.dart';
import 'package:simpati/feature/children/page/children_add.dart';

class Step3AddChild
    extends BaseChildView<ChildAddScreen, ChildAddAction, ChildAddState> {
  final VoidCallback onButtonClick;

  Step3AddChild({Key key, this.onButtonClick});
  final addressFocus = FocusNode();
  final rtFocus = FocusNode();
  final rwFocus = FocusNode();
  final hpFocus = FocusNode();
  final TextEditingController motherNameController = TextEditingController();
  final TextEditingController motherNikController = TextEditingController();
  final motherNameFocus = FocusNode();
  final motherNikFocus = FocusNode();

  final rtController = TextEditingController();
  final addressController = TextEditingController();
  final rwController = TextEditingController();
  final hpOrtuController = TextEditingController();

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
  Widget render(
      BuildContext context, ChildAddAction action, ChildAddState state) {
    final focusScope = FocusScope.of(context);

    return Padding(
      padding: const EdgeInsets.only(left: 21, right: 21, bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('Informasi Kontak & Orang tua',
              style: AppTextStyle.registerTitle),
          Text(
            'Pastikan alamat dan kontak terisi dengan baik',
            style: AppTextStyle.titleName.copyWith(fontSize: 12),
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                Container(height: 24),
                Container(height: 8),
                FormUtils.buildField(
                  'Nama Ibu',
                  focusNode: motherNameFocus,
                  nextForm: NextForm(focusScope, motherNikFocus),
                  value: motherNameController.text,
                  isEnabled: true,
                  onChanged: (s) {
                    action.updateFormData(namaOrtu: s);
                    motherNameController.text = s;
                  },
                ),
                SizedBox(height: 8),
                FormUtils.buildField(
                  'Nik Ibu',
                  focusNode: motherNikFocus,
                  inputType: TextInputType.number,
                  value: motherNikController.text,
                  nextForm: NextForm(focusScope, hpFocus),
                  isEnabled: true,
                  onChanged: (s) {
                    action.updateFormData(nikOrtu: s);
                    motherNikController.text = s;
                  },
                ),
                Container(height: 8),
                FormUtils.buildField(
                  'Hp Orang Tua',
                  inputType: TextInputType.number,
                  focusNode: hpFocus,
                  value: hpOrtuController.text,
                  nextForm: NextForm(focusScope, addressFocus),
                  onChanged: (s) {
                    action.updateFormData(hpOrtu: s);
                    hpOrtuController.text = s;
                  },
                ),
                Container(height: 8),
                FormUtils.buildField(
                  'Alamat',
                  inputType: TextInputType.text,
                  focusNode: addressFocus,
                  value: addressController.text,
                  nextForm: NextForm(focusScope, rtFocus),
                  onChanged: (s) {
                    action.updateFormData(alamat: s);
                    addressController.text = s;
                  },
                ),
                Container(height: 8),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: FormUtils.buildField(
                        'Rt',
                        inputType: TextInputType.number,
                        value: rtController.text,
                        focusNode: rtFocus,
                        nextForm: NextForm(focusScope, rwFocus),
                        onChanged: (s) {
                          action.updateFormData(rt: s);
                          rtController.text = s;
                        },
                      ),
                    ),
                    Container(width: 8),
                    Expanded(
                      child: FormUtils.buildField(
                        'Rw',
                        inputType: TextInputType.number,
                        focusNode: rwFocus,
                        value: rwController.text,
                        nextForm: NextForm(focusScope, rwFocus),
                        onChanged: (s) {
                          action.updateFormData(rw: s);
                          rwController.text = s;
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(width: double.infinity, child: getButton())
        ],
      ),
    );
  }

  Widget getButton() {
    return FlatButton(
      color: ResColor.primaryColor,
      disabledColor: ResColor.profileBgColor,
      textColor: Colors.white,
      onPressed: onButtonClick,
      child: Text('Simpan'),
    );
  }
}
