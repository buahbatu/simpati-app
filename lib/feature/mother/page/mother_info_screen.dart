import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';
import 'package:recase/recase.dart';
import 'package:simpati/core/domain/model/child_info.dart';
import 'package:simpati/core/domain/model/mother_info.dart';
import 'package:simpati/core/framework/base_action.dart';
import 'package:simpati/core/framework/base_view.dart';
import 'package:simpati/core/resources/app_images.dart';
import 'package:simpati/core/resources/app_text_style.dart';
import 'package:simpati/core/resources/res_color.dart';
import 'package:simpati/core/resources/res_data_source.dart';
import 'package:simpati/core/utils/form_utils.dart';
import 'package:simpati/feature/repository/mother_repository.dart';

class MotherInfoState {
  MotherInfo motherInfo;
  ChildInfo childInfo;
  MotherInfoState({this.motherInfo, this.childInfo});
}

class MotherInfoAction
    extends BaseAction<MotherInfoScreen, MotherInfoAction, MotherInfoState> {
  final apiMotherRepo =
      Get.getRepository<MotherRepository>(ResDataSource.Remote);
  @override
  Future<MotherInfoState> initState() async {
    print(Get.arguments);
    // Future.wait([]);
    final result = await apiMotherRepo.getMotherById(Get.arguments);
    if (result.data.data.isNotEmpty) {}
    if (result.isSuccess) {
      final resultChild = await apiMotherRepo.getChildByIdMother(Get.arguments);
      return MotherInfoState(
          motherInfo: result.data, childInfo: resultChild.data);
    }
    return MotherInfoState();
  }
}

class MotherInfoScreen
    extends BaseView<MotherInfoScreen, MotherInfoAction, MotherInfoState> {
  @override
  MotherInfoAction initAction() {
    return MotherInfoAction();
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
      BuildContext context, MotherInfoAction action, MotherInfoState state) {
    return Scaffold(
      appBar: createAppBar(context),
      backgroundColor: ResColor.appBackground,
      body: state.motherInfo.data.isNotEmpty
          ? getContents(state.motherInfo, state.childInfo, context)
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

  Widget createAppBar(BuildContext context) {
    return AppBar(
      elevation: 0,
      iconTheme: IconThemeData(color: ResColor.primaryColor),
      titleSpacing: 0,
      backgroundColor: Colors.white,
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
            backgroundColor: ResColor.profileBgColor,
            child: Icon(LineAwesomeIcons.female, color: Colors.white, size: 24),
          ),
          Container(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text("alifia", style: AppTextStyle.registerTitle),
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
        Icon(LineAwesomeIcons.map_marker, size: 16, color: Colors.black38),
        Container(width: 4),
        Expanded(
          child: Text(
            "asasd",
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: AppTextStyle.titleName.copyWith(fontSize: 12),
          ),
        ),
      ],
    );
  }

  Widget getContents(
      MotherInfo motherInfo, ChildInfo childInfo, BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [
        createNameSection(),
        SizedBox(height: 8),
        createHealthCheckInfo(),
        SizedBox(height: 8),
        createPregnancyInfo(motherInfo, context),
        SizedBox(height: 8),
        createChildInfo(context, childInfo),
        SizedBox(height: 8),
        createPersonalInfo(),
        SizedBox(height: 8),
        createContactInfo(),
      ],
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
            onTap: () async {},
            child: FormUtils.buildField('Nomor Telpon',
                value: "123456",
                isEnabled: false,
                suffixIcon: Icon(LineAwesomeIcons.phone)),
          ),
          Container(height: 8),
          FormUtils.buildField(
            'Nama Suami',
            value: "suami 1",
            isEnabled: false,
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
            'NIK (Nomor Induk Kependudukan)',
            value: "212",
            isEnabled: false,
          ),
          Container(height: 8),
          FormUtils.buildField(
            'Tanggal Lahir',
            value: "21",
            isEnabled: false,
          ),
          Container(height: 8),
          Row(
            children: <Widget>[
              Expanded(
                child: FormUtils.buildField(
                  'Tinggi Badan',
                  value: "212",
                  suffix: 'cm',
                  isEnabled: false,
                ),
              ),
              Container(width: 8),
              Expanded(
                child: FormUtils.buildField(
                  'Golongan Darah',
                  value: "22",
                  isEnabled: false,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget createChildInfo(BuildContext context, ChildInfo state) {
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
              ...state.data.map((e) => createChildCircle(context, e)).toList(),
              SizedBox(
                height: 59,
                width: 59,
                child: FlatButton(
                  padding: const EdgeInsets.all(0),
                  shape: CircleBorder(),
                  color: ResColor.primaryColor,
                  child: Icon(LineAwesomeIcons.plus, color: Colors.white),
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget createChildCircle(BuildContext ctx, ChildInfoDatum e) {
    return Column(
      children: <Widget>[
        Material(
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              CircleAvatar(
                radius: 29.5,
                backgroundColor: ResColor.accentColor,
              ),
              CircleAvatar(
                radius: 27,
                backgroundColor: Colors.white,
              ),
              FlatButton(
                onPressed: () {},
                shape: CircleBorder(),
                color: ResColor.profileBgColor,
                padding: const EdgeInsets.all(7.5),
                child:
                    Icon(LineAwesomeIcons.child, color: Colors.white, size: 36),
              ),
            ],
          ),
        ),
        Container(height: 8, width: 1),
        Text(
          e.title,
          style: AppTextStyle.caption.copyWith(color: Colors.black),
        )
      ],
    );
  }

  Widget createPregnancyInfo(MotherInfo state, BuildContext context) {
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
                state.data[0].atribut.kehamilanKe.data.length,
                (i) => createPregnancyButton(
                    i, context, state.data[0].atribut.kehamilanKe.data[i]),
              ).reversed,
              FlatButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6),
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 10,
                ),
                color: ResColor.primaryColor,
                child: Icon(LineAwesomeIcons.plus, color: Colors.white),
                onPressed: () => null,
              ),
            ],
          ),
        ],
      ),
    );
  }

  FlatButton createPregnancyButton(
      int i, BuildContext ctx, IbuDatum pregnancy) {
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
            "1",
            style: AppTextStyle.titleName.copyWith(fontSize: 10),
          ),
        ],
      ),
      onPressed: () {
        return null;
      },
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
                    value: "1", isEnabled: false, suffix: 'Kg'),
                flex: 3,
              ),
              Container(width: 8),
              Flexible(
                child: FormUtils.buildField('Tekanan Darah',
                    value: "2", isEnabled: false, suffix: 'mmHg'),
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
}
