import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:simpati/core/resources/app_color.dart';
import 'package:simpati/core/resources/app_text_style.dart';
import 'package:simpati/core/utils/date_utils.dart';
import 'package:simpati/core/utils/form_utils.dart';
import 'package:simpati/presentation/child/page/add_page/bloc.dart';

class Step1AddChild extends StatefulWidget {
  final VoidCallback onButtonClick;

  Step1AddChild({Key key, this.onButtonClick}) : super(key: key);

  @override
  _Step1AddChildState createState() => _Step1AddChildState();
}

class _Step1AddChildState extends State<Step1AddChild> {
  final TextEditingController dateController = TextEditingController();
  bool isGirlSelected = true;

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<AddChildBloc>(context);
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
                  onChanged: (s) => bloc.child = bloc.child.copyWith(
                    fullName: s,
                  ),
                ),
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
                      bloc.child = bloc.child.copyWith(birthDate: date);
                      setState(() {
                        dateController.text = date.standardFormat();
                      });
                    }
                    focusScope.requestFocus(FocusNode());
                  },
                ),
                Container(height: 8),
                Row(
                  children: <Widget>[
                    creteGenderOption(bloc, true),
                    Container(width: 8),
                    creteGenderOption(bloc, false),
                  ],
                ),
                Container(height: 21),
                FormUtils.buildField('Nama Ibu'),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            child: FlatButton(
              color: AppColor.primaryColor,
              textColor: Colors.white,
              onPressed: () {},
              child: Text('Lanjut'),
            ),
          )
        ],
      ),
    );
  }

  Expanded creteGenderOption(AddChildBloc bloc, bool isGirl) {
    return Expanded(
      child: FlatButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6),
          side: BorderSide(
            width: 1,
            color: isGirlSelected == isGirl
                ? AppColor.primaryColor
                : Colors.black26,
          ),
        ),
        onPressed: () {
          setState(() {
            isGirlSelected = isGirl;
            bloc.child = bloc.child.copyWith(isGirl: isGirl);
          });
        },
        child: Column(
          children: <Widget>[
            SvgPicture.asset(
                isGirl ? 'assets/undraw_girl.svg' : 'assets/undraw_boy.svg',
                height: 120),
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
