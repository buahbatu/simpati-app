import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
          Text('Informasi Kontak', style: AppTextStyle.registerTitle),
          Text(
            'Pastikan alamat dan kontak terisi dengan baik',
            style: AppTextStyle.titleName.copyWith(fontSize: 12),
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                Container(height: 24),
                FormUtils.buildField(
                  'Alamat',
                  inputType: TextInputType.text,
                  focusNode: addressFocus,
                  value: addressController.text,
                  nextForm: NextForm(focusScope, rtFocus),
                  onChanged: (s) {
                    addressController.text = s;
                    final value = double.tryParse(s);
                    // bloc.child = bloc.child.copyWith(temperature: value);
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
                        nextForm: NextForm(focusScope, rwFocus),
                        onChanged: (s) {
                          rtController.text = s;
                          final value = double.tryParse(s);
                          // bloc.child = bloc.child.copyWith(height: value);
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
                          rwController.text = s;
                          final value = double.tryParse(s);
                          // bloc.child = bloc.child.copyWith(weight: value);
                        },
                      ),
                    ),
                  ],
                ),
                Container(height: 8),
                Container(height: 8),
                FormUtils.buildField(
                  'Hp Orang Tua',
                  inputType: TextInputType.number,
                  focusNode: hpFocus,
                  value: hpOrtuController.text,
                  onChanged: (s) {
                    hpOrtuController.text = s;
                    final value = double.tryParse(s);
                    // bloc.child = bloc.child.copyWith(headSize: value);
                  },
                ),
                Container(height: 8),
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
      onPressed: () {},
      child: Text('Simpan'),
    );
  }
}
