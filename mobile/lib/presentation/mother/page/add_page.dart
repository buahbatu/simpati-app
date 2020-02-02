import 'package:flutter/material.dart';

class MotherAddPage extends StatelessWidget {
  Widget createAppBar(BuildContext context) {
    return AppBar(
      elevation: 0,
      title: Text('Tambah Ibu'),
      actions: <Widget>[
        FlatButton(
          textColor: Colors.white,
          child: Text('Simpan'),
          onPressed: () {},
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: createAppBar(context),
    );
  }
}
