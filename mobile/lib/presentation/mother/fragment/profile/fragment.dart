import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class MotherProfileFragment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Form(
      child: ListView(
        padding: const EdgeInsets.only(left: 16, right: 16, bottom: 8),
        shrinkWrap: true,
        children: <Widget>[
          Container(height: 21),
          CircleAvatar(
            radius: 64,
            backgroundColor: Colors.black26,
            child: Icon(LineIcons.female, color: Colors.white, size: 42),
          ),
          // buildField('Nama Lengkap'),
          // buildField('Nama Suami'),
          // buildField('Nomor Telpon'),

          // buildField('Alamat'),
          // buildField('Provinsi'),
          // buildField('Kota'),
          // buildField('Titik Koordinat', isEnabled: false),

          // buildField('Tinggi Badan', suffix: 'cm'),
          // buildField('Berat Badan', suffix: 'Kg'),
          // buildField('Tekanan Darah'),
          // buildField('Golongan Darah', isEnabled: false),
          // buildField('Tekanan Darah'),
        ],
      ),
    );
  }

  TextFormField buildField(
    String label, {
    bool isEnabled = true,
    String suffix,
  }) {
    return TextFormField(
      maxLines: 1,
      textInputAction: TextInputAction.next,
      enabled: isEnabled,
      decoration: InputDecoration(
        labelText: label,
        alignLabelWithHint: true,
        isDense: true,
        suffixText: suffix,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
        ),
      ),
    );
  }
}
