import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:line_icons/line_icons.dart';
import 'package:recase/recase.dart';
import 'package:simpati/core/bloc/scroll_fragment_bloc.dart';
import 'package:simpati/core/utils/form_utils.dart';
import 'package:simpati/core/utils/date_utils.dart';
import 'package:simpati/core/resources/app_color.dart';
import 'package:simpati/core/resources/app_text_style.dart';
import 'package:simpati/domain/entity/child.dart';
import 'package:simpati/domain/entity/mother.dart';
import 'package:simpati/domain/entity/pregnancy.dart';
import 'package:simpati/domain/repository/child_repository.dart';
import 'package:simpati/presentation/child/fragment/home/bloc.dart';
import 'package:simpati/presentation/child/page/add_page/screen.dart';
import 'package:simpati/presentation/child/page/info_page/screen.dart';
import 'package:simpati/presentation/mother/dialog/add_pregnancy_dialog.dart';
import 'package:simpati/presentation/pregnancy/fragment/bloc.dart';
import 'package:simpati/presentation/pregnancy/page/info_page.dart';
import 'package:url_launcher/url_launcher.dart';

class MotherInfoPage extends StatelessWidget {
  final Mother initialData;

  const MotherInfoPage(this.initialData, {Key key}) : super(key: key);

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
          createHealthCheckInfo(),
          Container(height: 8),
          createPregnancyInfo(),
          Container(height: 8),
          createChildInfo(),
          Container(height: 8),
          createPersonalInfo(),
          Container(height: 8),
          createContactInfo(),
        ],
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
            child: Icon(LineIcons.female, color: Colors.white, size: 24),
          ),
          Container(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(ReCase(initialData.fullName).titleCase,
                    style: AppTextStyle.registerTitle),
                Container(height: 3),
                createAddress(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget createAddress() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Icon(LineIcons.map_marker, size: 16, color: Colors.black38),
        Container(width: 4),
        Expanded(
          child: Text(
            ReCase(initialData.fullAddress).titleCase,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: AppTextStyle.titleName.copyWith(fontSize: 12),
          ),
        ),
      ],
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
            'NIK (Nomor Induk Kependudukan)',
            value: initialData.nik,
            isEnabled: false,
          ),
          Container(height: 8),
          FormUtils.buildField(
            'Tanggal Lahir',
            value: initialData.birthDate.standardFormat(),
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
                  'Golongan Darah',
                  value: initialData.bloodType,
                  isEnabled: false,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget createContactInfo() {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 21, vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('Informasi Kontak', style: AppTextStyle.sectionTitle),
          Container(height: 21),
          InkWell(
            onTap: () async {
              String phone = 'tel:${initialData.phone}';
              if (await canLaunch(phone)) {
                await launch(phone);
              } else {
                throw 'Nomor tidak valid ${initialData.phone}';
              }
            },
            child: FormUtils.buildField('Nomor Telpon',
                value: initialData.phone,
                isEnabled: false,
                suffixIcon: Icon(LineIcons.phone)),
          ),
          Container(height: 8),
          FormUtils.buildField(
            'Nama Suami',
            value: initialData.husbandName,
            isEnabled: false,
          ),
        ],
      ),
    );
  }

  Widget createChildInfo() {
    final bloc = ChildBloc(ChildFilter('idMother', initialData.id))
      ..add(Init());
    return BlocBuilder<ChildBloc, ScrollFragmentState<Child>>(
      bloc: bloc,
      builder: (ctx, state) {
        return Container(
          color: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 21, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('Daftar Anak', style: AppTextStyle.sectionTitle),
              Container(height: 21),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: <Widget>[
                  ...state.items.map((e) => createChildCircle(ctx, e)).toList(),
                  SizedBox(
                    height: 59,
                    width: 59,
                    child: FlatButton(
                      padding: const EdgeInsets.all(0),
                      shape: CircleBorder(),
                      color: AppColor.primaryColor,
                      child: Icon(LineIcons.plus, color: Colors.white),
                      onPressed: () async {
                        final child =
                            await Navigator.of(ctx).push(MaterialPageRoute(
                          builder: (ctx) => ChildAddPage(momData: initialData),
                        ));

                        if (child != null && child is Child) {
                          Scaffold.of(ctx).showSnackBar(
                            SnackBar(
                              content: Text('Anak berhasil ditambahkan'),
                              backgroundColor: Colors.green,
                            ),
                          );
                          bloc.add(Add(child));
                        }
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  Widget createChildCircle(BuildContext ctx, Child child) {
    return Column(
      children: <Widget>[
        Material(
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              CircleAvatar(
                radius: 29.5,
                backgroundColor: AppColor.accentColor,
              ),
              CircleAvatar(
                radius: 27,
                backgroundColor: Colors.white,
              ),
              FlatButton(
                onPressed: () {
                  Navigator.of(ctx).push(MaterialPageRoute(
                    builder: (ctx) => ChildInfoPage(child),
                  ));
                },
                shape: CircleBorder(),
                color: AppColor.profileBgColor,
                padding: const EdgeInsets.all(7.5),
                child: Icon(LineIcons.child, color: Colors.white, size: 36),
              ),
            ],
          ),
        ),
        Container(height: 8, width: 1),
        Text(
          child.firstName,
          style: AppTextStyle.caption.copyWith(color: Colors.black),
        )
      ],
    );
  }

  Widget createHealthCheckInfo() {
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
              Flexible(
                child: FormUtils.buildField('Berat Badan',
                    value: initialData.weight.toString(),
                    isEnabled: false,
                    suffix: 'Kg'),
                flex: 3,
              ),
              Container(width: 8),
              Flexible(
                child: FormUtils.buildField('Tekanan Darah',
                    value: initialData.bloodPressure,
                    isEnabled: false,
                    suffix: 'mmHg'),
                flex: 4,
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

  Widget createPregnancyInfo() {
    final bloc = PregnancyListBloc(initialData)..add(Init());
    return BlocBuilder<PregnancyListBloc, ScrollFragmentState<Pregnancy>>(
      bloc: bloc,
      builder: (ctx, state) {
        return Container(
          color: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 21, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('Riwayat Kehamilan', style: AppTextStyle.sectionTitle),
              Container(height: 21),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: <Widget>[
                  ...List.generate(
                    state.items.length,
                    (i) => createPregnancyButton(i, ctx, state.items[i]),
                  ).reversed,
                  FlatButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 10,
                    ),
                    color: AppColor.primaryColor,
                    child: Icon(LineIcons.plus, color: Colors.white),
                    onPressed: () => showDialog(
                      context: ctx,
                      child: AddPregnancyDialog(
                        state.items.length + 1,
                        initialData,
                        bloc,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  FlatButton createPregnancyButton(
    int i,
    BuildContext ctx,
    Pregnancy pregnancy,
  ) {
    return FlatButton(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 8,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(6),
        side: BorderSide(color: Colors.black),
      ),
      child: Wrap(
        direction: Axis.vertical,
        spacing: 2,
        children: <Widget>[
          Text('Ke ${i + 1}', style: AppTextStyle.itemTitle),
          Text(
            pregnancy.lastMenstruation.year.toString(),
            style: AppTextStyle.titleName.copyWith(fontSize: 10),
          ),
        ],
      ),
      onPressed: () {
        Navigator.of(ctx).push(MaterialPageRoute(
          builder: (ctx) => PregnancyInfoPage(i, initialData, pregnancy),
        ));
      },
    );
  }
}
