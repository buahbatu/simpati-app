import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:simpati/core/framework/base_action.dart';
import 'package:simpati/core/framework/base_view.dart';
import 'package:simpati/core/resources/res_color.dart';
import 'package:simpati/core/utils/form_utils.dart';
import 'package:simpati/feature/children/model/children_check.dart';

class InfoCheckState {
  final ChildMedicalCheckup infoMedical;

  InfoCheckState({this.infoMedical});
}

class InfoCheckAction
    extends BaseAction<InfoCheckScreen, InfoCheckAction, InfoCheckState> {
  final ChildMedicalCheckup infoMedical;

  InfoCheckAction(this.infoMedical);

  @override
  Future<InfoCheckState> initState() async {
    return InfoCheckState(infoMedical: infoMedical);
  }
}

class InfoCheckScreen
    extends BaseView<InfoCheckScreen, InfoCheckAction, InfoCheckState> {
  final ChildMedicalCheckup infoMedical;

  InfoCheckScreen(this.infoMedical);

  @override
  InfoCheckAction initAction() => InfoCheckAction(infoMedical);

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

  Widget createAppBar(BuildContext context, String title) {
    return AppBar(
      elevation: 0,
      actions: [
        IconButton(
          icon: Icon(Icons.delete),
          color: ResColor.primaryColor,
          onPressed: () {},
        )
      ],
      iconTheme: IconThemeData(color: ResColor.primaryColor),
      titleSpacing: 0,
      title: Text(
        title,
        style: TextStyle(color: Colors.black),
      ),
      backgroundColor: Colors.white,
    );
  }

  @override
  Widget render(
      BuildContext context, InfoCheckAction action, InfoCheckState state) {
    return Scaffold(
      appBar: createAppBar(context, state.infoMedical.title),
      body: ListView(
        shrinkWrap: true,
        children: <Widget>[
          // Container(
          //   padding: const EdgeInsets.all(16),
          //   child: Text(
          //     'Periksa ke ${state.infoMedical.title}',
          //     style: AppTextStyle.sectionTitle,
          //   ),
          // ),
          Container(height: 8),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: <Widget>[
                FormUtils.buildField(
                  'Tanggal Periksa',
                  value: state.infoMedical.tanggalCek,
                  isEnabled: false,
                  inputType: TextInputType.datetime,
                ),
                Container(height: 8),
                Row(
                  children: [
                    Expanded(
                      child: FormUtils.buildField(
                        'Berat Badan',
                        value: state.infoMedical?.beratBadan?.toString(),
                        inputType: TextInputType.number,
                        suffix: 'Kg',
                        isEnabled: false,
                        onChanged: (s) {},
                      ),
                    ),
                    Container(width: 8),
                    Expanded(
                      child: FormUtils.buildField(
                        'Panjang Badan',
                        suffix: 'cm',
                        isEnabled: false,
                        value: state.infoMedical?.panjangBadan?.toString(),
                        inputType: TextInputType.number,
                        onChanged: (s) {},
                      ),
                    ),
                  ],
                ),
                Container(height: 8),
                FormUtils.buildField(
                  'Metode ukur',
                  // suffix: '°C',
                  value: state.infoMedical?.metodePengukuran,
                  isEnabled: false,
                  inputType: TextInputType.text,
                  onChanged: (s) {},
                ),
                SizedBox(height: 8),
                Row(
                  children: [
                    Expanded(
                      child: FormUtils.buildField(
                        'Lingkar Kepala',
                        suffix: 'cm',
                        value: state.infoMedical?.diameterKepala?.toString(),
                        isEnabled: false,
                        inputType: TextInputType.number,
                        onChanged: (s) {},
                      ),
                    ),
                    SizedBox(width: 8),
                    Expanded(
                      child: FormUtils.buildField(
                        'Umur dalam hari',
                        // suffix: '°C',
                        value: state.infoMedical?.umurDalamHari,
                        isEnabled: false,
                        inputType: TextInputType.text,
                        onChanged: (s) {},
                      ),
                    ),
                  ],
                ),
                Container(height: 8),
                FormUtils.buildField(
                  'Gizi BB U',
                  value: state.infoMedical?.statusGiziBbU?.toString(),
                  isEnabled: false,
                  inputType: TextInputType.number,
                  onChanged: (s) {},
                ),
                SizedBox(height: 8),
                FormUtils.buildField(
                  'Gizi TB U',
                  // suffix: '°C',
                  value: state.infoMedical?.statusGiziTbU,
                  inputType: TextInputType.text,
                  isEnabled: false,
                  onChanged: (s) {},
                ),
                Container(height: 8),
                FormUtils.buildField(
                  'Gizi BB TB',
                  value: state.infoMedical?.statusGiziBbTb,
                  isEnabled: false,
                  inputType: TextInputType.number,
                  onChanged: (s) {},
                ),
                SizedBox(height: 8),
                FormUtils.buildField(
                  'Z Score BB U',
                  value: state.infoMedical?.zScoreBbU,
                  isEnabled: false,
                  inputType: TextInputType.number,
                  onChanged: (s) {},
                ),
                SizedBox(height: 8),
                FormUtils.buildField(
                  'Z Score BB TB',
                  value: state.infoMedical?.zScoreBbTb,
                  isEnabled: false,
                  inputType: TextInputType.number,
                  onChanged: (s) {},
                ),
                SizedBox(height: 8),
                FormUtils.buildField(
                  'Z Score TB U',
                  value: state.infoMedical?.zScoreTbU,
                  isEnabled: false,
                  inputType: TextInputType.number,
                  onChanged: (s) {},
                ),
                SizedBox(height: 8),
                Row(
                  children: [
                    Expanded(
                      child: FormUtils.buildField(
                        'Vitamin A',
                        // suffix: '°C',
                        value: state.infoMedical?.vitaminA,
                        inputType: TextInputType.text,
                        isEnabled: false,
                        onChanged: (s) {},
                      ),
                    ),
                    Container(width: 8),
                    Expanded(
                      child: FormUtils.buildField(
                        'Asi Bulan 1',
                        value: state.infoMedical?.asiBulan1?.toString(),
                        inputType: TextInputType.number,
                        isEnabled: false,
                        onChanged: (s) {},
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8),
                Row(
                  children: [
                    Expanded(
                      child: FormUtils.buildField(
                        'Asi Bulan 2',
                        // suffix: '°C',
                        value: state.infoMedical?.asiBulan2,
                        isEnabled: false,
                        inputType: TextInputType.text,
                        onChanged: (s) {},
                      ),
                    ),
                    SizedBox(width: 8),
                    Expanded(
                      child: FormUtils.buildField(
                        'Asi Bulan 3',
                        value: state.infoMedical?.asiBulan3?.toString(),
                        inputType: TextInputType.number,
                        isEnabled: false,
                        onChanged: (s) {},
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8),
                Row(
                  children: [
                    Expanded(
                      child: FormUtils.buildField(
                        'Asi Bulan 4',
                        // suffix: '°C',
                        value: state.infoMedical?.asiBulan4,
                        isEnabled: false,
                        inputType: TextInputType.text,
                        onChanged: (s) {},
                      ),
                    ),
                    SizedBox(width: 8),
                    Expanded(
                      child: FormUtils.buildField(
                        'Asi Bulan 5',
                        value: state.infoMedical?.asiBulan5.toString(),
                        inputType: TextInputType.number,
                        isEnabled: false,
                        onChanged: (s) {},
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8),
                Row(
                  children: [
                    Expanded(
                      child: FormUtils.buildField(
                        'Asi Bulan 6',
                        // suffix: '°C',
                        value: state.infoMedical?.asiBulan6,
                        isEnabled: false,
                        inputType: TextInputType.text,
                        onChanged: (s) {},
                      ),
                    ),
                    SizedBox(width: 8),
                    Expanded(
                      child: FormUtils.buildField(
                        'Pemberian Ke',
                        value: state.infoMedical?.pemberianKe?.toString(),
                        isEnabled: false,
                        inputType: TextInputType.number,
                        onChanged: (s) {},
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8),
                Row(
                  children: [
                    Expanded(
                      child: FormUtils.buildField(
                        'Sumber PMT',
                        // suffix: '°C',
                        value: state.infoMedical?.sumberPmt,
                        inputType: TextInputType.text,
                        isEnabled: false,
                        onChanged: (s) {},
                      ),
                    ),
                    SizedBox(width: 8),
                    Expanded(
                      child: FormUtils.buildField(
                        'Pemberian Pusat',
                        value: state.infoMedical?.pemberianPusat,
                        inputType: TextInputType.number,
                        isEnabled: false,
                        onChanged: (s) {},
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8),
                Row(
                  children: [
                    Expanded(
                      child: FormUtils.buildField(
                        'Tahun produksi',
                        // suffix: '°C',
                        value: state.infoMedical?.tahunProduksi,
                        inputType: TextInputType.text,
                        isEnabled: false,
                        onChanged: (s) {},
                      ),
                    ),
                    SizedBox(width: 8),
                    Expanded(
                      child: FormUtils.buildField(
                        'Pemberian daerah',
                        value: state.infoMedical?.pemberianDaerah,
                        isEnabled: false,
                        inputType: TextInputType.number,
                        onChanged: (s) {},
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
