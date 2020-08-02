import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';
import 'package:simpati/core/classifier/child_classifier.dart';
import 'package:simpati/core/classifier/graph_data_reader.dart';
import 'package:simpati/core/framework/base_action.dart';
import 'package:simpati/core/framework/base_view.dart';
import 'package:simpati/core/resources/app_images.dart';
import 'package:simpati/core/resources/app_text_style.dart';
import 'package:simpati/core/resources/res_color.dart';
import 'package:simpati/core/resources/res_data_source.dart';
import 'package:simpati/core/utils/form_utils.dart';
import 'package:simpati/feature/children/dialog/child_medical_check_dialog.dart';
import 'package:simpati/feature/children/model/children.dart';
import 'package:simpati/feature/children/model/children_check.dart';
import 'package:simpati/feature/repository/children_repository.dart';

class ChildrenInfoState {
  Children child;
  List<ChildMedicalCheckup> medicalCheckup;
  final List<Line> lines;
  final List<Line> imaginary;
  // final List<ChildCheck> checks;
  final Line weightLine;
  final ChildMedicalCheckup initialData;
  final String id;

  ChildrenInfoState(
      {this.medicalCheckup,
      this.id,
      this.child,
      this.lines,
      this.imaginary,
      this.weightLine,
      this.initialData});
}

class ChildrenInfoAction extends BaseAction<ChildrenInfoScreen,
    ChildrenInfoAction, ChildrenInfoState> {
  final apiChildRepo =
      Get.getRepository<ChildrenRepository>(ResDataSource.Remote);
  @override
  Future<ChildrenInfoState> initState() async {
    final id = Get.arguments;
    final result = await apiChildRepo.getByKey(id);
    if (result.isSuccess) {
      final resultCheckUp = await apiChildRepo.getChildMedicalCheck(id);
      if (resultCheckUp.isSuccess) {
        print(resultCheckUp.data.first.title);
        return ChildrenInfoState(
            id: id, child: result.data, medicalCheckup: resultCheckUp.data);
      }
      return ChildrenInfoState(child: result.data, id: id);
    }
    return ChildrenInfoState(id: id);
  }

  void addMedicalCheckUp(ChildMedicalCheckup medCheck) async {
    ChildMedicalCheckup request = medCheck.copyWith(anak: state.id);
    final result = await apiChildRepo.addChildMedicalCheckUp(request);
    // if (result.isSuccess) {
    //   reloadScreen();
    // }
  }
}

