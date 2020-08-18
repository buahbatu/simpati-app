import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:simpati/core/framework/base_child_view.dart';
import 'package:simpati/core/resources/app_text_style.dart';
import 'package:simpati/core/resources/res_color.dart';
import 'package:simpati/core/utils/form_utils.dart';
import 'package:simpati/feature/children/page/add_check_steps/add_check_info.dart';

class AddCheckInfo3 extends BaseChildView<AddCheckInfoScreen,
    AddCheckInfoAction, AddCheckInfoState> {
  final VoidCallback onButtonClick;
  final TextEditingController asiBulan1Controller = TextEditingController();
  final TextEditingController asiBulan2Controller = TextEditingController();
  final TextEditingController asiBulan3Controller = TextEditingController();
  final TextEditingController asiBulan4Controller = TextEditingController();
  final TextEditingController asiBulan5Controller = TextEditingController();
  final TextEditingController asiBulan6Controller = TextEditingController();
  final TextEditingController pemberianKeController = TextEditingController();
  final TextEditingController sumberPmtController = TextEditingController();
  final TextEditingController vitAController = TextEditingController();

  final TextEditingController pemberianPusatController =
      TextEditingController();
  final TextEditingController tahunProduksiController = TextEditingController();
  final TextEditingController pemberianDaerahController =
      TextEditingController();

  AddCheckInfo3({Key key, this.onButtonClick});

  Future<String> yesNoPicker(BuildContext context) async {
    final yesNo = ['Ya', 'Tidak']
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
                'Pilih',
                style: AppTextStyle.sectionTitle,
              ),
              Container(height: 8),
              ...yesNo,
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
  Widget render(BuildContext context, AddCheckInfoAction action,
      AddCheckInfoState state) {
    final focusScope = FocusScope.of(context);
    return Padding(
      padding: const EdgeInsets.only(left: 21, right: 21, bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Data Gizi Anak', style: AppTextStyle.registerTitle),
          Text(
            'Lengkapi data gizi anak dan pastikan dieja secara benar',
            style: AppTextStyle.titleName.copyWith(fontSize: 12),
          ),
          SizedBox(
            height: 24,
          ),
          Expanded(
            child: ListView(
              children: [
                InkWell(
                  onTap: () async {
                    final pick = await yesNoPicker(context);
                    vitAController.text = pick;
                    action.updateFormData(vitA: pick);
                  },
                  child: FormUtils.buildField(
                    'Vitamin A',
                    isEnabled: false,
                    controller: vitAController,
                  ),
                ),
                SizedBox(height: 8),
                Row(
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () async {
                          final pick = await yesNoPicker(context);
                          asiBulan1Controller.text = pick;
                          action.updateFormData(asi1: pick);
                        },
                        child: FormUtils.buildField(
                          'Asi Bulan 1',
                          isEnabled: false,
                          controller: asiBulan1Controller,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: () async {
                          final pick = await yesNoPicker(context);
                          asiBulan2Controller.text = pick;
                          action.updateFormData(asi2: pick);
                        },
                        child: FormUtils.buildField(
                          'Asi Bulan 2',
                          isEnabled: false,
                          controller: asiBulan2Controller,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 8,
                ),
                Row(
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () async {
                          final pick = await yesNoPicker(context);
                          asiBulan3Controller.text = pick;
                          action.updateFormData(asi3: pick);
                        },
                        child: FormUtils.buildField(
                          'Asi Bulan 3',
                          isEnabled: false,
                          controller: asiBulan3Controller,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: () async {
                          final pick = await yesNoPicker(context);
                          action.updateFormData(asi4: pick);

                          asiBulan4Controller.text = pick;
                        },
                        child: FormUtils.buildField(
                          'Asi Bulan 4',
                          isEnabled: false,
                          controller: asiBulan4Controller,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 8,
                ),
                Row(
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () async {
                          final pick = await yesNoPicker(context);
                          asiBulan5Controller.text = pick;
                          action.updateFormData(asi5: pick);
                        },
                        child: FormUtils.buildField(
                          'Asi Bulan 5',
                          isEnabled: false,
                          controller: asiBulan5Controller,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: () async {
                          final pick = await yesNoPicker(context);
                          action.updateFormData(asi6: pick);
                          asiBulan6Controller.text = pick;
                        },
                        child: FormUtils.buildField(
                          'Asi Bulan 6',
                          isEnabled: false,
                          controller: asiBulan6Controller,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 8,
                ),
                Row(
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () async {
                          final pick = await yesNoPicker(context);
                          action.updateFormData(pemberianKe: pick);
                          pemberianKeController.text = pick;
                        },
                        child: FormUtils.buildField(
                          'Pemberian ke',
                          isEnabled: false,
                          controller: pemberianKeController,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: () async {
                          final pick = await yesNoPicker(context);
                          sumberPmtController.text = pick;
                          action.updateFormData(sumberPmt: pick);
                        },
                        child: FormUtils.buildField(
                          'Sumber PMT',
                          isEnabled: false,
                          controller: sumberPmtController,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 8,
                ),
                Row(
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () async {
                          final pick = await yesNoPicker(context);
                          action.updateFormData(pemberianPus: pick);
                          pemberianPusatController.text = pick;
                        },
                        child: FormUtils.buildField(
                          'Pemberian pusat',
                          isEnabled: false,
                          controller: pemberianPusatController,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: () async {
                          final pick = await yesNoPicker(context);
                          action.updateFormData(thnProduksi: pick);
                          tahunProduksiController.text = pick;
                        },
                        child: FormUtils.buildField(
                          'Tahun produksi',
                          isEnabled: false,
                          controller: tahunProduksiController,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8),
                InkWell(
                  onTap: () async {
                    final pick = await yesNoPicker(context);
                    pemberianDaerahController.text = pick;
                    action.updateFormData(pemberianDae: pick);
                  },
                  child: FormUtils.buildField(
                    'Pemberian daerah',
                    isEnabled: false,
                    controller: pemberianDaerahController,
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
    return FlatButton(
      color: ResColor.primaryColor,
      disabledColor: ResColor.profileBgColor,
      textColor: Colors.white,
      onPressed: onButtonClick,
      child: Text('Simpan'),
    );
  }
}
