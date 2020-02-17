import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simpati/core/resources/app_color.dart';
import 'package:simpati/core/resources/app_text_style.dart';
import 'package:simpati/core/utils/form_utils.dart';
import 'package:simpati/presentation/mother/page/add_page/bloc.dart';

class Step2AddMother extends StatelessWidget {
  final VoidCallback onButtonClick;

  Step2AddMother({Key key, this.onButtonClick}) : super(key: key);

  final addressFocus = FocusNode();
  final cityFocus = FocusNode();

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<AddMotherBloc>(context);
    final focusScope = FocusScope.of(context);

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
                FormUtils.buildField(
                  'Nomor Telpon',
                  inputType: TextInputType.phone,
                  onChanged: (s) =>
                      bloc.mother = bloc.mother.copyWith(phone: s),
                  nextForm: NextForm(focusScope, addressFocus),
                ),
                Container(height: 8),
                FormUtils.buildField(
                  'Alamat',
                  focusNode: addressFocus,
                  onChanged: (s) =>
                      bloc.mother = bloc.mother.copyWith(address: s),
                ),
                Container(height: 8),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: FormUtils.buildField(
                        'Provinsi',
                        value: 'Jawa Barat',
                        nextForm: NextForm(focusScope, cityFocus),
                        onChanged: (s) =>
                            bloc.mother = bloc.mother.copyWith(province: s),
                      ),
                    ),
                    Container(width: 8),
                    Expanded(
                        child: FormUtils.buildField(
                      'Kota',
                      focusNode: cityFocus,
                      value: 'Sumedang',
                      onChanged: (s) =>
                          bloc.mother = bloc.mother.copyWith(city: s),
                    )),
                  ],
                ),
                Container(height: 8),
                // FormUtils.buildField('Titik Koordinat', isEnabled: false),
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
