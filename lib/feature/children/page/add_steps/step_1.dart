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

class Step1AddChild
    extends BaseChildView<ChildAddScreen, ChildAddAction, ChildAddState> {
  final VoidCallback onButtonClick;

  Step1AddChild({Key key, this.onButtonClick});
  final TextEditingController dateController = TextEditingController();
  bool isGirlSelected = true;
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
          Text('Data Anak', style: AppTextStyle.registerTitle),
          Text(
            'Lengkapi data Anak dan  Ibu dan pastikan dieja secara benar',
            style: AppTextStyle.titleName.copyWith(fontSize: 12),
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                Container(height: 24),
                FormUtils.buildField('Nama Lengkap', onChanged: (s) {}),
                Container(height: 8),
                FormUtils.buildField('Nik Anak',
                    inputType: TextInputType.number,
                    value: '',
                    isEnabled: true,
                    onChanged: (s) {}),
                Container(height: 8),
                FormUtils.buildField('Nomer KK',
                    inputType: TextInputType.number,
                    value: '',
                    isEnabled: true,
                    onChanged: (s) {}),
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
                    if (date != null) {
                      // bloc.child = bloc.child.copyWith(birthDate: date);
                      // setState(() {
                      //   dateController.text = date.standardFormat();
                      // });
                    }
                    focusScope.requestFocus(FocusNode());
                  },
                ),
                Container(height: 8),
                Row(
                  children: <Widget>[
                    creteGenderOption(true),
                    Container(width: 8),
                    creteGenderOption(false),
                  ],
                ),
                SizedBox(height: 8),
                FormUtils.buildField('Nama Ibu',
                    value: '', isEnabled: true, onChanged: (s) {}),
                SizedBox(height: 8),
                FormUtils.buildField('Nik Ibu',
                    inputType: TextInputType.number,
                    value: '',
                    isEnabled: true,
                    onChanged: (s) {}),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            child: FlatButton(
              color: ResColor.primaryColor,
              textColor: Colors.white,
              onPressed: () {},
              child: Text('Lanjut'),
            ),
          )
        ],
      ),
    );
  }

  Expanded creteGenderOption(bool isGirl) {
    return Expanded(
      child: FlatButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6),
          side: BorderSide(
            width: 1,
            color: isGirlSelected == isGirl
                ? ResColor.primaryColor
                : Colors.black26,
          ),
        ),
        onPressed: () {
          // setState(() {
          //   isGirlSelected = isGirl;
          //   bloc.child = bloc.child.copyWith(isGirl: isGirl);
          // });
        },
        child: Column(
          children: <Widget>[
            SvgPicture.asset(
                isGirl ? 'assets/undraw_girl.svg' : 'assets/undraw_boy.svg',
                height: 50),
            Container(height: 4),
            Text(
              isGirl ? 'Cewek' : 'Cowok',
              style: AppTextStyle.titleName,
            ),
            Container(height: 8),
          ],
        ),
      ),
    );
  }
}
