import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:line_icons/line_icons.dart';
import 'package:recase/recase.dart';
import 'package:simpati/core/bloc/scroll_fragment_bloc.dart';
import 'package:simpati/core/classifier/child_classifier.dart';
import 'package:simpati/core/utils/date_utils.dart';
import 'package:simpati/core/resources/app_color.dart';
import 'package:simpati/core/resources/app_text_style.dart';
import 'package:simpati/core/utils/form_utils.dart';
import 'package:simpati/domain/entity/child.dart';
import 'package:simpati/domain/entity/immunization.dart';
import 'package:simpati/presentation/child/fragment/immunization/bloc.dart';
import 'package:simpati/presentation/child/fragment/immunization/dialog.dart';
import 'package:simpati/presentation/child/item/bloc.dart';
import 'package:simpati/presentation/child/item/growth_chart.dart';
import 'package:simpati/presentation/child/fragment/med_check/dialog.dart';

class ChildInfoPage extends StatelessWidget {
  final Child initialData;

  const ChildInfoPage(this.initialData, {Key key}) : super(key: key);

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
      body: BlocProvider(
        create: (ctx) => ChildInfoBloc(
          initialData,
          DefaultAssetBundle.of(context),
        )..add(ChildInfoEvent()),
        child: ListView(
          shrinkWrap: true,
          children: [
            createNameSection(),
            Container(height: 8),
            createPersonalInfo(),
            Container(height: 8),
            createHealthInfo(),
            Container(height: 8),
            createWeightHistory(),
            Container(height: 8),
            createCheckupHistory(),
            Container(height: 8),
            createImmunizationHistory(),
          ],
        ),
      ),
    );
  }

  Widget createNameSection() {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.only(left: 21, right: 21, bottom: 16),
      child: Row(
        children: <Widget>[
          CircleAvatar(
            radius: 24,
            backgroundColor: AppColor.profileBgColor,
            child: Icon(LineIcons.child, color: Colors.white, size: 28),
          ),
          Container(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(ReCase(initialData.fullName).titleCase,
                  style: AppTextStyle.registerTitle),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Icon(LineIcons.female, size: 16, color: Colors.black38),
                  Container(width: 4),
                  Text(
                    initialData?.momName,
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

  Widget createPersonalInfo() {
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
            value: initialData.momName,
            isEnabled: false,
          ),
          Container(height: 8),
          FormUtils.buildField(
            'Tanggal Lahir',
            value: initialData.birthDate.standardFormat(),
            isEnabled: false,
          ),
          Container(height: 8),
          FormUtils.buildField(
            'Golongan Darah',
            value: initialData.bloodType,
            isEnabled: false,
          ),
        ],
      ),
    );
  }

  Widget createWeightHistory() {
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
          GrowthChart(child: initialData),
        ],
      ),
    );
  }

  Widget createCheckupHistory() {
    return BlocBuilder<ChildInfoBloc, ChildInfoState>(builder: (ctx, state) {
      final bloc = BlocProvider.of<ChildInfoBloc>(ctx);
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
                  state.checks.length,
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
                          state.checks[i].createdAt.standardShortFormat(),
                          style: AppTextStyle.titleName.copyWith(fontSize: 10),
                        ),
                      ],
                    ),
                    onPressed: () => showDialog(
                      context: ctx,
                      child: ChildMedicalCheckDialog(
                        i + 1,
                        bloc,
                        initialData,
                        initialData: state.checks[i],
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
                      child: ChildMedicalCheckDialog(
                        state.checks.length + 1,
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

  List<String> getClassifiedResult(ChildInfoState state) => [
        ChildClassifier(initialData).classifyWeightByAge(state.lines),
      ];

  Widget createHealthInfo() {
    return BlocBuilder<ChildInfoBloc, ChildInfoState>(
        builder: (context, state) {
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
                    value: initialData.height.toString(),
                    isEnabled: false,
                    suffix: 'cm',
                  ),
                ),
                Container(width: 8),
                Expanded(
                  child: FormUtils.buildField('Berat Badan',
                      value: initialData.weight.toString(),
                      isEnabled: false,
                      suffix: 'Kg'),
                ),
              ],
            ),
            Container(height: 8),
            Row(
              children: <Widget>[
                Expanded(
                  child: FormUtils.buildField(
                    'Suhu Badan',
                    value: initialData.temperature.toString(),
                    isEnabled: false,
                    suffix: '°C',
                  ),
                ),
                Container(width: 8),
                Expanded(
                  child: FormUtils.buildField(
                    'Lingkar Kepala',
                    value: initialData.headSize.toString(),
                    isEnabled: false,
                    suffix: 'cm',
                  ),
                ),
              ],
            ),
            Container(height: 21),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: getClassifiedResult(state)
                  .where((e) => e.isNotEmpty)
                  .map((e) => FormUtils.createChip(e))
                  .toList(),
            ),
          ],
        ),
      );
    });
  }

  Widget createImmunizationHistory() {
    return BlocProvider(
      create: (ctx) => ImmunizationListBloc(initialData)..add(Init()),
      child:
          BlocBuilder<ImmunizationListBloc, ScrollFragmentState<Immunization>>(
        builder: (ctx, state) {
          final bloc = BlocProvider.of<ImmunizationListBloc>(ctx);
          return Container(
            color: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 21, vertical: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('Riwayat Imunisasi', style: AppTextStyle.sectionTitle),
                Container(height: 12),
                Wrap(
                  spacing: 8,
                  children: state.items
                      .map((e) => createImunCard(ctx, bloc, e))
                      .toList(),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  FlatButton createImunCard(
    BuildContext ctx,
    ImmunizationListBloc bloc,
    Immunization immun,
  ) {
    final isDone = immun.createdAt != null;
    final color = isDone ? AppColor.primaryColor : Colors.black38;

    final start = initialData.birthDate
        .add(Duration(days: 31 * immun.config.startMonth))
        .monthYearFormat();

    final end = initialData.birthDate
        .add(Duration(days: 31 * immun.config.endMonth))
        .monthYearFormat();

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
                Text(immun.config.title, style: TextStyle(color: color)),
                if (isDone)
                  Text(
                    immun.createdAt.standardFormat(),
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
          if (isDone) Icon(LineIcons.check, color: color),
        ],
      ),
      onPressed: isDone
          ? null
          : () {
              showDialog(
                context: ctx,
                child: ChildImmunizationDialog(bloc, initialData, immun),
              );
            },
    );
  }
}