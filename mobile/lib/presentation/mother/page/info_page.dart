import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:simpati/core/utils/date_utils.dart';
import 'package:simpati/core/resources/app_color.dart';
import 'package:simpati/core/resources/app_text_style.dart';
import 'package:simpati/core/utils/form_utils.dart';
import 'package:simpati/domain/entity/mother.dart';

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
          createPersonalInfo(),
          Container(height: 8),
          createContactInfo(),
          Container(height: 8),
          createChildInfo(),
          Container(height: 8),
          createHealtCheckInfo(),
          Container(height: 8),
          createPregnancyInfo(),
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
          Text(initialData.fullName, style: AppTextStyle.registerTitle),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Icon(LineIcons.map_marker, size: 16, color: Colors.black38),
              Container(width: 4),
              Text(
                initialData.address,
                style: AppTextStyle.titleName.copyWith(fontSize: 12),
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
            'Tanggal Lahir',
            value: initialData.dateOfBirth.standardFormat(),
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
          FormUtils.buildField(
            'Nomor Telpon',
            value: initialData.phoneNumber,
            isEnabled: false,
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
              ...List.generate(
                initialData.childCount,
                (i) => createChildCircle('Alif'),
              ),
              createChildCircle('Tambah', isAdd: true),
            ],
          ),
        ],
      ),
    );
  }

  Widget createChildCircle(String name, {bool isAdd = false}) {
    return Column(
      children: <Widget>[
        Stack(
          alignment: Alignment.center,
          children: <Widget>[
            if (!isAdd)
              CircleAvatar(
                radius: 29.5,
                backgroundColor: AppColor.accentColor,
              ),
            if (!isAdd)
              CircleAvatar(
                radius: 27,
                backgroundColor: Colors.white,
              ),
            CircleAvatar(
              radius: isAdd ? 29.5 : 26,
              backgroundColor: isAdd ? AppColor.primaryColor : Colors.indigo,
              child: isAdd
                  ? Icon(LineIcons.plus, color: Colors.white)
                  : Text(name[0], style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
        Container(height: 8, width: 1),
        Text(name, style: AppTextStyle.caption.copyWith(color: Colors.black))
      ],
    );
  }

  Widget createHealtCheckInfo() {
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
                child: FormUtils.buildField('Berat Badan',
                    value: initialData.weight.toString(),
                    isEnabled: false,
                    suffix: 'Kg'),
              ),
              Container(width: 8),
              Expanded(
                child: FormUtils.buildField('Tekanan Darah',
                    value: '120/80', isEnabled: false, suffix: 'mmHg'),
              ),
            ],
          ),
          Container(height: 16),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: <Widget>[
              createChip('Berat Badan Ideal'),
              createChip('Gizi Baik'),
            ],
          ),
        ],
      ),
    );
  }

  Container createChip(String title) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12), color: AppColor.accentColor),
      child: Text(
        title,
        style: AppTextStyle.caption.copyWith(fontSize: 14),
      ),
    );
  }

  Widget createPregnancyInfo() {
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
            children: <Widget>[
              ...List.generate(
                initialData.childCount,
                (i) => FlatButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6),
                    side: BorderSide(color: Colors.black),
                  ),
                  child: Text('Kehamilan ke ${i + 1}'),
                  onPressed: () {},
                ),
              ),
              FlatButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6),
                ),
                color: AppColor.primaryColor,
                child: Text('Tambah', style: TextStyle(color: Colors.white)),
                onPressed: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}