class ChildrenInfoScreen extends BaseView<ChildrenInfoScreen,
    ChildrenInfoAction, ChildrenInfoState> {
  @override
  ChildrenInfoAction initAction() {
    return ChildrenInfoAction();
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

  Widget createAppBar(BuildContext context) {
    return AppBar(
      elevation: 0,
      iconTheme: IconThemeData(color: ResColor.primaryColor),
      titleSpacing: 0,
      backgroundColor: Colors.white,
    );
  }

  @override
  Widget render(BuildContext context, ChildrenInfoAction action,
      ChildrenInfoState state) {
    return Scaffold(
      appBar: createAppBar(context),
      backgroundColor: ResColor.appBackground,
      body: state.child != null
          ? ListView(
              shrinkWrap: true,
              children: [
                createNameSection(state),
                SizedBox(height: 8),
                createPersonalInfo(state),
                SizedBox(height: 8),
                createHealthInfo(state),
                SizedBox(height: 8),
                createWeightHistory(state),
                SizedBox(height: 8),
                createCheckupHistory(state, context),
                SizedBox(height: 8),
                createImmunizationHistory(state),
              ],
            )
          : Align(
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  AppImages.noDataImage,
                  SizedBox(height: 12),
                  Text("Data Kosong", style: AppTextStyle.titleName),
                ],
              ),
            ),
    );
  }

  Widget createImmunizationHistory(ChildrenInfoState state) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 21, vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('Riwayat Imunisasi', style: AppTextStyle.sectionTitle),
          Container(height: 12),
          // Wrap(
          //   spacing: 8,
          //   children:
          //       state.items.map((e) => createImunCard(ctx, bloc, e)).toList(),
          // ),
        ],
      ),
    );
  }

  FlatButton createImunCard(BuildContext ctx, ChildrenInfoState state) {
    final isDone = state.child.createdAt != null;
    final color = isDone ? ResColor.primaryColor : Colors.black38;

    final start = 3;

    final end = 3;

    return FlatButton(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(6),
        side: BorderSide(color: color),
      ),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text("sss", style: TextStyle(color: color)),
                if (isDone)
                  Text(
                    state.child.createdAt,
                    style: TextStyle(color: color, fontSize: 10),
                  ),
                if (!isDone)
                  Text(
                    '$start - $end',
                    style: TextStyle(color: color, fontSize: 10),
                  ),
              ],
            ),
          ),
          if (isDone) Icon(LineAwesomeIcons.check, color: color),
        ],
      ),
      onPressed: isDone
          ? null
          : () {
              // showDialog(
              //   context: ctx,
              //   child: ChildImmunizationDialog(bloc, initialData, immun),
              // );
            },
    );
  }

  Widget createNameSection(ChildrenInfoState state) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.only(left: 21, right: 21, bottom: 16),
      child: Row(
        children: <Widget>[
          CircleAvatar(
            radius: 24,
            backgroundColor: ResColor.profileBgColor,
            child: Icon(LineAwesomeIcons.child, color: Colors.white, size: 28),
          ),
          Container(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(state.child.title, style: AppTextStyle.registerTitle),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Icon(LineAwesomeIcons.female,
                      size: 16, color: Colors.black38),
                  Container(width: 4),
                  Text(
                    state.child.ibu,
                    style: AppTextStyle.titleName.copyWith(fontSize: 12),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget createPersonalInfo(ChildrenInfoState state) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 21, vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('Data Pribadi', style: AppTextStyle.sectionTitle),
          Container(height: 21),
          FormUtils.buildField(
            'Nama Ibu',
            value: state.child.ibu,
            isEnabled: false,
          ),
          Container(height: 8),
          FormUtils.buildField(
            'Tanggal Lahir',
            value: state.child.tanggalLahir,
            isEnabled: false,
          ),
          Container(height: 8),
          FormUtils.buildField(
            'Golongan Darah',
            value: state.child.golonganDarah,
            isEnabled: false,
          ),
        ],
      ),
    );
  }

  Widget createWeightHistory(ChildrenInfoState state) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 21, vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('Perkembangan Berat', style: AppTextStyle.sectionTitle),
          Container(height: 12),
          Text(
            '(Kg)',
            style: TextStyle(color: Colors.black38, fontSize: 10),
          ),
          // GrowthChart(),
        ],
      ),
    );
  }

  Widget createHealthInfo(ChildrenInfoState state) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 21, vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('Informasi Kesehatan', style: AppTextStyle.sectionTitle),
          Container(height: 21),
          Row(
            children: <Widget>[
              Expanded(
                child: FormUtils.buildField(
                  'Panjang Badan',
                  value: "90",
                  isEnabled: false,
                  suffix: 'cm',
                ),
              ),
              Container(width: 8),
              Expanded(
                child: FormUtils.buildField('Berat Badan',
                    value: "3", isEnabled: false, suffix: 'Kg'),
              ),
            ],
          ),
          Container(height: 8),
          Row(
            children: <Widget>[
              Expanded(
                child: FormUtils.buildField(
                  'Suhu Badan',
                  value: "30",
                  isEnabled: false,
                  suffix: '°C',
                ),
              ),
              Container(width: 8),
              Expanded(
                child: FormUtils.buildField(
                  'Lingkar Kepala',
                  value: "1",
                  isEnabled: false,
                  suffix: 'cm',
                ),
              ),
            ],
          ),
          Container(height: 21),
          // Wrap(
          //   spacing: 8,
          //   runSpacing: 8,
          //   children: getClassifiedResult(state)
          //       .where((e) => e.isNotEmpty)
          //       .map((e) => FormUtils.createChip(e))
          //       .toList(),
          // ),
        ],
      ),
    );
  }

  Widget createCheckupHistory(ChildrenInfoState state, BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 21, vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('Riwayat Periksa Kesehatan', style: AppTextStyle.sectionTitle),
          Container(height: 12),
          Wrap(
            spacing: 8,
            children: <Widget>[
              ...List.generate(
                state.medicalCheckup.length,
                (i) => FlatButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6),
                      side: BorderSide(color: Colors.black),
                    ),
                    child: Wrap(
                      direction: Axis.vertical,
                      spacing: 2,
                      children: <Widget>[
                        Text('Ke ${i + 1}', style: AppTextStyle.sectionTitle),
                        Text(
                          state.child.createdAt,
                          style: AppTextStyle.titleName.copyWith(fontSize: 10),
                        ),
                      ],
                    ),
                    onPressed: () {
                      showDialog(
                        context: context,
                        child: ChildMedicalCheckDialog(
                          i + 1,
                          initialData: state.medicalCheckup[i],
                        ),
                      );
                    }),
              ).reversed,
              FlatButton(
                padding: const EdgeInsets.all(0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6),
                ),
                color: ResColor.primaryColor,
                child: Icon(LineAwesomeIcons.plus, color: Colors.white),
                onPressed: () {
                  showDialog(
                    context: context,
                    child: ChildMedicalCheckDialog(
                      state.medicalCheckup.length + 1,
                      initialData: state.initialData,
                    ),
                  );
                  print(state.initialData);
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  List<String> getClassifiedResult(ChildrenInfoState state) => [
        ChildClassifier().classifyWeightByAge(state.lines),
      ];
}
