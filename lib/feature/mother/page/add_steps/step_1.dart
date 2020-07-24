import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:simpati/core/resources/app_text_style.dart';
import 'package:simpati/core/resources/res_color.dart';
import 'package:simpati/core/utils/form_utils.dart';
import 'package:simpati/feature/mother/page/mother_add.dart';
import 'package:simpati/core/framework/base_child_view.dart';

class Step1Screen
    extends BaseChildView<MotherAddScreen, MotherAddAction, MotherAddState> {
  final VoidCallback onButtonClick;
  Step1Screen({Key key, this.onButtonClick});

  final nameFocus = FocusNode();
  final husbandFocus = FocusNode();
  final TextEditingController dateController = TextEditingController();
  var formatter = new DateFormat('yyyy-MM-dd');

  @override
  Widget loadingViewBuilder(BuildContext context) {
    return Container();
  }

  @override
  Widget render(
      BuildContext context, MotherAddAction action, MotherAddState state) {
    return Padding(
      padding: const EdgeInsets.only(left: 21, right: 21, bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('Data Diri', style: AppTextStyle.registerTitle),
          Text(
            'Lengkapi data diri si Ibu dan pastikan dieja secara benar',
            style: AppTextStyle.titleName.copyWith(fontSize: 12),
          ),
          buildForm(context),
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

  Widget buildForm(BuildContext context) {
    final focusScope = FocusScope.of(context);

    return Expanded(
      child: ListView(
        children: <Widget>[
          Container(height: 24),
          FormUtils.buildField(
            'Nama Lengkap',
            focusNode: nameFocus,
            onChanged: (s) => action.updateFormData(name: s),
          ),
          SizedBox(height: 8),
          FormUtils.buildField('NIK',
              inputType: TextInputType.number,
              nextForm: NextForm(focusScope, nameFocus), onChanged: (s) {
            // state.name = s;
            action.updateFormData(nik: s);
          }),
          Container(height: 8),
          InkWell(
            child: FormUtils.buildField('Tanggal Lahir',
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
              print(date);
              dateController.text = formatter.format(date);
              action.updateFormData(tanggalLahir1: formatter.format(date));
              focusScope.requestFocus(husbandFocus);
            },
          ),
          Container(height: 21),
          FormUtils.buildField(
            'Nama Suami',
            focusNode: husbandFocus,
            onChanged: (s) => {action.updateFormData(namaSuami: s)},
          ),
        ],
      ),
    );
  }
}
