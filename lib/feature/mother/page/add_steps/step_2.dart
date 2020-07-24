import 'package:flutter/material.dart';
import 'package:simpati/core/resources/app_text_style.dart';
import 'package:simpati/core/resources/res_color.dart';
import 'package:simpati/core/utils/form_utils.dart';
import 'package:simpati/feature/mother/page/mother_add.dart';
import 'package:simpati/core/framework/base_child_view.dart';

class Step2Screen
    extends BaseChildView<MotherAddScreen, MotherAddAction, MotherAddState> {
  final VoidCallback onButtonClick;
  Step2Screen({Key key, this.onButtonClick});

  @override
  Widget loadingViewBuilder(BuildContext context) {
    return Container();
  }

  final addressFocus = FocusNode();
  final cityFocus = FocusNode();

  final TextEditingController dateController = TextEditingController();
  final bloodController = TextEditingController();

  @override
  Widget render(
      BuildContext context, MotherAddAction action, MotherAddState state) {
    return Padding(
      padding: const EdgeInsets.only(left: 21, right: 21, bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('Alamat & Informasi Medis', style: AppTextStyle.registerTitle),
          Text(
            'Tulis dengan detail untuk mempermudah kunjugan berikutnya',
            style: AppTextStyle.titleName.copyWith(fontSize: 12),
          ),
          buildForm(context),
          Container(
            width: double.infinity,
            child: FlatButton(
              color: ResColor.primaryColor,
              textColor: Colors.white,
              onPressed: onButtonClick,
              child: Text('Simpan'),
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
            'Nomor Telpon',
            inputType: TextInputType.phone,
            onChanged: (s) => {action.updateFormData2(nomerTelpon: s)},
            nextForm: NextForm(focusScope, addressFocus),
          ),
          Container(height: 8),
          FormUtils.buildField(
            'Alamat',
            focusNode: addressFocus,
            onChanged: (s) => {action.updateFormData2(longAddress: s)},
          ),
          Container(height: 8),
          Row(
            children: <Widget>[
              Expanded(
                child: FormUtils.buildField(
                  'Provinsi',
                  value: 'Jawa Barat',
                  nextForm: NextForm(focusScope, cityFocus),
                  onChanged: (s) => {action.updateFormData2(province: s)},
                ),
              ),
              Container(width: 8),
              Expanded(
                  child: FormUtils.buildField(
                'Kota',
                focusNode: cityFocus,
                value: 'Sumedang',
                onChanged: (s) => {action.updateFormData2(city: s)},
              )),
            ],
          ),
          Container(height: 8),
          InkWell(
            onTap: () async {
              final pick = await showBloodPick(context);
              if (pick != null) {
                print(pick);
                action.updateFormData2(bloodType: pick);
                bloodController.text = pick;
              }
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
    );
  }

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
}
