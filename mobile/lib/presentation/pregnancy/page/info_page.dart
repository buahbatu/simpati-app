import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:line_icons/line_icons.dart';
import 'package:simpati/core/bloc/scroll_fragment_bloc.dart';
import 'package:simpati/core/resources/app_color.dart';
import 'package:simpati/core/resources/app_text_style.dart';
import 'package:simpati/core/utils/date_utils.dart';
import 'package:simpati/core/utils/form_utils.dart';
import 'package:simpati/domain/entity/mother.dart';
import 'package:simpati/domain/entity/pregnancy.dart';
import 'package:simpati/domain/entity/pregnancy_check.dart';
import 'package:simpati/presentation/mother/dialog/med_check.dart';
import 'package:simpati/presentation/pregnancy/page/bloc.dart';

class PregnancyInfoPage extends StatelessWidget {
  final int index;

  final Mother initialMom;
  final Pregnancy initialData;

  const PregnancyInfoPage(
    this.index,
    this.initialMom,
    this.initialData, {
    Key key,
  }) : super(key: key);

  Widget createAppBar(BuildContext context) {
    return AppBar(
      elevation: 0,
      iconTheme: IconThemeData(color: AppColor.primaryColor),
      titleSpacing: 0,
      backgroundColor: Colors.white,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: createAppBar(context),
      backgroundColor: AppColor.appBackground,
      body: ListView(
        shrinkWrap: true,
        children: [
          createNameSection(),
          Container(height: 8),
          createPersonalInfo(),
          Container(height: 8),
          createPredictionInfo(),
          Container(height: 8),
          createCheckupHistory(),
        ],
      ),
    );
  }

  Widget createNameSection() {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.only(left: 21, right: 21, bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('Kehamilan ke ${index + 1}', style: AppTextStyle.registerTitle),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Icon(LineIcons.female, size: 16, color: Colors.black38),
              Container(width: 4),
              Text(
                initialMom.fullName,
                style: AppTextStyle.titleName.copyWith(fontSize: 12),
              ),
            ],
          ),
          Container(height: 8),
          Text(
            'Perkiraan Lahir 23 Agustus 2019',
            style: AppTextStyle.titleName.copyWith(fontSize: 12),
          ),
        ],
      ),
    );
  }

  Widget createPersonalInfo() {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 21, vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('Kondisi Tubuh Ibu', style: AppTextStyle.sectionTitle),
          Container(height: 21),
          FormUtils.buildField(
            'Tanggal Terakhir Menstruasi',
            value: initialData.lastMenstruation.standardFormat(),
            isEnabled: false,
          ),
          Container(height: 8),
          FormUtils.buildField(
            'Tekanan Darah',
            value: initialData.bloodPressure,
            suffix: 'mmHg',
            isEnabled: false,
          ),
          Container(height: 8),
          Row(
            children: <Widget>[
              Expanded(
                child: FormUtils.buildField(
                  'Tinggi Badan',
                  value: initialData.height.toString(),
                  suffix: 'cm',
                  isEnabled: false,
                ),
              ),
              Container(width: 8),
              Expanded(
                child: FormUtils.buildField(
                  'Berat Badan',
                  value: initialData.weight.toString(),
                  suffix: 'Kg',
                  isEnabled: false,
                ),
              ),
            ],
          ),
          Container(height: 16),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: <Widget>[
              FormUtils.createChip('Berat Ideal'),
              FormUtils.createChip('Gizi Baik'),
            ],
          ),
        ],
      ),
    );
  }

  Widget createPredictionInfo() {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 21, vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('Kondisi Kandungan', style: AppTextStyle.sectionTitle),
          Container(height: 21),
          FormUtils.buildField(
            'Tanggal Perkiraan Lahir',
            value: DateTime.now().standardFormat(),
            isEnabled: false,
          ),
          Container(height: 8),
          Row(
            children: <Widget>[
              Flexible(
                child: FormUtils.buildField(
                  'Perkiraan Jenis Kelamin',
                  value: 'Laki - Laki',
                  isEnabled: false,
                ),
                flex: 5,
              ),
              Container(width: 8),
              Flexible(
                child: FormUtils.buildField(
                  'Berat Janin',
                  value: initialData.weight.toString(),
                  suffix: 'g',
                  isEnabled: false,
                ),
                flex: 3,
              ),
            ],
          ),
          Container(height: 16),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: <Widget>[
              FormUtils.createChip('Air Ketuban Baik'),
            ],
          ),
        ],
      ),
    );
  }

  Widget createCheckupHistory() {
    final bloc = PregnancyCheckBloc(initialMom, initialData)..add(Init());
    return BlocBuilder<PregnancyCheckBloc, ScrollFragmentState<PregnancyCheck>>(
        bloc: bloc,
        builder: (ctx, state) {
          return Container(
            color: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 21, vertical: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('Riwayat Periksa Kesehatan',
                    style: AppTextStyle.sectionTitle),
                Container(height: 12),
                Wrap(
                  spacing: 8,
                  children: <Widget>[
                    ...List.generate(
                      state.items.length,
                      (i) => FlatButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6),
                          side: BorderSide(color: Colors.black),
                        ),
                        child: Wrap(
                          direction: Axis.vertical,
                          spacing: 2,
                          children: <Widget>[
                            Text('Ke ${i + 1}', style: AppTextStyle.itemTitle),
                            Text(state.items[i].createdAt.standardShortFormat(),
                                style: AppTextStyle.titleName
                                    .copyWith(fontSize: 10)),
                          ],
                        ),
                        onPressed: () => showDialog(
                          context: ctx,
                          child: PregnancyMedicalCheckDialog(
                            state.items.length + 1,
                            bloc,
                            initialData,
                            initialData: state.items[i],
                          ),
                        ),
                      ),
                    ).reversed,
                    FlatButton(
                      padding: const EdgeInsets.all(0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6),
                      ),
                      color: AppColor.primaryColor,
                      child: Icon(LineIcons.plus, color: Colors.white),
                      onPressed: () {
                        showDialog(
                          context: ctx,
                          child: PregnancyMedicalCheckDialog(
                            state.items.length + 1,
                            bloc,
                            initialData,
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
          );
        });
  }
}
