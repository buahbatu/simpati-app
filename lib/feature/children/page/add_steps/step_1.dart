import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:simpati/core/framework/base_child_view.dart';
import 'package:simpati/core/resources/app_text_style.dart';
import 'package:simpati/core/resources/res_color.dart';
import 'package:simpati/core/utils/form_utils.dart';
import 'package:simpati/feature/children/page/children_add.dart';

class Step1AddChild
    extends BaseChildView<ChildAddScreen, ChildAddAction, ChildAddState> {
  final VoidCallback onButtonClick;

  Step1AddChild({Key key, this.onButtonClick});
  final TextEditingController dateController = TextEditingController();
  bool isGirlSelected = true;
  final TextEditingController genderController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController nikController = TextEditingController();
  final TextEditingController kkController = TextEditingController();
  final TextEditingController motherNameController = TextEditingController();
  final TextEditingController motherNikController = TextEditingController();
  var formatter = new DateFormat('yyyy-MM-dd');

  final nameFocus = FocusNode();
  final nikFocus = FocusNode();
  final kkFocus = FocusNode();
  final motherNameFocus = FocusNode();
  final birthDateFocus = FocusNode();
  final motherNikFocus = FocusNode();

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

  Future<String> showGenderPick(BuildContext context) async {
    final bloods = ['Laki-laki', 'Perempuan']
        .map(
          (e) => FlatButton(
            child: Text(e),
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
                'Pilihan Jenis Kelamin',
                style: AppTextStyle.sectionTitle,
              ),
              Container(height: 8),
              ...bloods,
            ],
          ),
        ));
    return pick;
  }

  @override
  Widget render(
      BuildContext context, ChildAddAction action, ChildAddState state) {
    final focusScope = FocusScope.of(context);
    return Padding(
      padding: const EdgeInsets.only(left: 21, right: 21, bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('Data Anak', style: AppTextStyle.registerTitle),
          Text(
            'Lengkapi data Anak dan  Ibu dan pastikan dieja secara benar',
            style: AppTextStyle.titleName.copyWith(fontSize: 12),
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                Container(height: 24),
                FormUtils.buildField(
                  'Nama Lengkap',
                  focusNode: nameFocus,
                  nextForm: NextForm(focusScope, nikFocus),
                  value: nameController.text,
                  onChanged: (s) {
                    nameController.text = s;
                  },
                ),
                Container(height: 8),
                FormUtils.buildField(
                  'Nik Anak',
                  inputType: TextInputType.number,
                  focusNode: nikFocus,
                  nextForm: NextForm(focusScope, kkFocus),
                  value: nikController.text,
                  onChanged: (s) {
                    nikController.text = s;
                  },
                ),
                Container(height: 8),
                FormUtils.buildField(
                  'Nomer KK',
                  inputType: TextInputType.number,
                  focusNode: kkFocus,
                  nextForm: NextForm(focusScope, birthDateFocus),
                  value: kkController.text,
                  onChanged: (s) {
                    kkController.text = s;
                  },
                ),
                Container(height: 8),
                InkWell(
                  child: FormUtils.buildField('Tanggal Lahir',
                      controller: dateController,
                      focusNode: birthDateFocus,
                      nextForm: NextForm(focusScope, motherNameFocus),
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
                      // bloc.child = bloc.child.copyWith(birthDate: date);
                      // setState(() {
                      dateController.text = formatter.format(date);
                      // });
                    }
                    focusScope.requestFocus(FocusNode());
                  },
                ),
                Container(height: 8),
                InkWell(
                  onTap: () async {
                    final pick = await showGenderPick(context);
                    if (pick != null)
                      // setState(() {
                      //   bloc.child = bloc.child.copyWith(bloodType: pick);
                      genderController.text = pick;
                    // });
                    focusScope.requestFocus(FocusNode());
                  },
                  child: FormUtils.buildField(
                    'Jenis Kelamin',
                    isEnabled: false,
                    controller: genderController,
                  ),
                ),
                SizedBox(height: 8),
                FormUtils.buildField(
                  'Nama Ibu',
                  focusNode: motherNameFocus,
                  nextForm: NextForm(focusScope, motherNikFocus),
                  value: motherNameController.text,
                  isEnabled: true,
                  onChanged: (s) {
                    motherNameController.text = s;
                  },
                ),
                SizedBox(height: 8),
                FormUtils.buildField(
                  'Nik Ibu',
                  focusNode: motherNikFocus,
                  inputType: TextInputType.number,
                  value: motherNikController.text,
                  isEnabled: true,
                  onChanged: (s) {
                    motherNikController.text = s;
                  },
                ),
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
