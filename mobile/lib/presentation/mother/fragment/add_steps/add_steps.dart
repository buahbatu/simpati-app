import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simpati/core/resources/app_color.dart';
import 'package:simpati/core/resources/app_text_style.dart';
import 'package:simpati/core/utils/date_utils.dart';
import 'package:simpati/core/utils/form_utils.dart';
import 'package:simpati/presentation/mother/page/add_page/bloc.dart';

class Step1AddMother extends StatefulWidget {
  final VoidCallback onButtonClick;

  const Step1AddMother({Key key, this.onButtonClick}) : super(key: key);

  @override
  _Step1AddMotherState createState() => _Step1AddMotherState();
}

class _Step1AddMotherState extends State<Step1AddMother> {
  final TextEditingController dateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<AddMotherBloc>(context);

    final focusScope = FocusScope.of(context);
    final nameFocus = FocusNode();
    final husbandFocus = FocusNode();

    return Padding(
      padding: const EdgeInsets.only(left: 21, right: 21, bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('Data Diri', style: AppTextStyle.registerTitle),
          Text(
            'Lengkapi data diri si Ibu dan pastikan dieja secara benar',
            style: AppTextStyle.titleName.copyWith(fontSize: 12),
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                Container(height: 24),
                FormUtils.buildField(
                  'NIK',
                  inputType: TextInputType.number,
                  nextForm: NextForm(focusScope, nameFocus),
                  onChanged: (s) => bloc.mother = bloc.mother.copyWith(nik: s),
                ),
                Container(height: 8),
                FormUtils.buildField(
                  'Nama Lengkap',
                  focusNode: nameFocus,
                  onChanged: (s) => bloc.mother = bloc.mother.copyWith(
                    fullName: s,
                  ),
                ),
                Container(height: 8),
                InkWell(
                  child: FormUtils.buildField(
                    'Tanggal Lahir',
                    controller: dateController,
                    isEnabled: false,
                  ),
                  onTap: () async {
                    final date = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(1940),
                      lastDate: DateTime(2080),
                    );
                    if (date != null) {
                      bloc.mother = bloc.mother.copyWith(birthDate: date);
                      setState(() {
                        dateController.text = date.standardFormat();
                      });
                    }
                    focusScope.requestFocus(husbandFocus);
                  },
                ),
                Container(height: 21),
                FormUtils.buildField(
                  'Nama Suami',
                  focusNode: husbandFocus,
                  onChanged: (s) => bloc.mother = bloc.mother.copyWith(
                    husbandName: s,
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            child: FlatButton(
              color: AppColor.primaryColor,
              textColor: Colors.white,
              onPressed: widget.onButtonClick,
              child: Text('Lanjut'),
            ),
          )
        ],
      ),
    );
  }
}

class Step2AddMother extends StatelessWidget {
  final VoidCallback onButtonClick;

  const Step2AddMother({Key key, this.onButtonClick}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 21, right: 21, bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('Alamat Tinggal', style: AppTextStyle.registerTitle),
          Text(
            'Tulis dengan detail untuk mempermudah kunjugan berikutnya',
            style: AppTextStyle.titleName.copyWith(fontSize: 12),
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                Container(height: 24),
                FormUtils.buildField('Nomor Telpon'),
                Container(height: 8),
                FormUtils.buildField('Alamat'),
                Container(height: 8),
                Row(
                  children: <Widget>[
                    Expanded(child: FormUtils.buildField('Provinsi')),
                    Container(width: 8),
                    Expanded(child: FormUtils.buildField('Kota')),
                  ],
                ),
                Container(height: 8),
                FormUtils.buildField('Titik Koordinat', isEnabled: false),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            child: FlatButton(
              color: AppColor.primaryColor,
              textColor: Colors.white,
              onPressed: onButtonClick,
              child: Text('Lanjut'),
            ),
          )
        ],
      ),
    );
  }
}

class Step3AddMother extends StatelessWidget {
  final VoidCallback onButtonClick;

  const Step3AddMother({Key key, this.onButtonClick}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                FormUtils.buildField('Tinggi Badan', suffix: 'cm'),
                Container(height: 8),
                FormUtils.buildField('Berat Badan', suffix: 'Kg'),
                Container(height: 8),
                FormUtils.buildField('Tekanan Darah'),
                Container(height: 8),
                FormUtils.buildField('Golongan Darah', isEnabled: false),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            child: FlatButton(
              color: AppColor.primaryColor,
              textColor: Colors.white,
              onPressed: () {},
              child: Text('Simpan'),
            ),
          )
        ],
      ),
    );
  }
}
