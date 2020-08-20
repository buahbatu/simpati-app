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

class Step2AddChild
    extends BaseChildView<ChildAddScreen, ChildAddAction, ChildAddState> {
  final VoidCallback onButtonClick;

  Step2AddChild({Key key, this.onButtonClick});
  final bloodController = TextEditingController();
  final imdController = TextEditingController();
  final kiaController = TextEditingController();
  final heightController = TextEditingController();
  final weightController = TextEditingController();
  final headSizeController = TextEditingController();

  final weightFocus = FocusNode();
  final tempFocus = FocusNode();
  final headSizeFocus = FocusNode();

  Future<String> showBloodPick(BuildContext context) async {
    final bloods = ['A', 'B', 'AB', 'O']
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

  Future<String> showImdPick(BuildContext context) async {
    final bloods = ['Ya', 'Tidak']
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
                'Pilihan IMD',
                style: AppTextStyle.sectionTitle,
              ),
              Container(height: 8),
              ...bloods,
            ],
          ),
        ));
    return pick;
  }

  Future<String> showKiaPick(BuildContext context) async {
    final bloods = ['Ya', 'Tidak']
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
                'Pilihan KIA',
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
                        value: heightController.text,
                        nextForm: NextForm(focusScope, weightFocus),
                        onChanged: (s) {
                          action.updateFormData(tinggi: s);
                          heightController.text = s;
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
                        value: weightController.text,
                        nextForm: NextForm(focusScope, headSizeFocus),
                        onChanged: (s) {
                          action.updateFormData(beratLahir: s);
                          weightController.text = s;
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8),
                InkWell(
                  onTap: () async {
                    final pick = await showImdPick(context);
                    if (pick != null) {
                      action.updateFormData(imd: pick);
                      imdController.text = pick;
                    }

                    focusScope.requestFocus(FocusNode());
                  },
                  child: FormUtils.buildField(
                    'IMD',
                    isEnabled: false,
                    controller: imdController,
                  ),
                ),
                SizedBox(height: 8),
                InkWell(
                  onTap: () async {
                    final pick = await showKiaPick(context);
                    if (pick != null) {
                      action.updateFormData(kia: pick);
                      kiaController.text = pick;
                    }
                    focusScope.requestFocus(FocusNode());
                  },
                  child: FormUtils.buildField(
                    'KIA',
                    isEnabled: false,
                    controller: kiaController,
                  ),
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
          // Container(width: double.infinity, child: getButton())
        ],
      ),
    );
  }
}
