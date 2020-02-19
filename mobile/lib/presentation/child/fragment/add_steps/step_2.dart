import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:simpati/core/resources/app_color.dart';
import 'package:simpati/core/resources/app_text_style.dart';
import 'package:simpati/core/utils/form_utils.dart';
import 'package:simpati/presentation/child/page/add_page/bloc.dart';

class Step2AddChild extends StatefulWidget {
  final VoidCallback onButtonClick;

  const Step2AddChild({Key key, this.onButtonClick}) : super(key: key);

  @override
  _Step2AddChildState createState() => _Step2AddChildState();
}

class _Step2AddChildState extends State<Step2AddChild> {
  final bloodController = TextEditingController();

  final weightFocus = FocusNode();
  final tempFocus = FocusNode();
  final headSizeFocus = FocusNode();

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
    final bloc = BlocProvider.of<AddChildBloc>(context);
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
                Row(
                  children: <Widget>[
                    Expanded(
                      child: FormUtils.buildField(
                        'Tinggi Badan',
                        suffix: 'cm',
                        inputType: TextInputType.number,
                        nextForm: NextForm(focusScope, weightFocus),
                        onChanged: (s) {
                          final value = double.tryParse(s);
                          bloc.child = bloc.child.copyWith(height: value);
                        },
                      ),
                    ),
                    Container(width: 8),
                    Expanded(
                      child: FormUtils.buildField(
                        'Berat Badan',
                        suffix: 'Kg',
                        inputType: TextInputType.number,
                        focusNode: weightFocus,
                        nextForm: NextForm(focusScope, tempFocus),
                        onChanged: (s) {
                          final value = double.tryParse(s);
                          bloc.child = bloc.child.copyWith(weight: value);
                        },
                      ),
                    ),
                  ],
                ),
                Container(height: 8),
                FormUtils.buildField(
                  'Suhu Badan',
                  suffix: '°C',
                  inputType: TextInputType.number,
                  focusNode: tempFocus,
                  nextForm: NextForm(focusScope, headSizeFocus),
                  onChanged: (s) {
                    final value = double.tryParse(s);
                    bloc.child = bloc.child.copyWith(temperature: value);
                  },
                ),
                Container(height: 8),
                FormUtils.buildField(
                  'Lingkar Kepala',
                  suffix: 'cm',
                  inputType: TextInputType.number,
                  focusNode: headSizeFocus,
                  onChanged: (s) {
                    final value = double.tryParse(s);
                    bloc.child = bloc.child.copyWith(headSize: value);
                  },
                ),
                Container(height: 8),
                InkWell(
                  onTap: () async {
                    final pick = await showBloodPick(context);
                    if (pick != null)
                      setState(() {
                        bloc.child = bloc.child.copyWith(bloodType: pick);
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
          Container(width: double.infinity, child: getButton())
        ],
      ),
    );
  }

  Widget getButton() {
    return BlocBuilder<AddChildBloc, AddChildState>(builder: (ctx, state) {
      return FlatButton(
        color: AppColor.primaryColor,
        disabledColor: AppColor.profileBgColor,
        textColor: Colors.white,
        onPressed: state == AddChildState.Loading ? null : widget.onButtonClick,
        child: state == AddChildState.Loading
            ? SpinKitWave(color: Colors.white, size: 18.0)
            : Text('Simpan'),
      );
    });
  }
}
