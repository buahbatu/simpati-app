import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simpati/core/resources/app_color.dart';
import 'package:simpati/core/resources/app_text_style.dart';
import 'package:simpati/core/utils/form_utils.dart';
import 'package:simpati/presentation/mother/page/add_page/bloc.dart';

class Step3AddMother extends StatefulWidget {
  final VoidCallback onButtonClick;

  Step3AddMother({Key key, this.onButtonClick}) : super(key: key);

  @override
  _Step3AddMotherState createState() => _Step3AddMotherState();
}

class _Step3AddMotherState extends State<Step3AddMother> {
  final bloodController = TextEditingController();

  final weightFocus = FocusNode();

  final bloodPresFocus = FocusNode();

  Future<String> showBloodPick(BuildContext context) async {
    final bloods = ['A', 'B', 'AB', 'O']
        .map(
          (e) => FlatButton(
            child: Text(e),
            shape: RoundedRectangleBorder(
              side: BorderSide(color: AppColor.profileBgColor),
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
                'Pilihan Golongan Darah',
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
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<AddMotherBloc>(context);
    final focusScope = FocusScope.of(context);

    return Padding(
      padding: const EdgeInsets.only(left: 21, right: 21, bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('Informasi Medis', style: AppTextStyle.registerTitle),
          Text(
            'Ukur dengan seksama untuk meningkatkan keakuratan data',
            style: AppTextStyle.titleName.copyWith(fontSize: 12),
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                Container(height: 24),
                FormUtils.buildField(
                  'Tinggi Badan',
                  suffix: 'cm',
                  inputType: TextInputType.number,
                  onChanged: (s) {
                    final value = double.tryParse(s);
                    bloc.mother = bloc.mother.copyWith(height: value);
                  },
                  nextForm: NextForm(focusScope, weightFocus),
                ),
                Container(height: 8),
                FormUtils.buildField(
                  'Berat Badan',
                  suffix: 'Kg',
                  inputType: TextInputType.number,
                  focusNode: weightFocus,
                  nextForm: NextForm(focusScope, bloodPresFocus),
                  onChanged: (s) {
                    final value = double.tryParse(s);
                    bloc.mother = bloc.mother.copyWith(weight: value);
                  },
                ),
                Container(height: 8),
                FormUtils.buildField(
                  'Tekanan Darah',
                  hint: '120/80',
                  suffix: 'mmHg',
                  focusNode: bloodPresFocus,
                  inputType: TextInputType.datetime,
                  onChanged: (s) =>
                      bloc.mother = bloc.mother.copyWith(bloodPressure: s),
                ),
                Container(height: 8),
                InkWell(
                  onTap: () async {
                    final pick = await showBloodPick(context);
                    if (pick != null)
                      setState(() {
                        bloc.mother = bloc.mother.copyWith(bloodType: pick);
                        bloodController.text = pick;
                      });
                    focusScope.requestFocus(FocusNode());
                  },
                  child: FormUtils.buildField(
                    'Golongan Darah',
                    isEnabled: false,
                    controller: bloodController,
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            child: FlatButton(
              color: AppColor.primaryColor,
              textColor: Colors.white,
              onPressed: widget.onButtonClick,
              child: Text('Simpan'),
            ),
          )
        ],
      ),
    );
  }
}
